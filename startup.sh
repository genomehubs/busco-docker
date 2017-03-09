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

mv run_output/short_summary_output.txt /out/$INFILE.busco.short_summary.txt
gzip -c run_output/full_table_output.tsv > /out/$INFILE.busco.full_table.tsv.gz
mv run_output/single_copy_busco_sequences ${INFILE}.busco.single_copy
tar -zcf ${INFILE}.busco.single_copy.tar.gz ${INFILE}.busco.single_copy
mv ${INFILE}.busco.single_copy.tar.gz /out

