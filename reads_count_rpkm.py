import numpy as np

data = open('reads_count_matrix_5end_all_data.txt','r')
data0 = []
### read reads count matrix
for records in data:
	tmp = [x.strip() for x in records.split('\t')]
	data0.append(tmp)
data0 = np.array(data0)
data.close()

### read total reads
data_t = open('reads_count_matrix_5end_all_data.txt','r')
data0_t = []
### read matrix
for records in data_t:
	tmp = [x.strip() for x in records.split('\t')]
	data0_t.append(tmp)
data0_t = np.array(data0_t, dtype = float)
data_t.close()

### get rpkm & write output
result = open('reads_count_matrix_5end_all_data_rpkm.txt', 'w')

for records in data0:
	result.write(records[0]+'\t'+records[1]+'\t'+records[2]+'\t'+records[3]+'\t'+records[4]+'\t')
	for i in range(5,len(records)):
		C = float(records[i])
		N = float(data0_t[i-5])
		L = float(records[4])
		rpkm = round((10^9 * C)/(N * L), 2)
		result.write(str(rpkm)+'\t')
	result.write('\n')
result.close()