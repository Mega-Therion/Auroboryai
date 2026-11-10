# SymPy lane — symbolic checks

Exact-integer checks (SymPy) of the dimension identities the papers state:
the E8 → SO(10) branching in Res Nova §3, the Spin(16) decomposition,
and 240² = 57,600.

Run from the repository root:

```sh
python3 formal/sympy/check_dimensions.py
```

Exit 0 iff every identity holds. Last verified run: 8/8 passed
(2026-11-10, SymPy 1.12). These are arithmetic identities, not proofs of
the physics — they check that the decompositions the papers exhibit add
up to 248.
