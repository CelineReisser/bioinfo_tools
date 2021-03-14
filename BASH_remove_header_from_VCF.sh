#!/usr/bin/bash

# remove even the row names:
grep -v "^#" infile.vcf > outfile.vcf

# Remove the INFO lines, but keep the row names line (#CHROM...):
grep -v "^##" infile.vcf > outfile.vcf
