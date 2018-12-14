#!/bin/sh

MAINFILE=scalpelCIDR

#REFSIZE=''
REFSIZE='\\small'

rm -f .pdflatex.log .bibtex.log $MAINFILE.{aux,bbl,blg,log,out,upa,upb,pdf}
echo pdflatex.1 && pdflatex $MAINFILE < /dev/null > .pdflatex.log && \
echo bibtex.1   && bibtex   $MAINFILE < /dev/null >   .bibtex.log && \
perl -i -p -e 's|^(\\begin\{thebibliography\}\{.*\})$|$1\n\n'"$REFSIZE"'|' $MAINFILE.bbl && \
echo pdflatex.2 && pdflatex $MAINFILE < /dev/null > .pdflatex.log && \
echo bibtex.2   && bibtex   $MAINFILE < /dev/null >   .bibtex.log && \
perl -i -p -e 's|^(\\begin\{thebibliography\}\{.*\})$|$1\n\n'"$REFSIZE"'|' $MAINFILE.bbl && \
echo pdflatex.3 && pdflatex $MAINFILE < /dev/null > .pdflatex.log && \
echo && egrep --color -i -1 'warning|error|written' .pdflatex.log || \
( echo ; cat .pdflatex.log 2>/dev/null ) && echo
( echo ; cat   .bibtex.log 2>/dev/null ) && echo
