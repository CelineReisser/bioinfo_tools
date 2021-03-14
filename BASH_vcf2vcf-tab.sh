#!/usr/bin/env bash
#PBS -q 
#PBS -l walltime=
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o 98_log_files
#PBS -N vcf2tab


INDIR=/your/path/to/VCF_file.vcf
VCFTOOLSENV=/your/path/to/vcftools

$VCFTOOLSENV
cd $INDIR

vcf-to-tab < $INDIR/your_vcf.vcf > $INDIR/your_vcf.tab
