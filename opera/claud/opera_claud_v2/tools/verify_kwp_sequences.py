#!/usr/bin/env python3
"""
Verificacion ESTATICA y reproducible de las secuencias KWP, offsets y formulas
extraidos de CheviExplorer1.8.exe.  No habla con el coche ni con el APK.

Uso:
  python3 verify_kwp_sequences.py --repo <ruta al repo scan-ecu-lacetti> [--kotlin-dir <ruta app/src/main/java/...>]
Requisitos: Python 3.9+, binutils (objdump) para reconstruir tramas desde el codigo del EXE.
Salida: unittest estandar (0 = todo coincide).  Cada test dice que evidencia compara.
"""
import argparse, glob, json, os, re, struct, subprocess, sys, unittest

REPO = None
KOTLIN_DIR = None

# ---------------- PE minimo ----------------
class PE:
    def __init__(self, fn):
        d = open(fn, 'rb').read(); self.d = d
        pe = struct.unpack_from('<I', d, 0x3c)[0]
        nsec = struct.unpack_from('<H', d, pe + 6)[0]
        opt = struct.unpack_from('<H', d, pe + 20)[0]
        self.base = struct.unpack_from('<I', d, pe + 24 + 28)[0]
        so = pe + 24 + opt; self.secs = []
        for i in range(nsec):
            n, vs, va, rs, ro = struct.unpack_from('<8sIIII', d, so + i * 40)
            self.secs.append((n.rstrip(b'\0').decode(), va, vs, ro, rs))
    def off(self, va):
        rva = va - self.base
        for n, sva, vs, ro, rs in self.secs:
            if sva <= rva < sva + max(vs, rs): return ro + rva - sva
    def read(self, va, n): o = self.off(va); return self.d[o:o + n]
    def u32(self, va): return struct.unpack('<I', self.read(va, 4))[0]
    def f32(self, va): return struct.unpack('<f', self.read(va, 4))[0]
    def cstr(self, va): b = self.read(va, 400); return b[:b.find(b'\0')].decode('cp1251', 'replace')

def exe_path(): return os.path.join(REPO, 'archivos', 'CheviExplorer1.8.exe')

def objdump(a, b):
    p = PE(exe_path()); code = [s for s in p.secs if s[0] == 'CODE'][0]
    tmp = '/tmp/_code.bin'; open(tmp, 'wb').write(p.d[code[3]:code[3] + code[4]])
    out = subprocess.run(['objdump', '-D', '-b', 'binary', '-m', 'i386', '-M', 'intel',
                          '--adjust-vma=0x401000', f'--start-address={a:#x}', f'--stop-address={b:#x}', tmp],
                         capture_output=True, text=True).stdout
    res = []
    for l in out.split('\n'):
        m = re.match(r'^\s+([0-9a-f]+):\t([0-9a-f ]+)\t(.*)$', l)
        if m: res.append((int(m.group(1), 16), re.sub(r'\s+', ' ', m.group(3).strip())))
    return res

def csum(bs): return sum(bs) & 0xFF

# ---------------- reconstruccion de tramas 2C desde el codigo ----------------
def define_frames(dst_map):
    """Reconstruye las llamadas a WriteReadComm (0x4E2E68) de Start (0x4E42B6-0x4E5F10) con largo>100."""
    GL = {'0x4f6da8': 'DST', '0x4f6da9': 'SRC'}
    ins = objdump(0x4E42B6, 0x4E5F10)
    slots = {}; regs = {}; push = []; frames = {}
    def disp(s):
        m = re.search(r'\[ebp([+-])0x([0-9a-f]+)\]', s)
        if not m: return None
        v = int(m.group(2), 16); v = -v if m.group(1) == '-' else v
        if v >= 0x80000000: v -= 1 << 32
        return v
    for a, t in ins:
        if t.startswith('call'):
            if '0x4e2e68' in t:
                e, c = regs.get('edx'), regs.get('ecx')
                if isinstance(e, tuple) and isinstance(c, int) and c + 1 > 100:
                    fr = [slots.get(e[1] + j) for j in range(c + 1)]
                    frames[a] = dict(call=a, read_count=push[-1] if push else None, frame=fr)
            slots = {}; regs = {}; push = []; continue
        if t.startswith('push '):
            try: push.append(int(t.split()[1], 16))
            except ValueError: push.append(t.split()[1])
            continue
        m = re.match(r'mov (?:BYTE PTR )?(\[ebp[^\]]*\]),(0x[0-9a-f]+|\w+)$', t)
        if m and disp(m.group(1)) is not None:
            v = m.group(2); d = disp(m.group(1))
            slots[d] = int(v, 16) if v.startswith('0x') else regs.get(v, '?'); continue
        m = re.match(r'mov (\w+),(?:BYTE PTR )?ds:(0x[0-9a-f]+)$', t)
        if m: regs[m.group(1)] = GL.get(m.group(2), '?'); continue
        m = re.match(r'mov (\w+),(0x[0-9a-f]+)$', t)
        if m: regs[m.group(1)] = int(m.group(2), 16); continue
        m = re.match(r'lea (\w+),(\[ebp[^\]]*\])$', t)
        if m and disp(m.group(2)) is not None: regs[m.group(1)] = ('LEA', disp(m.group(2)))
    return frames

def parse_entries(body, kind):
    rest = body[2:]; out = []
    if kind == 'cid':
        assert len(rest) % 6 == 0
        for i in range(0, len(rest), 6):
            e = rest[i:i + 6]; assert e[0] == 0x02 and e[5] == 0x01, e
            out.append(dict(pos=e[1], size=e[2], cid=e[3] << 8 | e[4]))
    else:
        assert len(rest) % 5 == 0
        for i in range(0, len(rest), 5):
            e = rest[i:i + 5]; assert e[0] == 0x01, e
            out.append(dict(pos=e[1], size=e[2], lid=e[3], off=e[4]))
    return out

EXPECT = {  # nombre: (dst, largo_trama, len_field, tipo, bloque, total_datos, byte_formato_respuesta, checksum_con_SRC_F1)
    'MR140_F0': (0x11, 163, 0x9E, 'cid', 0xF0, 29, 0x9F, 0x80),
    'MR140_F1': (0x11, 175, 0xAA, 'cid', 0xF1, 37, 0xA7, 0x95),
    'ZF_F0':    (0x18, 142, 0x89, 'lid', 0xF0, 41, 0xAB, 0x8F),
}

class T(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.pe = PE(exe_path())
        cls.frames = {}
        for call, f in define_frames(None).items():
            fr = f['frame']
            if None in fr[:5] or len(fr) < 6: continue
            if fr[4] == 0x2C: cls.frames[(len(fr), fr[1], fr[5])] = f
        cls.by_name = {}
        for name, (dst, ln, lf, kind, blk, tot, rfmt, ck) in EXPECT.items():
            f = [v for (n, d, b), v in cls.frames.items() if n == ln and d == dst and b == blk]
            cls.by_name[name] = f[0] if f else None

    def _frame_bytes(self, name):
        f = self.by_name[name]; self.assertIsNotNone(f, f'{name}: no encontrada en el codigo de Start')
        return [0xF1 if x == 'SRC' else x for x in f['frame']]

    def test_01_define_frames_lengths_and_header(self):
        for name, (dst, ln, lf, kind, blk, tot, rfmt, ck) in EXPECT.items():
            fr = self._frame_bytes(name)
            self.assertEqual(len(fr), ln, name)
            self.assertEqual(fr[0], 0x80); self.assertEqual(fr[1], dst); self.assertEqual(fr[2], 0xF1)
            self.assertEqual(fr[3], lf, name); self.assertEqual(len(fr), 4 + lf + 1, name)
            self.assertEqual(fr[4], 0x2C); self.assertEqual(fr[5], blk)
            self.assertEqual(self.by_name[name]['read_count'], 0xFF, 'ReadFile pide 255 bytes')

    def test_02_define_frames_checksum(self):
        for name, (dst, ln, lf, kind, blk, tot, rfmt, ck) in EXPECT.items():
            fr = self._frame_bytes(name)
            self.assertTrue(all(isinstance(x, int) for x in fr[:-1]), name)
            self.assertEqual(csum(fr[:-1]), ck, name)  # el ultimo byte es el hueco CHK que WriteReadComm rellena

    def test_03_entries_contiguous_and_totals(self):
        for name, (dst, ln, lf, kind, blk, tot, rfmt, ck) in EXPECT.items():
            fr = self._frame_bytes(name)
            ents = parse_entries(fr[4:4 + lf], kind)
            p = 1
            for e in ents:
                self.assertEqual(e['pos'], p, f'{name} hueco en pos {p}'); p += e['size']
            self.assertEqual(p - 1, tot, name)
            self.assertEqual(0x80 | (2 + tot), rfmt, f'{name}: byte de formato de la respuesta 21 {blk:02X}')

    def test_04_table_matches_repo_json(self):
        J = json.load(open(os.path.join(REPO, 'archivos', 'cloude', 'delphi_parameter_table.json')))['rows']
        self.assertEqual(len(J), 376)
        for i, j in enumerate(J):
            raw = self.pe.read(0x4F22AC + i * 36, 36); f = struct.unpack('<9I', raw)
            self.assertEqual(f[0] & 0xFF, int(j['selector'], 0) if isinstance(j['selector'], str) else j['selector'])
            self.assertEqual(f[1], j['id']); self.assertEqual(f[5], j['data_offset']); self.assertEqual(f[6], j['read_mode'])

    def test_05_offsets_map_to_block_entries(self):
        """offset de la tabla -> pos = offset-10 -> inicio de entrada del bloque 2C con el tamano del modo."""
        ents = {n: parse_entries(self._frame_bytes(n)[4:4 + EXPECT[n][2]], EXPECT[n][3]) for n in EXPECT}
        rows = [struct.unpack('<9I', self.pe.read(0x4F22AC + i * 36, 36)) for i in range(376)]
        seen = {0x12: 0, 0x22: 0}
        for r in rows:
            sel = r[0] & 0xFF
            if sel not in (0x12, 0x22): continue
            ident, grp, off, mode = r[1], r[4], r[5], r[6]
            if mode == 3: continue
            n = 2 if mode in (0, 2) else 1; pos = off - 10
            key = 'ZF_F0' if sel == 0x22 else ('MR140_F0' if grp == 1 else 'MR140_F1')
            hit = [e for e in ents[key] if e['pos'] == pos]
            self.assertEqual(len(hit), 1, f'{key} ID {ident} offset {off}')
            self.assertEqual(hit[0]['size'], n, f'{key} ID {ident} tamano')
            seen[sel] += 1
        self.assertEqual(seen, {0x12: 56, 0x22: 30})

    def test_06_standard_frames_checksum(self):
        cases = {  # trama sin checksum -> checksum esperado
            '81 11 F1 81': 0x04, '81 18 F1 81': 0x0B, '81 11 F1 3E': 0xC1, '81 18 F1 3E': 0xC8,
            '82 11 F1 1A 80': 0x1E, '82 18 F1 1A 80': 0x25, '82 11 F1 21 F0': 0x95, '82 11 F1 21 F1': 0x96,
            '82 18 F1 21 F0': 0x9C, '84 11 F1 19 DA FF 00': 0x78, '84 18 F1 18 00 00 00': 0xA5,
            '83 11 F1 14 FF 00': 0x98, '83 18 F1 14 FF 00': 0x9F, '82 11 F1 11 01': 0x96,
            '84 11 F1 30 2C 07 FF': 0xE8, '81 11 F1 82': 0x05, '81 18 F1 82': 0x0C,
            '85 11 F1 30 32 07 FF 00': 0xEF, '85 11 F1 30 32 07 00 00': 0xF0, '85 11 F1 30 32 07 FF 03': 0xF2,
            '83 11 F1 30 15 01': 0xCB, '84 11 F1 30 15 07 FF': 0xD1, '84 11 F1 30 15 07 00': 0xD2,
        }
        for h, c in cases.items():
            self.assertEqual(csum(bytes.fromhex(h.replace(' ', ''))), c, h)

    def test_07_cedat_frames(self):
        fn = glob.glob(os.path.join(REPO, 'archivos', '2610161732*.cedat'))[0]
        d = open(fn, 'rb').read(); ok = {'F0': 0, 'F1': 0}
        for k, (off, tx, n, hdr) in {'F0': (128, '8211f121f095', 35, '9ff11161f0'), 'F1': (192, '8211f121f196', 43, 'a7f11161f1')}.items():
            o = off
            while o + 6 + n <= len(d):
                if d[o:o + 6].hex() == tx and d[o + 6:o + 11].hex() == hdr:
                    fr = d[o + 6:o + 6 + n]; self.assertEqual(csum(fr[:-1]), fr[-1]); ok[k] += 1
                o += 128
        self.assertEqual(ok, {'F0': 237, 'F1': 237})

    def test_08_android_mr140_matches_exe_offsets_and_modes(self):
        kt = os.path.join(KOTLIN_DIR or os.path.join(REPO, 'app/src/main/java/com/cheviexplorer/android'), 'Mr140Params.kt')
        src = open(kt, encoding='utf-8').read()
        rows = {}
        for i in range(376):
            f = struct.unpack('<9I', self.pe.read(0x4F22AC + i * 36, 36))
            if (f[0] & 0xFF) == 0x12: rows[f[1]] = f
        n = 0
        for m in re.finditer(r'Mr140Parameter\((\d+), "[^"]*", (?:"[^"]*"|null), (0xF[01]), (\d+), Mr140Raw\.(\w+),', src):
            ident, loc, idx, raw = int(m.group(1)), m.group(2), int(m.group(3)), m.group(4)
            r = rows[ident]; self.assertEqual(idx, r[5] - 11, f'ID {ident}')
            self.assertEqual(loc, '0xF0' if r[4] == 1 else '0xF1', f'ID {ident}')
            self.assertEqual({'U8': 1, 'U16_BE': 2, 'U16_LE': 0}[raw], r[6], f'ID {ident}'); n += 1
        self.assertEqual(n, 56)

    def test_09_ids_67_71_constants(self):
        p = self.pe
        self.assertEqual(p.f32(0x4E9554), 10.0); self.assertEqual(p.f32(0x4E95B4), 1.0)
        self.assertEqual(p.f32(0x4E9584), 4.0); self.assertEqual(p.f32(0x4E95BC), 60.0)
        self.assertEqual(p.f32(0x4E9588), 2.0); self.assertEqual(p.f32(0x4E95C0), 1000000.0)
        self.assertEqual(p.f32(0x4E95C4), 20.0); self.assertEqual(p.f32(0x4E958C), 100.0)
        self.assertEqual(p.f32(0x4E95C8), 3600000.0); self.assertEqual(p.f32(0x4E95CC), 0.5)

    def test_10_adaptation_thresholds(self):
        p = self.pe
        self.assertEqual([p.f32(a) for a in (0x4EDACC, 0x4EDB70, 0x4EDB74, 0x4EDB78)], [500.0, 4300.0, 80.0, 2000.0])

    def test_11_kotlin_definition_tables_match_exe_frames(self):
        """Si DynamicBlockDefinitions.kt existe (parche 0001 aplicado), reconstruye los bytes como lo hace Kotlin y compara con el EXE."""
        d = KOTLIN_DIR or os.path.join(REPO, 'app/src/main/java/com/cheviexplorer/android')
        fn = os.path.join(d, 'DynamicBlockDefinitions.kt')
        if not os.path.exists(fn): self.skipTest('DynamicBlockDefinitions.kt no existe (parche 0001 sin aplicar)')
        src = open(fn, encoding='utf-8').read()
        for name, kt_name, mode in (('MR140_F0', 'MR140_F0', 'cid'), ('MR140_F1', 'MR140_F1', 'cid'), ('ZF_F0', 'ZF_F0', 'lid')):
            blk = re.search(kt_name + r'\("[^"]*", 0x([0-9A-F]+), 0x([0-9A-F]+), Mode\.\w+, listOf\((.*?)\n        \)\)', src, re.S)
            self.assertIsNotNone(blk, name)
            dst, bid = int(blk.group(1), 16), int(blk.group(2), 16); body = bytearray([0x2C, bid])
            for m in re.finditer(r'Entry\(0x([0-9A-F]+), (\d+), 0x([0-9A-F]+)(?:, (\d+))?\)', blk.group(3)):
                pos, size, srcv = int(m.group(1), 16), int(m.group(2)), int(m.group(3), 16)
                if mode == 'cid': body += bytes([2, pos, size, srcv >> 8, srcv & 0xFF, 1])
                else: body += bytes([1, pos, size, srcv & 0xFF, int(m.group(4))])
            frame = bytearray([0x80, dst, 0xF1, len(body)]) + body; frame.append(csum(frame))
            exe = self._frame_bytes(name); exe[-1] = csum(exe[:-1])
            self.assertEqual(list(frame), exe, f'{name}: Kotlin != EXE')

if __name__ == '__main__':
    ap = argparse.ArgumentParser(); ap.add_argument('--repo', required=True); ap.add_argument('--kotlin-dir')
    a, rest = ap.parse_known_args(); REPO = a.repo; KOTLIN_DIR = a.kotlin_dir
    unittest.main(argv=[sys.argv[0]] + rest, verbosity=2)
