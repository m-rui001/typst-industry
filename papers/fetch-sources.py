"""Download and inventory original v1 source submissions for indexed arXiv papers."""

from argparse import ArgumentParser
import gzip
import json
from pathlib import Path
import re
import shutil
import tarfile
import time

import requests


DIRECTORY = Path(__file__).resolve().parent
INDEX = DIRECTORY / "arxiv-applied-physics-2025-11-to-2026-11.json"
DATE_CACHE = DIRECTORY / "first-submission-dates.jsonl"
HOST = "https://export.arxiv.org"


def inspect(path):
    with path.open("rb") as stream:
        header = stream.read(1024)
    if header.startswith(b"%PDF-"):
        return "pdf-only", []
    if tarfile.is_tarfile(path):
        with tarfile.open(path) as archive:
            tex = [
                member.name for member in archive
                if member.isfile() and Path(member.name).suffix.lower() in {".tex", ".ltx"}
            ]
        return ("tex-archive" if tex else "archive-without-tex"), tex
    if header.startswith(b"\x1f\x8b"):
        with gzip.open(path, "rb") as stream:
            header = stream.read(8192)
        if header.startswith(b"%PDF-"):
            return "compressed-pdf", []
        if re.search(rb"\\(?:(?:documentclass|documentstyle|input)\b|begin\{document\})", header):
            return "compressed-tex", ["source.tex"]
    if re.search(rb"\\(?:documentclass|documentstyle|input)\b", header):
        return "tex", ["source.tex"]
    raise ValueError("Unrecognized source response")


def store_metadata(path, source_url, kind, tex):
    pending = path.with_suffix(".json.tmp")
    pending.write_text(
        json.dumps({"source_url": source_url, "kind": kind, "tex_files": tex},
                   ensure_ascii=False, indent=2) + "\n",
        encoding="utf-8",
    )
    pending.replace(path)


def fetch(session, paper):
    identifier = paper["id"]
    folder = DIRECTORY / identifier
    folder.mkdir(exist_ok=True)
    endpoint = f"{HOST}/src/{identifier}v1"
    receipt = folder / "source.json"
    if receipt.is_file():
        return json.loads(receipt.read_text(encoding="utf-8"))["kind"]

    pending = folder / "submission.part"
    with session.get(endpoint, timeout=(15, 90), stream=True) as response:
        response.raise_for_status()
        with pending.open("wb") as stream:
            for chunk in response.iter_content(64 * 1024):
                stream.write(chunk)
    kind, tex = inspect(pending)
    if kind == "tex":
        pending.replace(folder / "source.tex")
    elif kind == "pdf-only":
        pending.replace(folder / "original.pdf")
    elif kind in {"compressed-tex", "compressed-pdf"}:
        unpacked = folder / "submission.unpacked"
        with gzip.open(pending, "rb") as source, unpacked.open("wb") as output:
            shutil.copyfileobj(source, output)
        unpacked.replace(folder / ("source.tex" if tex else "original.pdf"))
        pending.unlink()
    else:
        pending.replace(folder / "source.tar.gz")
    store_metadata(receipt, endpoint, kind, tex)
    return kind


def main():
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("ids", nargs="*", help="arXiv identifiers from the annual index")
    parser.add_argument("--verified-pending", action="store_true",
                        help="download uncached originals with a verified in-range v1 date")
    parser.add_argument("--limit", type=int, help="maximum number of selected IDs")
    args = parser.parse_args()
    if bool(args.ids) == args.verified_pending:
        parser.error("provide IDs or --verified-pending")
    if args.limit is not None and args.limit < 0:
        parser.error("--limit must be nonnegative")
    index = json.loads(INDEX.read_text(encoding="utf-8"))
    papers = {paper["id"]: paper for paper in index["papers"]}
    invalid = set(args.ids) - papers.keys()
    if invalid:
        parser.error(f"IDs missing from the index: {', '.join(sorted(invalid))}")
    selected = list(dict.fromkeys(args.ids))
    if args.verified_pending:
        dates = dict(json.loads(line) for line in DATE_CACHE.read_text(encoding="utf-8").splitlines())
        lo, hi = index["requested_dates"]
        selected = [
            identifier for identifier in papers
            if identifier in dates
            and lo <= dates[identifier] <= hi
            and not (DIRECTORY / identifier / "source.json").is_file()
        ]
    selected = selected[:args.limit]
    print(f"{len(selected)} submissions selected", flush=True)
    errors = 0
    with requests.Session() as session:
        for number, identifier in enumerate(selected):
            if number:
                time.sleep(3)
            try:
                print(f"{identifier} {fetch(session, papers[identifier])}", flush=True)
            except requests.HTTPError as exc:
                if exc.response.status_code in {429, 503}:
                    raise SystemExit(f"{identifier} {exc}; source server requested a pause")
                print(f"{identifier} {exc}", flush=True)
                errors += 1
            except (requests.RequestException, OSError, ValueError, tarfile.TarError) as exc:
                print(f"{identifier} {exc}", flush=True)
                errors += 1
    if errors:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
