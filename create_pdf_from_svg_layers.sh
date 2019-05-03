#!/bin/bash
#define SVG file to parse
INPUT_FILE=$1
OUTPUT_FILE="${1%.*}.pdf" # output filename is the same as input — just changing .svg into .pdf
#export one pdf per layer
inkscape --query-all $INPUT_FILE | #get the list of object in the SVG file
grep layer | #keep only those that begins with 'layer'
awk -F, -v filename="$INPUT_FILE" '{print "inkscape --without-gui --export-id " $1 " --export-area-page --file " filename "  --export-pdf  temp_pdf_" sprintf("%03d", NR) ".pdf"}' | #for each object line, keep only the term before the first ',' (i.e. the layer ID), and print the command to print this layer only
xargs -0 bash -c #execute the previously printed commands
#concatenate generated PDF
pdfunite temp_pdf_* $OUTPUT_FILE
#delete generated PDF
\rm temp_pdf_*
#ends
