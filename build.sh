#!/bin/bash
# Build all fifteen papers from a clean checkout.
# Requires a TeX Live install with pdflatex (texlive-latex-base,
# texlive-latex-recommended, texlive-fonts-recommended, texlive-pictures,
# texlive-latex-extra, lmodern).
set -e
ROOT="$(cd "$(dirname "$0")" && pwd)"
export TEXINPUTS="$ROOT:"

build_one() {
  local dir="$1" tex="$2"
  (cd "$dir" && pdflatex -halt-on-error "$tex" >/dev/null && pdflatex -halt-on-error "$tex" >/dev/null)
  echo "built $dir/$tex"
}

build_one papers/res-nova res-nova.tex
build_one papers/euclid-predictions shadow-ladder-euclid-dr1-predictions-paper.tex
build_one papers/A law-of-god-successor.tex
build_one papers/B IT-PLEROMA-god-distilled.tex
build_one papers/C flagship.tex
build_one papers/D geometric-phase-force.tex
build_one papers/E geometric-foundation.tex
build_one papers/F adccl-successor.tex
build_one papers/G omega-successor.tex
build_one papers/H neurotopo-successor.tex
build_one papers/I holonomery.tex
build_one papers/J abc-successor.tex
build_one papers/K conformal-successor.tex
build_one papers/L resourceholonomy-successor.tex
build_one papers/M omegacdm.tex

echo "All fifteen papers built."
