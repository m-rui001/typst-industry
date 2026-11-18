"""Cache UTC v1 submission dates for the arXiv monthly index."""

from argparse import ArgumentParser
from datetime import date, timezone
from email.utils import parsedate_to_datetime
import json
from pathlib import Path
import time
import xml.etree.ElementTree as ET

import requests


HERE = Path(__file__).resolve().parent
INDEX = HERE / "arxiv-applied-physics-2025-11-to-2026-11.json"
CACHE = HERE / "first-submission-dates.jsonl"
ENDPOINT = "https://export.arxiv.org/oai2"


def submission_date(session, identifier):
    response = session.get(ENDPOINT, params={
        "verb": "GetRecord",
        "metadataPrefix": "arXivRaw",
        "identifier": f"oai:arXiv.org:{identifier}",
    }, timeout=25)
    response.raise_for_status()
    xml = ET.fromstring(response.content)
    record = xml.find(".//{*}metadata/{*}arXivRaw")
    if record is None or record.findtext("{*}id") != identifier:
        raise ValueError(f"{identifier}: missing or mismatched arXivRaw record")
    timestamp = record.findtext("{*}version[@version='v1']/{*}date")
    if not timestamp:
        raise ValueError(f"{identifier}: OAI metadata has no v1 submission date")
    return parsedate_to_datetime(timestamp).astimezone(timezone.utc).date().isoformat()


def write_verified_index(path, index, dates):
    lo, hi = index["requested_dates"]
    checked = [p for p in index["papers"] if p["id"] in dates]
    papers = []
    for paper in checked:
        submitted = date.fromisoformat(dates[paper["id"]]).isoformat()
        if lo <= submitted <= hi:
            papers.append({**paper, "first_submission_date_utc": submitted})
    verified = {
        **index,
        "date_precision": "first submission date (UTC), verified records only",
        "candidate_count": len(index["papers"]),
        "verified_count": len(checked),
        "excluded_by_date": len(checked) - len(papers),
        "pending_count": len(index["papers"]) - len(checked),
        "papers": papers,
    }
    pending = path.with_suffix(".json.tmp")
    pending.write_text(json.dumps(verified, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    pending.replace(path)


def main():
    cli = ArgumentParser(description=__doc__)
    cli.add_argument("--limit", type=int, help="maximum uncached IDs to check in this run")
    cli.add_argument("--verified-index", type=Path, help="write cached in-range records to this JSON file")
    args = cli.parse_args()
    index = json.loads(INDEX.read_text(encoding="utf-8"))
    dates = {}
    if CACHE.exists():
        dates = dict(json.loads(line) for line in CACHE.read_text(encoding="utf-8").splitlines())
    lo, hi = index["requested_dates"]
    edges = {lo[:7], hi[:7]}
    ordered = sorted(index["papers"], key=lambda p: p["listing_month"] not in edges)
    pending = [p["id"] for p in ordered if p["id"] not in dates][:args.limit]
    print(f"{len(dates)} cached, {len(pending)} to check", flush=True)
    errors = 0
    with requests.Session() as session, CACHE.open("a", encoding="utf-8") as cache:
        for number, identifier in enumerate(pending):
            if number:
                time.sleep(3)
            submitted = None
            for attempt in range(3):
                try:
                    submitted = submission_date(session, identifier)
                    break
                except requests.HTTPError as exc:
                    if exc.response.status_code in {429, 503}:
                        if args.verified_index:
                            write_verified_index(args.verified_index, index, dates)
                        raise SystemExit(f"{identifier}: {exc}; metadata server requested a pause")
                    print(f"{identifier}: {exc}", flush=True)
                    break
                except (requests.ConnectionError, requests.Timeout) as exc:
                    if attempt < 2:
                        time.sleep(5 * (attempt + 1))
                    else:
                        print(f"{identifier}: {exc}", flush=True)
                except (requests.RequestException, ValueError, ET.ParseError) as exc:
                    print(f"{identifier}: {exc}", flush=True)
                    break
            if submitted is None:
                errors += 1
                continue
            print(json.dumps([identifier, submitted]), file=cache, flush=True)
            print(f"{identifier} {submitted} {'in range' if lo <= submitted <= hi else 'outside range'}",
                  flush=True)
            dates[identifier] = submitted
    if args.verified_index:
        write_verified_index(args.verified_index, index, dates)
    if errors:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
