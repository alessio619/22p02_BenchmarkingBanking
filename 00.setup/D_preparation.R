


# : ===========================================================

### 

# B. DATA ===================================================================================

## All -------------------------------------------------------------
benchmark_cc = fread(path(getwd(), 'yy.data', 'data', 'benchmark_cc_v1.csv'))


## By Product -------------------------------------------------------
bch_cc_t = transpose(benchmark_cc, make.names = 'code')
bch_cc_t_names = data.table('names' = colnames(benchmark_cc)[-2])
bch_cc_t_banca = data.table('banca' = c(NA, NA, 'isp', 'isp', 'uni', 'uni', 'uni', 'uni', 'ubi', 'cag', 'cag', 'cag', 'bpm', 'mps', 'mps', 'mps', 'mps', 'mps', 'mps', 'bnl', 'bnl', 'bnl', 'bpr', 'cdm'))

bch_cc_t = cbind(bch_cc_t_names, bch_cc_t)
bch_cc_t = cbind(bch_cc_t_banca, bch_cc_t)

benchmark_cc_items = benchmark_cc[, .(group = type, items = name, item_code = code)]
