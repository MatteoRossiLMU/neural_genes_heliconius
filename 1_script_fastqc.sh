#Run fastqc (quality check) on every individual RNA-seq sample located in a given directory

#example: for all melpomene adults
cd /data/home/wolfproj/wolfproj-06/GenePool_RNAseq_brain_data_July2014_Raw_reads/Adults/MP #go to this directory
individuals=$(ls -d *) #list files in directory and store as a list   
for i in $individuals    #start loop (for every file in directory)             
 do
  cd /data/home/wolfproj/wolfproj-06/1_FastQC/results/Adults/MP
  mkdir ./$i/                 
  (echo '#!/bin/bash'; echo '#SBATCH -J FastQC'; echo '#SBATCH -n 1'; echo 'module load fastqc/0.11.5'; echo "fastqc -o /data/home/wolfproj/wolfproj-06/1_FastQC/results/Adults/MP/$i/ -f fastq /data/home/wolfproj/wolfproj-06/GenePool_RNAseq_brain_data_July2014_Raw_reads/Adults/MP/$i/*.sanfastq.gz") | sbatch
 done

## COMMENTS
## SBATCH -n 1 = 1 core #use one core from the cluster
## last echo use "" otherwise treats $i as “character”
## LEGEND FastQC:  -o = output directory, -f = format, *.sanfastq.gz (at the end) are the files to check with fastqc 


#other example
#For Cydno individuals sampled at 156h APF (all in one directory)
cd /data/home/wolfproj/wolfproj-06/GenePool_RNAseq_brain_data_July2014_Raw_reads/156h_APF/CP
individuals=$(ls -d *)    
for i in $individuals                 
 do
  cd /data/home/wolfproj/wolfproj-06/1_FastQC/results/156h_APF/CP
  mkdir ./$i/                 
  (echo '#!/bin/bash'; echo '#SBATCH -J FastQC'; echo '#SBATCH -n 1'; echo 'module load fastqc/0.11.5'; echo "fastqc -o /data/home/wolfproj/wolfproj-06/1_FastQC/results/156h_APF/CP/$i/ -f fastq /data/home/wolfproj/wolfproj-06/GenePool_RNAseq_brain_data_July2014_Raw_reads/156h_APF/CP/$i/*.sanfastq.gz") | sbatch
 done

