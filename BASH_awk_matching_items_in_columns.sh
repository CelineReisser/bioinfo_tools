#!/usr/bin/bash

# Keep lines of file 2 matching the first column of file 1:

file1=/path/to/your/file/containing/motifs/you/want/to/keep
file2=/path/to/the/file/you/want/to/filter

awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' file2 file1 > fitltered_file

