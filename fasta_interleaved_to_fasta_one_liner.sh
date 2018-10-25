#!/usr/bin/bash

#Using the command to transform an interleaved fasta to a one sequence per line fasta:

awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' your_fasta_file.fasta > your_one_liner_fasta_file.fasta

