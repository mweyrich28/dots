#!/bin/bash
set -euo pipefail

TMPDIR="$HOME/.config/scripts/vim/tmp"
mkdir -p "$TMPDIR"
TMPFILE="$TMPDIR/latex.tex" PDF="$TMPDIR/latex.pdf"

# LaTeX header template
HEADER="\\documentclass[border=20pt,preview]{standalone}  
\\usepackage{amsmath}  
\\begin{document}  
\\end{document}"

if [[ ! -f "$TMPFILE" ]]; then
    echo "$HEADER" > "$TMPFILE"
fi

gnome-terminal -- nvim "$TMPFILE"

# Continue with LaTeX processing
cd "$TMPDIR" || exit
echo "[INFO] Compiling LaTeX..."
xelatex -interaction=nonstopmode "$TMPFILE"

if [[ ! -f "$PDF" ]]; then
    echo "[ERROR] PDF not found: $PDF"
    exit 1
fi

# Convert PDF to PNG
BASENAME="image"
echo "[INFO] Converting to PNG..."
pdftoppm -png -r 350 "$PDF" "$BASENAME"

PNG="$TMPDIR/${BASENAME}-1.png"
if [[ ! -f "$PNG" ]]; then
    echo "[ERROR] PNG not created: $PNG"
    exit 1
fi

# Trim and copy to clipboard
echo "[INFO] Processing image and copying to clipboard..."
convert "$PNG" -trim -bordercolor White -border 10x10 +repage "$PNG"
xclip -selection clipboard -t image/png -i "$PNG"
echo "[INFO] All done!"

