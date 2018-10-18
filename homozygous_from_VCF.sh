#!/usr/bin/env bash
#PBS -q mpi
#PBS -l walltime=24:00:00
#PBS -l select=1:ncpus=28:mem=115g
#PBS -o /home1/datawork/creisser/sex_det/98_log_files
#PBS -N get_homozygotes

DATADIRECTORY=/home1/scratch/creisser/sex_det/07_freebayes
INDIR=/home1/scratch/creisser/sex_det/07_freebayes

# Here we focused on a particular individual in column 12, for which we wanted to select only homozygous sites:

cat $INDIR/sex_det_snp_DP10_maf0.1_miss0.9.recode.vcf | awk '$12 ~ "0/0:" ' > $INDIR/sex_det_snp_DP10_maf0.1_miss0.hom00.vcf
cat $INDIR/sex_det_snp_DP10_maf0.1_miss0.9.recode.vcf | awk '$12 ~ "1/1:" ' > $INDIR/sex_det_snp_DP10_maf0.1_miss0.hom11.vcf

cat $INDIR/sex_det_snp_DP10_maf0.1_miss0.9.recode.vcf | grep "#" > $INDIR/vcf.header.txt

cat $INDIR/vcf.header.txt $INDIR/sex_det_snp_DP10_maf0.1_miss0.hom00.vcf $INDIR/sex_det_snp_DP10_maf0.1_miss0.hom11.vcf > $INDIR/sex_det_snp_DP10_maf0.1_miss0.9.final.vcf
