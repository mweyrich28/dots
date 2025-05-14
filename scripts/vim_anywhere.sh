#!/bin/bash

# header for latex doc
HEADER="
\documentclass[border=20pt,preview]{standalone}  
\usepackage{amsmath}  
\begin{document}  



\end{document}"

# path to tmp dir where all files are created (and deleted)
TMPDIR=/home/malte/.config/scripts/vim/tmp
TMPFILE=$TMPDIR/latex.tex
PDF="$TMPDIR/latex.pdf"
PNG="$TMPDIR/image-1.png"

# create initial tex doc
echo "$HEADER" > $TMPFILE

# go to tmp dir
cd "$TMPDIR" || exit

ghostty -e nvim $TMPFILE

until [ -f $TMPFILE ]
do
    sleep 1
done

xelatex -interaction=nonstopmode "$TMPFILE" # compile
pdftoppm -png -r 350 "$PDF" "$TMPDIR/image" # to png
convert "$PNG" -trim -bordercolor White -border 10x10 +repage "$PNG"
xclip -selection clipboard -t image/png -i "$PNG" # save to clipboard

# Cleanup
rm "$TMPDIR/image-1.png"
rm "$TMPFILE"
rm "$PDF"
