#!/usr/bin/bash
#C. Reisser Nov. 2018

#This code is to filter a VCF based on a list of SNPs you want to extract.
# Some programs will give you a VCF that contains in the ID column individual keys, so that each SNP of your file can be individually identified. 
# However, programs like Freebayes often leave this column empty, or uses a code that does not allow for individual identification of each SNP.
# Here is a code to create a "single_ID" field in a vcf file and filter a given list of SNP (say the significantly associated one from a GWAS) to end up with a VCF composed of just those SNPs:

################################
# Files to have before starting:
# - your vcf file that you want to filter (output from Freebayes for example)
# - a list of SNPs you want to keep (significant_SNPs.txt). The names of those SNPs should be in the form: CHROM_position (that is, the exact location of the SNPs, from the CHROM and Pos columns of your VCF)
# example of significant_SNPs.txt:
#
#   scaffold0001_34028
#   scaffold10947_2220824
#   ...

#---------------------------------------------
#Step 1: creation of all the necessary inputs

# We need to separate the header from the rest of the vcf file in order for the code to work:

grep -v "^#" your_original_vcf.vcf > no_header_vcf.vcf
grep "^#" your_original_vcf.vcf > header.txt

#---------------------------------------------------------------------------
#Step 2: creating a "single_ID" filed in the 1st column of no_header_vcf.vcf

awk '{OFS = "_" ; print $1,$2}' no_header_vcf.vcf | paste - no_header_vcf.vcf > single_ID_no_header_vcf.vcf

#-----------------------------------------------
#Step 3: keep only the SNPs that are significant:

grep -f significant_SNPs.txt single_ID_no_header_vcf.vcf > single_ID_no_header_vcf_significant.vcf
awk 'FNR==NR {a[$1]=$0; next}; $1 in a {print a[$1]}' single_ID_no_header_vcf.vcf significant_SNPs.txt > single_ID_no_header_vcf_significant.vcf

#----------------------------------------
#Step 4: reformat it so that it is a VCF:

#Remove first column and reattach the header
awk '{ $1=""; print $0 }' single_ID_no_header_vcf_significant.vcf | cat header.txt - > your_filtered_vcf.vcf

#-----------------------------
#Step 5: clean your workspace:

rm single_ID_no_header_vcf_significant.vcf
rm single_ID_no_header_vcf_significant.vcf
rm single_ID_no_header_vcf.vcf
rm no_header_vcf.vcf
rm header.txt





