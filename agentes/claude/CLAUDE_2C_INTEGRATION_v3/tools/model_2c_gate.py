#!/usr/bin/env python3
"""
MODELO en Python de la logica de DynamicBlockResponseValidator / DynamicBlockGate / Runner (v3).
NO es el codigo Kotlin y NO lo ejecuta: sirve para comprobar el algoritmo con los mismos escenarios
que las pruebas JUnit. Los tests Kotlin siguen SIN ejecutar (no hay Gradle en este entorno).
Uso: python3 model_2c_gate.py --repo <repo con archivos/CheviExplorer1.8.exe>  (usa las tramas 2C del EXE)
"""
import argparse, sys, unittest, os, json
sys.path.insert(0, os.path.dirname(__file__))

def cs(b): return sum(b) & 0xFF
def wc(*b): b = list(b); return bytes(b + [cs(b)])

BLOCKS = {'MR140_F0': (0x11, 0xF0), 'MR140_F1': (0x11, 0xF1), 'ZF_F0': (0x18, 0xF0)}
PROFILE = {'MR140_F0': 'MR140', 'MR140_F1': 'MR140', 'ZF_F0': 'ZF'}

def build_request(name):
    dst, bid = BLOCKS[name]
    D = DEFS[name]
    body = bytearray([0x2C, bid])
    for e in D:
        if name.startswith('MR'): body += bytes([2, e['pos'], e['size'], int(e['cid'][:2], 16), int(e['cid'][2:], 16), 1])
        else: body += bytes([1, e['pos'], e['size'], int(e['lid'], 16), e['loff']])
    fr = bytearray([0x80, dst, 0xF1, len(body)]) + body
    fr.append(cs(fr)); return bytes(fr)

def validate(req, rx, name, echo=True):
    dst, bid = BLOCKS[name]
    if not rx: return 'NO_RESPONSE'
    start = 0
    if echo:
        for i in range(min(len(rx), len(req))):
            if rx[i] != req[i]: return 'ECHO_MISMATCH'
        if len(rx) < len(req): return 'TRUNCATED'
        start = len(req)
    avail = len(rx) - start
    if avail <= 0: return 'NO_RESPONSE'
    fmt = rx[start]
    if fmt & 0xC0 != 0x80: return 'MALFORMED'
    sl = fmt & 0x3F
    if sl == 0:
        hdr = 4
        if avail < 4: return 'TRUNCATED'
        dl = rx[start + 3]
        if dl == 0: return 'MALFORMED'
    else: hdr, dl = 3, sl
    total = hdr + dl + 1
    if avail < total: return 'TRUNCATED'
    if cs(rx[start:start + total - 1]) != rx[start + total - 1]: return 'BAD_CHECKSUM'
    if rx[start + 1] != 0xF1: return 'WRONG_TARGET'
    if rx[start + 2] != dst: return 'WRONG_SOURCE'
    p = rx[start + hdr:start + hdr + dl]; sid = p[0]
    if sid == 0x7F:
        if len(p) < 3: return 'MALFORMED'
        return 'NEGATIVE_RESPONSE' if p[1] == 0x2C else 'OTHER_REQUEST'
    if sid == 0x7E: return 'TESTER_PRESENT_RESIDUAL'
    if sid != 0x6C: return 'WRONG_SERVICE'
    if len(p) < 2: return 'MALFORMED'
    if p[1] != bid: return 'WRONG_BLOCK'
    if avail > total: return 'RESIDUAL_BYTES'
    return 'ACCEPTED'

class Gate:
    def __init__(s, zf=False): s.zf = zf; s.sid = 0; s.profile = None; s.acc = set(); s.pending = None; s.last = None
    def start(s, prof):
        if s.profile: s.last = 'SESSION_RESTART'
        s.sid += 1; s.acc.clear(); s.pending = None; s.profile = prof; return s.sid
    def reset(s, why): s.sid += 1; s.acc.clear(); s.pending = None; s.profile = None; s.last = why
    def profile_change(s, p):
        if s.profile and s.profile != p: s.reset('PROFILE_CHANGE')
    def next(s):
        if s.pending: return None
        if s.profile == 'MR140':
            return 'MR140_F0' if 'MR140_F0' not in s.acc else ('MR140_F1' if 'MR140_F1' not in s.acc else None)
        if s.profile == 'ZF': return 'ZF_F0' if s.zf and 'ZF_F0' not in s.acc else None
        return None
    def begin(s, b, sid):
        if sid != s.sid or s.next() != b: return False
        s.pending = b; return True
    def complete(s, b, sid, verdict):
        if sid != s.sid or s.pending != b: return 'IGNORED_STALE'
        if verdict == 'ACCEPTED': s.acc.add(b); s.pending = None; return 'ACCEPTED'
        s.reset('TIMEOUT' if verdict == 'NO_RESPONSE' else 'INVALID_RESPONSE'); return 'REJECTED_GATE_CLOSED'
    def can_read(s, b):
        if not s.profile or s.pending: return False
        if PROFILE[b] != s.profile: return False
        if b == 'ZF_F0' and not s.zf: return False
        return b in s.acc

def run_all(gate, sid, transport):
    steps = []
    while True:
        b = gate.next()
        if b is None or not gate.begin(b, sid): break
        req = build_request(b)
        try: rx = transport(req, len(steps) + 1)
        except IOError as e:
            gate.reset('IO_ERROR'); steps.append((b, 'IO_ERROR')); break
        v = validate(req, rx, b); steps.append((b, v))
        if gate.complete(b, sid, v) != 'ACCEPTED': break
    return steps

DEFS = {}
REPO = None

class T(unittest.TestCase):
    def ok(self, n): return wc(0x82, 0xF1, BLOCKS[n][0], 0x6C, BLOCKS[n][1])
    def test_validator_positive_and_negative(self):
        r = build_request('MR140_F0'); ok = self.ok('MR140_F0')
        V = lambda rx, n='MR140_F0', e=True: validate(build_request(n), rx, n, e)
        self.assertEqual(V(r + ok), 'ACCEPTED')
        self.assertEqual(V(build_request('MR140_F1') + self.ok('MR140_F1'), 'MR140_F1'), 'ACCEPTED')
        self.assertEqual(V(r + wc(0x80, 0xF1, 0x11, 0x02, 0x6C, 0xF0)), 'ACCEPTED')
        self.assertEqual(V(ok, e=False), 'ACCEPTED'); self.assertEqual(V(ok), 'ECHO_MISMATCH')
        self.assertEqual(V(None), 'NO_RESPONSE'); self.assertEqual(V(b''), 'NO_RESPONSE'); self.assertEqual(V(r), 'NO_RESPONSE')
        self.assertEqual(V(r[:50]), 'TRUNCATED')
        bad = bytearray(r); bad[10] ^= 1; self.assertEqual(V(bytes(bad) + ok), 'ECHO_MISMATCH')
        self.assertEqual(V(r + ok[:-1]), 'TRUNCATED'); self.assertEqual(V(r + bytes([0x80, 0xF1])), 'TRUNCATED')
        b = bytearray(ok); b[-1] ^= 1; self.assertEqual(V(r + bytes(b)), 'BAD_CHECKSUM')
        self.assertEqual(V(r + wc(0x82, 0x11, 0x11, 0x6C, 0xF0)), 'WRONG_TARGET')
        self.assertEqual(V(r + wc(0x82, 0xF1, 0x18, 0x6C, 0xF0)), 'WRONG_SOURCE')
        self.assertEqual(V(r + wc(0x82, 0xF1, 0x00, 0x6C, 0xF0)), 'WRONG_SOURCE')
        self.assertEqual(V(r + wc(0x83, 0xF1, 0x11, 0x7F, 0x2C, 0x31)), 'NEGATIVE_RESPONSE')
        tp = wc(0x81, 0xF1, 0x11, 0x7E)
        self.assertEqual(V(r + tp), 'TESTER_PRESENT_RESIDUAL'); self.assertEqual(V(r + tp + ok), 'TESTER_PRESENT_RESIDUAL')
        self.assertEqual(V(r + wc(0x82, 0xF1, 0x11, 0x61, 0xF0)), 'WRONG_SERVICE')
        self.assertEqual(V(r + wc(0x83, 0xF1, 0x11, 0x7F, 0x21, 0x31)), 'OTHER_REQUEST')
        self.assertEqual(V(r + wc(0x82, 0xF1, 0x11, 0x5A, 0x80)), 'WRONG_SERVICE')
        self.assertEqual(V(r + wc(0x82, 0xF1, 0x11, 0x6C, 0xF1)), 'WRONG_BLOCK')
        self.assertEqual(V(r + ok + tp), 'RESIDUAL_BYTES'); self.assertEqual(V(r + ok + b'\x00'), 'RESIDUAL_BYTES')
        self.assertEqual(V(r + wc(0x02, 0xF1, 0x11, 0x6C, 0xF0)), 'MALFORMED')
        self.assertEqual(V(r + wc(0x80, 0xF1, 0x11, 0x00)), 'MALFORMED')
        self.assertEqual(V(r + wc(0x81, 0xF1, 0x11, 0x6C)), 'MALFORMED')
        z = build_request('ZF_F0')
        self.assertEqual(validate(z, z + wc(0x82, 0xF1, 0x18, 0x6C, 0xF0), 'ZF_F0'), 'ACCEPTED')
        self.assertEqual(validate(z, z + wc(0x82, 0xF1, 0x11, 0x6C, 0xF0), 'ZF_F0'), 'WRONG_SOURCE')

    def test_gate_order_and_per_block_open(self):
        g = Gate(); s = g.start('MR140')
        self.assertFalse(g.begin('MR140_F1', s)); self.assertTrue(g.begin('MR140_F0', s))
        self.assertFalse(g.can_read('MR140_F0')); self.assertIsNone(g.next())
        self.assertEqual(g.complete('MR140_F0', s, 'ACCEPTED'), 'ACCEPTED')
        self.assertTrue(g.can_read('MR140_F0')); self.assertFalse(g.can_read('MR140_F1'))
        self.assertTrue(g.begin('MR140_F1', s)); g.complete('MR140_F1', s, 'ACCEPTED')
        self.assertTrue(g.can_read('MR140_F1')); self.assertIsNone(g.next())

    def test_gate_fail_closed_for_every_bad_verdict(self):
        for v in ('NO_RESPONSE ECHO_MISMATCH TRUNCATED MALFORMED BAD_CHECKSUM WRONG_TARGET WRONG_SOURCE NEGATIVE_RESPONSE OTHER_REQUEST '
                  'TESTER_PRESENT_RESIDUAL WRONG_SERVICE WRONG_BLOCK RESIDUAL_BYTES').split():
            g = Gate(); s = g.start('MR140'); g.begin('MR140_F0', s); g.complete('MR140_F0', s, 'ACCEPTED'); g.begin('MR140_F1', s)
            self.assertEqual(g.complete('MR140_F1', s, v), 'REJECTED_GATE_CLOSED')
            self.assertFalse(g.can_read('MR140_F0'), v); self.assertFalse(g.can_read('MR140_F1')); self.assertIsNone(g.next())
            self.assertEqual(g.last, 'TIMEOUT' if v == 'NO_RESPONSE' else 'INVALID_RESPONSE')

    def test_gate_all_reset_reasons_and_stale(self):
        for why in 'DISCONNECT RECONNECT SESSION_RESTART PROFILE_CHANGE TIMEOUT IO_ERROR INVALID_RESPONSE DEFINITION_FAILED'.split():
            g = Gate(); s = g.start('MR140'); g.begin('MR140_F0', s); g.complete('MR140_F0', s, 'ACCEPTED'); g.begin('MR140_F1', s); g.complete('MR140_F1', s, 'ACCEPTED')
            g.reset(why); self.assertFalse(g.can_read('MR140_F0')); self.assertFalse(g.can_read('MR140_F1')); self.assertIsNone(g.next()); self.assertEqual(g.last, why)
        g = Gate(); s1 = g.start('MR140'); g.begin('MR140_F0', s1); g.reset('DISCONNECT')
        self.assertEqual(g.complete('MR140_F0', s1, 'ACCEPTED'), 'IGNORED_STALE'); self.assertFalse(g.can_read('MR140_F0'))
        s2 = g.start('MR140'); self.assertFalse(g.begin('MR140_F0', s1)); self.assertTrue(g.begin('MR140_F0', s2))
        g2 = Gate(); g2.start('MR140'); g2.profile_change('MR140'); self.assertEqual(g2.profile, 'MR140'); g2.profile_change('ZF'); self.assertEqual(g2.last, 'PROFILE_CHANGE')
        g3 = Gate(); s = g3.start('MR140'); g3.begin('MR140_F0', s); g3.complete('MR140_F0', s, 'ACCEPTED'); g3.start('MR140')
        self.assertEqual(g3.last, 'SESSION_RESTART'); self.assertFalse(g3.can_read('MR140_F0'))

    def test_zf_blocked_by_default(self):
        g = Gate(); s = g.start('ZF'); self.assertIsNone(g.next()); self.assertFalse(g.begin('ZF_F0', s)); self.assertFalse(g.can_read('ZF_F0'))
        g2 = Gate(zf=True); s = g2.start('ZF'); self.assertEqual(g2.next(), 'ZF_F0'); g2.begin('ZF_F0', s); g2.complete('ZF_F0', s, 'ACCEPTED')
        self.assertTrue(g2.can_read('ZF_F0')); self.assertFalse(g2.can_read('MR140_F0'))
        g3 = Gate(); s = g3.start('MR140'); self.assertFalse(g3.can_read('ZF_F0'))

    def test_runner_flows(self):
        g = Gate(); s = g.start('MR140')
        st = run_all(g, s, lambda req, n: req + self.ok('MR140_F0' if n == 1 else 'MR140_F1'))
        self.assertEqual([x[0] for x in st], ['MR140_F0', 'MR140_F1']); self.assertTrue(g.can_read('MR140_F0') and g.can_read('MR140_F1'))
        sent = []
        g = Gate(); s = g.start('MR140')
        run_all(g, s, lambda req, n: (sent.append(req), req + wc(0x83, 0xF1, 0x11, 0x7F, 0x2C, 0x31))[1])
        self.assertEqual(len(sent), 1); self.assertFalse(g.can_read('MR140_F0'))
        g = Gate(); s = g.start('MR140')
        st = run_all(g, s, lambda req, n: req + self.ok('MR140_F0') if n == 1 else req + wc(0x81, 0xF1, 0x11, 0x7E))
        self.assertEqual(st[-1][1], 'TESTER_PRESENT_RESIDUAL'); self.assertFalse(g.can_read('MR140_F0'))
        g = Gate(); s = g.start('MR140'); run_all(g, s, lambda req, n: req); self.assertEqual(g.last, 'TIMEOUT')
        def boom(req, n): raise IOError('usb')
        g = Gate(); s = g.start('MR140'); st = run_all(g, s, boom); self.assertEqual(st, [('MR140_F0', 'IO_ERROR')]); self.assertEqual(g.last, 'IO_ERROR')
        g = Gate(); s = g.start('MR140'); g.reset('DISCONNECT'); self.assertEqual(run_all(g, s, lambda r, n: r), [])
        g = Gate(); s = g.start('ZF'); self.assertEqual(run_all(g, s, lambda r, n: r), [])

if __name__ == '__main__':
    ap = argparse.ArgumentParser(); ap.add_argument('--repo', required=True); a, rest = ap.parse_known_args(); REPO = a.repo
    sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', '..', 'opera_claud_v2', 'tools'))
    import importlib.util
    cand = [os.path.join(os.path.dirname(os.path.abspath(__file__)), p) for p in ('verify_kwp_sequences.py', '../../opera_claud_v2/tools/verify_kwp_sequences.py', '../../tools/verify_kwp_sequences.py')]
    path = next(p for p in cand if os.path.exists(p))
    spec = importlib.util.spec_from_file_location('v', path); v = importlib.util.module_from_spec(spec); spec.loader.exec_module(v)
    v.REPO = REPO; v.T.setUpClass()
    t = v.T('test_01_define_frames_lengths_and_header')
    for name in BLOCKS:
        fr = t._frame_bytes(name); body = fr[4:4 + fr[3]]
        DEFS[name] = v.parse_entries(body, 'cid' if name.startswith('MR') else 'lid')
        for e in DEFS[name]:
            if 'cid' in e: e['cid'] = '%04X' % e['cid']
            else: e['lid'] = '%02X' % e['lid']; e['loff'] = e['off']
    unittest.main(argv=[sys.argv[0]] + rest, verbosity=2)
