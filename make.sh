#!/bin/sh
rm scalpelCIDR.aux paper.bbl
pdflatex scalpelCIDR
bibtex scalpelCIDR
pdflatex scalpelCIDR
pdflatex scalpelCIDR
