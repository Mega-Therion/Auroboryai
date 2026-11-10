# Isabelle lane — Isabelle/HOL

The dimension identities behind the E8 branching in Res Nova §3,
as natural-number arithmetic in `Dimensions.thy`. Same identities as
the SymPy checks and the Coq development — one claim, four lanes.

Build (needs an Isabelle install):

```sh
isabelle build -d formal/isabelle Auroboryai
```

Status: the theory is written (2026-11-10) but has not been compiled
against an Isabelle install yet — no Isabelle toolchain was available
where it was written. It is the first rung of this lane: the
decompositions add up to 248. The branching proofs themselves (the
representation theory) are the next step, and are open work.
