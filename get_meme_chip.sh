cat atac_210k_binary.txt | awk -F '_' -v OFS='\t' '{print $1,$2,$3,$4,$5,$6,$7,$8}'| awk -F '\t' -v OFS='\t' '{if ($5==0 && $6==0 && $7==0 && $8==1) print $0}' | awk -F '\t' -v OFS='\t' '{if ($9+$10+$11+$12>=1) print $0}' | awk -F '\t' -v OFS='\t' '{print $1,$2,$3}' > atac_210k_binary_mep1_gmp0_mepdown1.txt

sort -k1,1 -k2,2n atac_210k_binary_mep1_gmp0_mepdown1.txt > atac_210k_binary_mep1_gmp0_mepdown1.bed

bedtools getfasta -fi ~/group/genomes/mm10/mm10.fa -bed atac_210k_binary_mep1_gmp0_mepdown1.bed -fo atac_210k_binary_mep1_gmp0_mepdown1.fa

meme-chip -oc . -time 300 -order 1 -meme-mod zoops -meme-minw 6 -meme-maxw 30 -meme-nmotifs 3 -dreme-e 0.05 -centrimo-score 5.0 -centrimo-ethresh 10.0 atac_210k_binary_mep1_gmp0_mepdown1.fa


