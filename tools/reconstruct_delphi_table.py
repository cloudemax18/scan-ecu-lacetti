#!/usr/bin/env python3
"""Extract the static 36-byte parameter descriptors from CheviExplorer 1.8.

This is a read-only reverse-engineering helper. It does not run the executable
or communicate with a vehicle.
"""
from __future__ import annotations

import argparse
import json
import struct
from pathlib import Path

TABLE_VA = 0x004F22AC
ENTRY_SIZE = 0x24
ENTRY_COUNT = 0x178
TARGET_SELECTORS = (0x12, 0x22)


def u16(buf: bytes, off: int) -> int:
    return struct.unpack_from("<H", buf, off)[0]


def u32(buf: bytes, off: int) -> int:
    return struct.unpack_from("<I", buf, off)[0]


def parse_pe(buf: bytes):
    if buf[:2] != b"MZ":
        raise ValueError("Input is not an MZ/PE executable")
    pe = u32(buf, 0x3C)
    if buf[pe:pe + 4] != b"PE\0\0":
        raise ValueError("PE signature not found")
    section_count = u16(buf, pe + 6)
    optional_size = u16(buf, pe + 20)
    optional = pe + 24
    magic = u16(buf, optional)
    if magic != 0x10B:
        raise ValueError(f"Expected PE32 image, optional-header magic is 0x{magic:X}")
    image_base = u32(buf, optional + 28)
    section_start = optional + optional_size
    sections = []
    for i in range(section_count):
        off = section_start + i * 40
        name = buf[off:off + 8].split(b"\0", 1)[0].decode("ascii", "replace")
        sections.append({
            "name": name,
            "virtual_size": u32(buf, off + 8),
            "virtual_address": u32(buf, off + 12),
            "raw_size": u32(buf, off + 16),
            "raw_offset": u32(buf, off + 20),
        })
    return image_base, sections


def va_to_offset(va: int, image_base: int, sections: list[dict]) -> int | None:
    rva = va - image_base
    for sec in sections:
        span = max(sec["virtual_size"], sec["raw_size"])
        if sec["virtual_address"] <= rva < sec["virtual_address"] + span:
            delta = rva - sec["virtual_address"]
            if delta >= sec["raw_size"]:
                return None
            return sec["raw_offset"] + delta
    return None


def delphi_ansi_string(buf: bytes, ptr: int, image_base: int, sections: list[dict]) -> str | None:
    if not ptr:
        return None
    char_off = va_to_offset(ptr, image_base, sections)
    if char_off is None or char_off < 4 or char_off >= len(buf):
        return None
    length = struct.unpack_from("<i", buf, char_off - 4)[0]
    if length < 0 or length > 512 or char_off + length > len(buf):
        return None
    raw = buf[char_off:char_off + length]
    if not raw or any(byte < 0x20 and byte not in (9, 10, 13) for byte in raw):
        return None
    try:
        return raw.decode("cp1251")
    except UnicodeDecodeError:
        return raw.decode("latin-1", "replace")


def extract(path: Path) -> dict:
    buf = path.read_bytes()
    image_base, sections = parse_pe(buf)
    table_off = va_to_offset(TABLE_VA, image_base, sections)
    if table_off is None:
        raise ValueError(f"Table VA 0x{TABLE_VA:08X} does not map to file bytes")
    if table_off + ENTRY_SIZE * ENTRY_COUNT > len(buf):
        raise ValueError("Static table extends beyond the executable file")

    rows = []
    for i in range(ENTRY_COUNT):
        off = table_off + i * ENTRY_SIZE
        row = {
            "index": i,
            "table_va": f"0x{TABLE_VA + i * ENTRY_SIZE:08X}",
            "selector": buf[off],
            "id": u32(buf, off + 4),
            "name_ptr": u32(buf, off + 8),
            "unit_ptr": u32(buf, off + 12),
            "max_group": u32(buf, off + 16),
            "data_offset": u32(buf, off + 20),
            "read_mode": u32(buf, off + 24),
            "precision": u32(buf, off + 28),
            "display_ptr": u32(buf, off + 32),
            "raw_hex": buf[off:off + ENTRY_SIZE].hex(" ").upper(),
        }
        row["name"] = delphi_ansi_string(buf, row["name_ptr"], image_base, sections)
        row["unit"] = delphi_ansi_string(buf, row["unit_ptr"], image_base, sections)
        row["display_values"] = delphi_ansi_string(buf, row["display_ptr"], image_base, sections)
        rows.append(row)

    return {
        "source": path.name,
        "file_size": len(buf),
        "image_base": f"0x{image_base:08X}",
        "table_va": f"0x{TABLE_VA:08X}",
        "table_file_offset": f"0x{table_off:X}",
        "entry_size": ENTRY_SIZE,
        "entry_count": ENTRY_COUNT,
        "selector_counts": {
            f"0x{selector:02X}": sum(row["selector"] == selector for row in rows)
            for selector in sorted({row["selector"] for row in rows})
        },
        "rows": rows,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("exe", nargs="?", default="archivos/CheviExplorer1.8.exe")
    parser.add_argument("--json", action="store_true", help="emit all 376 descriptors as JSON")
    args = parser.parse_args()
    result = extract(Path(args.exe))
    if args.json:
        print(json.dumps(result, ensure_ascii=False, indent=2))
        return

    print("# CheviExplorer 1.8 static parameter table")
    print()
    print(f"- Source: `{result['source']}` ({result['file_size']:,} bytes)")
    print(f"- Image base: `{result['image_base']}`; table file offset: `{result['table_file_offset']}`")
    print(f"- Entries: {result['entry_count']} x {result['entry_size']} bytes")
    print("- Selector counts: " + ", ".join(f"`{key}`: {value}" for key, value in result["selector_counts"].items()))
    print()
    for selector in TARGET_SELECTORS:
        selected = [row for row in result["rows"] if row["selector"] == selector]
        print(f"## Selector 0x{selector:02X} ({len(selected)} entries)")
        print()
        print("| Index | ID | Name | Unit | Max group | Data offset | Read mode | Precision | Display values | Raw descriptor |")
        print("|---:|---:|---|---:|---:|---:|---:|---:|---|---|")
        for row in selected:
            name = (row["name"] or "").replace("|", "\\|").replace("\n", " ")
            unit = (row["unit"] or "").replace("|", "\\|").replace("\n", " ")
            display = (row["display_values"] or "").replace("|", "\\|").replace("\n", " ")
            print(f"| {row['index']} | {row['id']} (0x{row['id']:X}) | {name} | {unit} | {row['max_group']} | {row['data_offset']} | {row['read_mode']} | {row['precision']} | {display} | `{row['raw_hex']}` |")
        print()


if __name__ == "__main__":
    main()
