#!/usr/bin/env python3
"""Sync skill-style CSV columns from same-name English columns.

Example pairs:
    skillName <- skillName_en
    describe <- describe_en
    simDesc <- simDesc_en

By default this skips the first three metadata rows:
1. 变量名
2. 默认值
3. 字段说明
"""

from __future__ import annotations

import argparse
import csv
import re
from collections import Counter
from pathlib import Path

CJK_RE = re.compile(r"[\u3400-\u9fff]")


def has_cjk(value: str) -> bool:
    return bool(CJK_RE.search(value))


def detect_encoding(path: Path) -> str:
    data = path.read_bytes()
    if data.startswith(b"\xef\xbb\xbf"):
        return "utf-8-sig"
    try:
        data.decode("utf-8")
        return "utf-8"
    except UnicodeDecodeError:
        return "gb18030"


def detect_lineterminator(path: Path) -> str:
    data = path.read_bytes()
    return "\r\n" if b"\r\n" in data else "\n"


def build_pairs(header: list[str]) -> list[tuple[str, int, int]]:
    pairs: list[tuple[str, int, int]] = []
    index_by_name = {name: idx for idx, name in enumerate(header)}
    for en_name, en_idx in index_by_name.items():
        if not en_name.endswith("_en"):
            continue
        base_name = en_name[:-3]
        base_idx = index_by_name.get(base_name)
        if base_idx is None:
            continue
        pairs.append((base_name, base_idx, en_idx))
    return pairs


def sync(args: argparse.Namespace) -> int:
    encoding = args.encoding or detect_encoding(args.target)
    lineterminator = detect_lineterminator(args.target)

    with args.target.open(newline="", encoding=encoding) as handle:
        rows = list(csv.reader(handle))

    if not rows:
        print("rows=0")
        return 0

    pairs = build_pairs(rows[0])
    if not pairs:
        print("pairs=0")
        return 0

    updates: Counter[str] = Counter()
    unchanged: Counter[str] = Counter()
    missing_en: Counter[str] = Counter()
    remaining_cjk: Counter[str] = Counter()
    touched_rows = 0

    for row in rows[args.skip_rows :]:
        if not row or not any(row):
            continue
        touched_rows += 1
        for base_name, base_idx, en_idx in pairs:
            if len(row) <= max(base_idx, en_idx):
                continue
            source = row[en_idx].strip()
            target = row[base_idx]
            if not source:
                if has_cjk(target):
                    missing_en[base_name] += 1
                continue
            if target == source:
                unchanged[base_name] += 1
                continue
            row[base_idx] = source
            updates[base_name] += 1

    for row in rows[args.skip_rows :]:
        if not row or not any(row):
            continue
        for base_name, base_idx, _ in pairs:
            if len(row) <= base_idx:
                continue
            if has_cjk(row[base_idx]):
                remaining_cjk[base_name] += 1

    print(f"encoding={encoding}")
    print(f"skip_rows={args.skip_rows}")
    print(f"pairs={len(pairs)}")
    print("pair_names=" + ",".join(base_name for base_name, _, _ in pairs))
    print(f"data_rows={touched_rows}")
    print(f"total_updates={sum(updates.values())}")
    for base_name, _, _ in pairs:
        print(
            f"column={base_name} updates={updates[base_name]} "
            f"unchanged={unchanged[base_name]} missing_en={missing_en[base_name]} "
            f"remaining_cjk={remaining_cjk[base_name]}"
        )

    if args.dry_run:
        return 0

    with args.target.open("w", newline="", encoding=encoding) as handle:
        writer = csv.writer(handle, lineterminator=lineterminator)
        writer.writerows(rows)

    return 0


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", type=Path, required=True)
    parser.add_argument("--encoding", default="")
    parser.add_argument("--skip-rows", type=int, default=3)
    parser.add_argument("--dry-run", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    raise SystemExit(sync(parse_args()))
