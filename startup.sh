#!/bin/bash

cp /in/$ASSEMBLY ./

if [[ $ASSEMBLY =~ \.gz$ ]]; then
  gunzip $ASSEMBLY
  ASSEMBLY=${ASSEMBLY%.gz}
fi

BUSCO.py \
       -i $ASSEMBLY \
       -o output \
       $@

mv run_output/short_summary_output.txt /out/$ASSEMBLY.busco.short_summary.txt
gzip -c run_output/full_table_output.tsv > /out/$ASSEMBLY.busco.full_table.tsv.gz
mv run_output/single_copy_busco_sequences ${ASSEMBLY}.busco.single_copy
tar -zcf ${ASSEMBLY}.busco.single_copy.tar.gz ${ASSEMBLY}.busco.single_copy
mv ${ASSEMBLY}.busco.single_copy.tar.gz /out

