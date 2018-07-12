#!/bin/bash

# enter directory with raw FASTQs
cd ~/Documents/hbc\ training/intro\ to\ Shell/unix_lesson/raw_fastq

# count bad reads for each FASTQ file in our directory
for filename in *.fq
do 
	# create a prefix for all output files
	base=`basename $filename .subset.fq`

	# tell us what file we're working on
	echo $filename

	# grab all the bad read records
	grep -B1 -A2 NNNNNNNNNN $filename > $base-badreads.fastq
	
	# grab the number of bad reads and write it to a summary file
	grep -cH NNNNNNNNNN $filename > $base-badreads.count.summary
done
