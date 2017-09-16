echo -e chrom'\t'start'\t'end'\t'name'\t'length'\t'B'\t'CFU-E'\t'CFU-Mk'\t'CMP'\t'ER4'\t'ery'\t'G1E'\t'GMP'\t'LSK'\t'megs'\t'MEP'\t'Mono'\t'neutrophil'\t'NK'\t'TCD4'\t'TCD8 > reads_count_matrix_celltype.txt

cat reads_count_matrix_5end_all_data_rpkm.txt | awk -F '\t' -v OFS='\t' '{print $1,$2,$3,$4,$5, $6, ($7+$8)/2, ($9+$10)/2, ($11+$12)/2, ($13+$14)/2, ($15+$16)/2, ($17+$18)/2, ($19+$20)/2, ($21+$22)/2, ($23+$24)/2, ($25+$26)/2, ($27+$28)/2, ($29+$30)/2, $31, $32, $33 }' >> reads_count_matrix_celltype.txt

# sort columns lsk_cmp_gmp_mep_cfue_ery_cfumk_meg_mono_neutrophil_b_nk_tcd4_tcd8_g1e_er4

cat reads_count_matrix_celltype.txt | awk -F '\t' -v OFS='\t' '{print $1,$2,$3,$4, $14"_"$9"_"$13"_"$16"_"$7"_"$11"_"$8"_"$15"_"$17"_"$18"_"$6"_"$19"_"$20"_"$21"_"$12"_"$10 }' > reads_count_matrix_celltype_columnsort.txt

time python vlookup.py -t reads_count_matrix_celltype_columnsort.txt -m 4 -s atac_21k_binary.txt -n 4 -o reads_count_matrix_celltype_sorted.txt

cat reads_count_matrix_celltype_sorted.txt | awk -F '\t' -v OFS='\t' '{print $1,$2,$3,$4,$5}' > reads_count_matrix_celltype_sorted_rpkm.txt

cat reads_count_matrix_celltype_sorted.txt | awk -F '_' -v OFS='\t' '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16}' | awk -F '\t' -v OFS='\t' '{print $4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20}' > reads_count_matrix_celltype_sorted_rpkm.cdt

cat atac_21k.txt | awk -F '_' -v OFS='\t' '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16}' | awk -F '\t' -v OFS='\t' '{print $5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$20,$21}' > atac_21k.cdt
