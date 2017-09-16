### get reads count matrix
cat reads_count_matrix_5end_1.txt | awk -F '\t' -v OFS='\t' '{print $1,$2,$3,$4,$5}' > reads_count_matrix_5end_1_info.txt

cat reads_count_matrix_5end_1.txt | awk -F '\t' -v OFS='\t' '{print $6, $7, $8, $9, $10, $11}' > reads_count_matrix_5end_1_data.txt
cat reads_count_matrix_5end_2.txt | awk -F '\t' -v OFS='\t' '{print $6, $7}' > reads_count_matrix_5end_2a_data.txt
cat reads_count_matrix_5end_2.txt | awk -F '\t' -v OFS='\t' '{print             $9, $10, $11}' > reads_count_matrix_5end_2b_data.txt
cat reads_count_matrix_5end_3.txt | awk -F '\t' -v OFS='\t' '{print $6, $7, $8, $9}' > reads_count_matrix_5end_3_data.txt
cat reads_count_matrix_5end_4.txt | awk -F '\t' -v OFS='\t' '{print $6, $7, $8, $9, $10}' > reads_count_matrix_5end_4_data.txt
cat reads_count_matrix_5end_5.txt | awk -F '\t' -v OFS='\t' '{print $6, $7, $8, $9, $10}' > reads_count_matrix_5end_5_data.txt
cat reads_count_matrix_5end_6.txt | awk -F '\t' -v OFS='\t' '{print $6, $7}' > reads_count_matrix_5end_6_data.txt
cat reads_count_matrix_5end_7.txt | awk -F '\t' -v OFS='\t' '{print $6}' > reads_count_matrix_5end_7_data.txt

paste reads_count_matrix_5end_1_info.txt reads_count_matrix_5end_1_data.txt reads_count_matrix_5end_5_data.txt reads_count_matrix_5end_2a_data.txt reads_count_matrix_5end_7_data.txt reads_count_matrix_5end_2b_data.txt reads_count_matrix_5end_3_data.txt reads_count_matrix_5end_6_data.txt reads_count_matrix_5end_4_data.txt > reads_count_matrix_5end_all_data.txt


### get total reads vector
cat total_reads1.txt > total_reads_all.txt
cat total_reads5.txt >> total_reads_all.txt
cat total_reads2.txt >> total_reads_all.txt
head -4 total_reads3.txt >> total_reads_all.txt
cat total_reads6.txt >> total_reads_all.txt
cat total_reads4.txt >> total_reads_all.txt

### get rpkm matrix
time python reads_count_rpkm.py
