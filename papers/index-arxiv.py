"""Index the arXiv Applied Physics monthly listings, including cross-lists."""

from argparse import ArgumentParser
from datetime import date, timedelta
import json
from pathlib import Path
import re
import time

from bs4 import BeautifulSoup
import requests


def months(start, end):
    month = start.replace(day=1)
    while month <= end:
        yield month
        month = (month.replace(day=28) + timedelta(days=4)).replace(day=1)


def listing(session, month):
    url = f"https://arxiv.org/list/physics.app-ph/{month:%Y-%m}"
    response = session.get(url, params={"skip": 0, "show": 2000}, timeout=30)
    response.raise_for_status()
    page = BeautifulSoup(response.content, "html.parser")
    total = re.search(r"Total of\s+([\d,]+)\s+entries", page.get_text(" ", strip=True))
    if total is None:
        raise ValueError(f"Missing entry count on {url}")

    records = []
    for title in page.select(".list-title"):
        entry = title.find_parent("dd")
        links = entry.find_previous_sibling("dt")
        identifier = links.select_one('a[href^="/abs/"]')["href"].split("/abs/", 1)[1]
        for descriptor in entry.select(".descriptor"):
            descriptor.decompose()
        subjects = entry.select_one(".list-subjects")
        records.append({
            "id": identifier,
            "title": title.get_text(" ", strip=True),
            "subjects": re.findall(r"\(([\w.-]+)\)", subjects.get_text(" ", strip=True)),
            "listing_month": month.strftime("%Y-%m"),
            "abstract_url": f"https://arxiv.org/abs/{identifier}",
            "source_url": f"https://arxiv.org/src/{identifier}",
        })
    expected = int(total[1].replace(",", ""))
    if expected != len(records):
        raise ValueError(f"{url}: expected {expected} entries, parsed {len(records)}")
    return records


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("--start", type=date.fromisoformat, required=True)
    parser.add_argument("--end", type=date.fromisoformat, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.start > args.end:
        parser.error("--start must precede --end")

    # Edge months are included in full. The monthly page has no submission day.
    result = {}
    with requests.Session() as session:
        for count, month in enumerate(months(args.start, args.end)):
            if count:
                time.sleep(3)
            entries = listing(session, month)
            result.update((entry["id"], entry) for entry in entries)
            print(f"{month:%Y-%m}: {len(entries)}", flush=True)

    index = {
        "requested_dates": [args.start.isoformat(), args.end.isoformat()],
        "date_precision": "listing month; boundary months are unfiltered",
        "category": "physics.app-ph",
        "includes_cross_lists": True,
        "papers": list(result.values()),
    }
    pending = args.output.with_suffix(".json.tmp")
    pending.write_text(json.dumps(index, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    pending.replace(args.output)


if __name__ == "__main__":
    main()
