#!/usr/bin/env python3
"""Symbolic dimension checks for the E8 branching identities in Res Nova §3
and the Euclid predictions paper. Exact integer arithmetic via SymPy.
Run: python3 formal/sympy/check_dimensions.py
Exit 0 iff every identity holds.
"""
import sys
from sympy import Integer

checks = []


def check(name, lhs, rhs):
    ok = lhs == rhs
    checks.append((name, ok, lhs, rhs))
    print(f"{'PASS' if ok else 'FAIL'}: {name}: {lhs} == {rhs}")


# 240 E8 roots; 248 = 240 + 8 (Cartan subalgebra)
check("248 = 240 + 8", Integer(240) + 8, Integer(248))
# 240^2 = 57,600 (the transition number)
check("240^2 = 57600", Integer(240) ** 2, Integer(57600))
# Spin(16)/Z2: 248 = 120 + 128
check("248 = 120 + 128 (Spin(16))", Integer(120) + 128, Integer(248))
# E6 x SU(3): 248 = (8,1) + (1,78) + (3,27) + (3b,27b) = 8 + 78 + 81 + 81
check("248 = 8 + 78 + 3*27 + 3*27 (E6 x SU(3))",
      Integer(8) + 78 + 3 * 27 + 3 * 27, Integer(248))
# E6 27 = 16 + 10 + 1 under SO(10) x U(1)
check("27 = 16 + 10 + 1 (E6 -> SO(10))", Integer(16) + 10 + 1, Integer(27))
# E6 78 = 1 + 45 + 16 + 16
check("78 = 1 + 45 + 16 + 16 (E6 -> SO(10))",
      Integer(1) + 45 + 16 + 16, Integer(78))
# Pati-Salam: 16 -> (4,2,1) + (4b,1,2) = 8 + 8
check("16 = 4*2 + 4*2 (Pati-Salam 16)", Integer(4) * 2 + 4 * 2, Integer(16))
# Pati-Salam: 45 -> (15,1,1) + (6,2,2) + (1,3,1) + (1,1,3) = 15 + 24 + 3 + 3
check("45 = 15 + 24 + 3 + 3 (Pati-Salam 45)",
      Integer(15) + 6 * 2 * 2 + 3 + 3, Integer(45))

failed = [c for c in checks if not c[1]]
print(f"{len(checks) - len(failed)}/{len(checks)} checks passed.")
sys.exit(1 if failed else 0)
