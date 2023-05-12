#! /bin/bash

# Download tutorial data 
cd MPRAsnakeflow/assoc_basic/data
wget ftp://ftp.ncbi.nlm.nih.gov/geo/samples/GSM4237nnn/GSM4237954/suppl/GSM4237954_9MPRA_elements.fa.gz
zcat GSM4237954_9MPRA_elements.fa.gz |awk '{ count+=1; if (count == 1) { print } else { print substr($1,1,171)}; if (count == 2) { count=0 } }' > design.fa
conda activate mprasnakeflow
prefetch SRR10800986
fastq-dump --gzip --split-files SRR10800986