#!/usr/bin/bash

# Written by CMO Reisser, Oct. 2018

# First, you have to remove the integrality of the header of the files, so that the vcf file starts directly with the first SNP.
# Store the header in another file called header.txt (grep "^#" in.vcf > header.txt)

# Here, I wanted to create a FASTA that included all SNP positions (even the SNPs that are reported by Freebayes as "AAA-AAC".
# Problem was the classical conversion from a VCF to FASTA requires only single-nucleotide-biallelic loci.
# A way to still use these tools is to modify your entries for the REF and ALT allele so that it fits the expectations.
# Then when your analysis (association or diversity...) is finished and you identified potential candidates or interesting loci, you can go back to the original vcf to recover the correct alleles.

# In VCF format, the REf and ALT alleles are listed in the 4th and 5th column.

awk '$4="A", $5="G"' OFS='\t' input.vcf > recoded.vcf


# Now to make it usable by VCF reading programs, we need to reattach the header:

cat header.txt recoded.vcf > recoded_final.vcf



################################################################
## Complete pipeline from a VCF out of freebayes, or VCFtools: #
################################################################

do
grep "^#" in.vcf > header.txt
done;

do
grep --line-buffered -v "^#" in.vcf | awk '$4="A", $5="G"' OFS='\t' > recoded.vcf
done;

do
cat header.txt recoded.vcf > final_recoded.vcf
done;

