(* Dimensions.thy — Isabelle/HOL.
   The dimension identities behind the E8 branching in Res Nova §3,
   as natural-number arithmetic. Same identities as the SymPy checks
   and the Coq development — one claim, four lanes.
   NOTE: written 2026-11-10; not yet compiled against an Isabelle
   install. Build: isabelle build -d formal/isabelle Auroboryai *)

theory Dimensions
  imports Main
begin

(* 240 E8 roots; 248 = 240 + 8 (Cartan subalgebra). *)
lemma dim_248_roots: "(240::nat) + 8 = 248"
  by simp

(* The transition number: 240^2 = 57,600. *)
lemma dim_57600: "(240::nat)^2 = 57600"
  by simp

(* Spin(16)/Z2: 248 = 120 (+) 128. *)
lemma dim_spin16: "(120::nat) + 128 = 248"
  by simp

(* E6 x SU(3): 248 = (8,1) + (1,78) + (3,27) + (3bar,27bar). *)
lemma dim_e6_su3: "8 + 78 + 3*27 + 3*27 = (248::nat)"
  by simp

(* E6 27 = 16 (+) 10 (+) 1 under SO(10) x U(1). *)
lemma dim_e6_27: "(16::nat) + 10 + 1 = 27"
  by simp

(* E6 78 = 1 (+) 45 (+) 16 (+) 16bar under SO(10) x U(1). *)
lemma dim_e6_78: "(1::nat) + 45 + 16 + 16 = 78"
  by simp

(* Pati-Salam: 16 -> (4,2,1) (+) (4bar,1,2). *)
lemma dim_ps_16: "(4::nat)*2 + 4*2 = 16"
  by simp

(* Pati-Salam: 45 -> (15,1,1) (+) (6,2,2) (+) (1,3,1) (+) (1,1,3). *)
lemma dim_ps_45: "(15::nat) + 6*2*2 + 3 + 3 = 45"
  by simp

end
