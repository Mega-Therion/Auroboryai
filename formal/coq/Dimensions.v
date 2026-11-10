(* Dimensions.v — Coq 8.18.
   The dimension identities behind the E8 branching in Res Nova §3,
   proved as natural-number arithmetic. These are the same identities
   checked symbolically in formal/sympy/check_dimensions.py and stated
   in formal/isabelle/Dimensions.thy — one claim, four lanes.
   Build: coqc formal/coq/Dimensions.v *)

Require Import Arith Lia.

(* 240 E8 roots; 248 = 240 + 8 (Cartan subalgebra). *)
Lemma dim_248_roots : 240 + 8 = 248.
Proof. lia. Qed.

(* The transition number: 240^2 = 57,600. *)
Lemma dim_57600 : 240 ^ 2 = 57600.
Proof. reflexivity. Qed.

(* Spin(16)/Z2: 248 = 120 (+) 128. *)
Lemma dim_spin16 : 120 + 128 = 248.
Proof. lia. Qed.

(* E6 x SU(3): 248 = (8,1) + (1,78) + (3,27) + (3bar,27bar). *)
Lemma dim_e6_su3 : 8 + 78 + 3 * 27 + 3 * 27 = 248.
Proof. lia. Qed.

(* E6 27 = 16 (+) 10 (+) 1 under SO(10) x U(1). *)
Lemma dim_e6_27 : 16 + 10 + 1 = 27.
Proof. lia. Qed.

(* E6 78 = 1 (+) 45 (+) 16 (+) 16bar under SO(10) x U(1). *)
Lemma dim_e6_78 : 1 + 45 + 16 + 16 = 78.
Proof. lia. Qed.

(* Pati-Salam: 16 -> (4,2,1) (+) (4bar,1,2). *)
Lemma dim_ps_16 : 4 * 2 + 4 * 2 = 16.
Proof. lia. Qed.

(* Pati-Salam: 45 -> (15,1,1) (+) (6,2,2) (+) (1,3,1) (+) (1,1,3). *)
Lemma dim_ps_45 : 15 + 6 * 2 * 2 + 3 + 3 = 45.
Proof. lia. Qed.
