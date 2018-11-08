#!/usr/bin/env bash
#PBS -q 
#PBS -l walltime=
#PBS -l 
#PBS -o 
#PBS -N get_homozygotes

DATADIRECTORY=
INDIR=

# Here we focused on a particular individual in column 12, for which we wanted to select only homozygous sites:

cat $INDIR/sex_det_snp_DP10_maf0.1_miss0.9.recode.vcf | awk '$12 ~ "0/0:" ' > $INDIR/sex_det_snp_DP10_maf0.1_miss0.hom00.vcf
cat $INDIR/sex_det_snp_DP10_maf0.1_miss0.9.recode.vcf | awk '$12 ~ "1/1:" ' > $INDIR/sex_det_snp_DP10_maf0.1_miss0.hom11.vcf

cat $INDIR/sex_det_snp_DP10_maf0.1_miss0.9.recode.vcf | grep "#" > $INDIR/vcf.header.txt

cat $INDIR/vcf.header.txt $INDIR/sex_det_snp_DP10_maf0.1_miss0.hom00.vcf $INDIR/sex_det_snp_DP10_maf0.1_miss0.hom11.vcf > $INDIR/sex_det_snp_DP10_maf0.1_miss0.9.final.vcf



#selecting stricly heterozygous individuals for the rest of the dataset (selection made on multiple individuals at once)

cat 'H:\WORK\SEX-DET_Pmarg\WGS\results\GWAS\sex_det_snp_DP10_maf0.1_miss0.final_biallelic.vcf' | awk '$10 ~ "0/1" ' | awk '$11 ~ "0/1" ' | awk '$13 ~ "0/1" ' | awk '$14 ~ "0/1" ' | awk '$15 ~ "0/1" ' | awk '$16 ~ "0/1" ' | awk '$17 ~ "0/1" ' | awk '$18 ~ "0/1" ' | awk '$19 ~ "0/1" ' | awk '$20 ~ "0/1" ' | awk '$21 ~ "0/1" ' | awk '$22 ~ "0/1" ' > 'H:\WORK\SEX-DET_Pmarg\WGS\results\GWAS\DP10_maf0.1_miss0_femHom_malHet_biallelic.vcf'



#selecting heterozygous individuals allowing for the presence of missing data

cat 'H:\WORK\SEX-DET_Pmarg\WGS\results\GWAS\sex_det_snp_DP10_maf0.1_miss0.9.final_biallelic.vcf' | awk '$10 ~ "0/1" || $10 == ".:.:.:.:.:.:.:.:." ' | awk '$11 ~ "0/1" || $11 == ".:.:.:.:.:.:.:.:." ' | awk '$13 ~ "0/1" || $13 == ".:.:.:.:.:.:.:.:." ' | awk '$14 ~ "0/1" || $14 == ".:.:.:.:.:.:.:.:." ' | awk '$15 ~ "0/1" || $15 == ".:.:.:.:.:.:.:.:." ' | awk '$16 ~ "0/1" || $16 == ".:.:.:.:.:.:.:.:." ' | awk '$17 ~ "0/1" || $17 == ".:.:.:.:.:.:.:.:." ' | awk '$18 ~ "0/1" || $18 == ".:.:.:.:.:.:.:.:." ' | awk '$19 ~ "0/1" || $19 == ".:.:.:.:.:.:.:.:." ' | awk '$20 ~ "0/1" || $20 == ".:.:.:.:.:.:.:.:." ' | awk '$21 ~ "0/1" || $21 == ".:.:.:.:.:.:.:.:." ' | awk '$22 ~ "0/1" || $22 == ".:.:.:.:.:.:.:.:." ' > 'H:\WORK\SEX-DET_Pmarg\WGS\results\GWAS\DP10_maf0.1_miss0.9_femHom_malHet_biallelic.vcf'
