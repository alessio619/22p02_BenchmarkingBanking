
set.seed(313)

# : ===========================================================

### 

# B. DATA ===================================================================================

## All -------------------------------------------------------------
benchmark_cc = fread(path(getwd(), 'yy.data', 'data', 'benchmark_cc_v1.csv')) 
isc_profiles = fread(path(getwd(), 'yy.data', 'data', 'isc_esempio_v1_long.csv'))  
bank_accounts = fread(path(getwd(), 'yy.data', 'legend_accounts.csv'))

isc_profiles[, voice_type_desc.1 := NULL]


cc_names = fread(path(getwd(), 'yy.data', 'cc_names.csv'))
cc_names[, V2 := NULL]
colnames(cc_names) <- "cc_names"

## By Product -------------------------------------------------------

bch_cc_t = transpose(benchmark_cc, make.names = 'code')
bch_cc_t_names = data.table('names' = colnames(benchmark_cc)[-2])
bch_cc_t_banca = data.table('banca' = c(NA, NA, 'isp', 'isp', 'uni', 'uni', 'uni', 'uni', 'ubi', 'cag', 'cag', 'cag', 'bpm', 'mps', 'mps', 'mps', 'mps', 'mps', 'mps', 'bnl', 'bnl', 'bnl', 'bpr', 'cdm'))
bch_cc_t_ccnames = data.table('cc_names' = c(NA, NA, cc_names$cc_names))

bch_cc_t = cbind(bch_cc_t_names, bch_cc_t)
bch_cc_t = cbind(bch_cc_t_banca, bch_cc_t)
bch_cc_t = cbind(bch_cc_t_ccnames, bch_cc_t)
bch_cc_t = bch_cc_t[-c(1:2)]
         
benchmark_cc_items = benchmark_cc[, .(group = type, items = name, item_code = code)]

benchmark_cc_grouped_names = as.data.table(names(benchmark_cc))[-c(1:3)]
benchmark_cc_grouped = benchmark_cc[, lapply(.SD, mean, na.rm = TRUE), by = .(type), .SDcols = benchmark_cc_grouped_names$V1]
