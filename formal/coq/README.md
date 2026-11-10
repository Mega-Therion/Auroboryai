# Coq lane — Coq 8.18

The dimension identities behind the E8 branching in Res Nova §3,
proved as natural-number arithmetic in `Dimensions.v`. Same identities
as the SymPy checks and the Isabelle theory — one claim, four lanes.

Build:

```sh
coqc formal/coq/Dimensions.v
```

These are arithmetic identities, the first rung of the lane: they prove
the decompositions add up to 248. The branching proofs themselves
(the representation theory) are the next step for this lane, and are
open work — nothing here claims more than what the file proves.
