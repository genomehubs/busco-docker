#!/bin/bash

cp /in/$INFILE ./

if [[ $INFILE =~ \.gz$ ]]; then
  gunzip $INFILE
  INFILE=${INFILE%.gz}
fi

BUSCO.py \
       -i $INFILE \
       -o output \
       $@

mv run_output/short_summary_output.txt /out/$INFILE.short_summary.txt
gzip -c run_output/full_table_output.tsv > /out/$INFILE.full_table.tsv.gz
mv run_output/single_copy_busco_sequences ${INFILE}_single_copy_busco_sequences
tar -zcf ${INFILE}_single_copy_busco_sequences.tar.gz ${INFILE}_single_copy_busco_sequences
mv ${INFILE}_single_copy_busco_sequences.tar.gz /out

