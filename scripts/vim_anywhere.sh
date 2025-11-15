#!/bin/bash
set -euo pipefail

TMPDIR="$HOME/.config/scripts/vim/tmp"
mkdir -p "$TMPDIR"
TMPFILE="$TMPDIR/latex.tex"
PDF="$TMPDIR/latex.pdf"

# LaTeX header template
HEADER="\\documentclass[border=20pt,preview]{standalone}
\\usepackage{amsmath}
\\usepackage{amsfonts}
\\usepackage{amssymb}
\\begin{document}

\\end{document}"

# Create template file if it doesn't exist
if [[ ! -f "$TMPFILE" ]]; then
    echo "$HEADER" > "$TMPFILE"
fi

# Open editor and wait for it to close
gnome-terminal --wait -- nvim "$TMPFILE"

# Continue with LaTeX processing
cd "$TMPDIR" || exit

echo "[INFO] Compiling LaTeX..."
if ! xelatex -interaction=nonstopmode "$TMPFILE"; then
    echo "[ERROR] LaTeX compilation failed"
    exit 1
fi

if [[ ! -f "$PDF" ]]; then
    echo "[ERROR] PDF not found: $PDF"
    exit 1
fi

# Convert PDF to PNG
BASENAME="image"
echo "[INFO] Converting to PNG..."
if ! pdftoppm -png -r 350 "$PDF" "$TMPDIR/$BASENAME"; then
    echo "[ERROR] PDF to PNG conversion failed"
    exit 1
fi

# Find the actual PNG file created (pdftoppm might create image-01.png or image-1.png)
PNG=""
for possible_png in "$TMPDIR/${BASENAME}-01.png" "$TMPDIR/${BASENAME}-1.png" "$TMPDIR/${BASENAME}.png"; do
    if [[ -f "$possible_png" ]]; then
        PNG="$possible_png"
        break
    fi
done

if [[ -z "$PNG" ]] || [[ ! -f "$PNG" ]]; then
    echo "[ERROR] PNG not created. Files in $TMPDIR:"
    ls -la "$TMPDIR"/*.png 2>/dev/null || echo "No PNG files found"
    exit 1
fi

echo "[INFO] Found PNG: $PNG"

# Trim and copy to clipboard
echo "[INFO] Processing image and copying to clipboard..."
if ! convert "$PNG" -trim -bordercolor White -border 10x10 +repage "$PNG"; then
    echo "[ERROR] Image processing failed"
    exit 1
fi

if ! xclip -selection clipboard -t image/png -i "$PNG"; then
    echo "[ERROR] Failed to copy to clipboard"
    exit 1
fi

echo "[INFO] All done!"
