# Lean lane — status and canonical home

The Lean 4 proofs for this program live in the canonical home,
[Mega-Therion/Res-Nova](https://github.com/Mega-Therion/Res-Nova),
not in this repository. This lane records the gate status so the
papers and the proofs stay linked without duplicating the development.

## Proof gate (2026-11-07, commit `1d63d39`)

- **486 [P], 0 unresolved.** 16 modules, 2 named axiom gaps (Ars Magna ledger).
- The gate is the formal spine of Res Nova. Nothing in these papers is
  tagged [P] unless it passed this gate.

## Per-paper Lean claims

- **Res Nova (flagship):** the 486 [P] gate above. The E8 → SO(10)
  branching exhibited in §3 is [D] (derived, exhibited in-text), not
  Lean [P] — the branching proof is shown by hand, and the Lean
  formalization of it is open work.
- **A:** core machine-checked (`Basic.lean`, zero sorry); Clay Mathematics
  problem mappings are explicitly-declared *assumed* axioms.
- **B:** the machine-checked GOD-family gap theorem lives in a different
  record (r51 v1.1), not in this repo.
- **C–M:** no Lean [P] claimed in-text; tiers are stated per claim.

To build the Lean development, clone Res-Nova and follow its README
(`lake build`).
