OUT_FOLD="."

ls ../../examples/idxstats/leopard |xargs -I % realpath % > ${OUT_FOLD}/leopard_list
ls ../../examples/idxstats/impala |xargs -I % realpath % > ${OUT_FOLD}/impala_list
ls ../../examples/idxstats/muskox |xargs -I % realpath % > ${OUT_FOLD}/muskox_list
ls ../../examples/idxstats/finches |xargs -I % realpath % > ${OUT_FOLD}/finches_list
ls ../../examples/idxstats/grey_whale |xargs -I % realpath % > ${OUT_FOLD}/whales_list
ls ../../examples/idxstats/wtrbuck |xargs -I % realpath % > ${OUT_FOLD}/wtrbuck_list

## general idea is Rscript --vanilla ./satc.R <species_name>_<depth> ${OUT_FOLD}/<list of idxstat files> ${OUT_FOLD}/ <simulated depth> <real depth>

nice Rscript --vanilla ./satc.R leopard_1 ${OUT_FOLD}/leo_list ${OUT_FOLD}/ 1 4.2 &
nice Rscript --vanilla ./satc.R impala_1 ${OUT_FOLD}/impala_list ${OUT_FOLD}/ 1 3.1 &
nice Rscript --vanilla ./satc.R finches_1 ${OUT_FOLD}/finches_list ${OUT_FOLD}/ 1 13.8 &
nice Rscript --vanilla ./satc.R muskox_1 ${OUT_FOLD}/muskox_list ${OUT_FOLD}/ 1 11.4 &
nice Rscript --vanilla ./satc.R wtrbuck_1 ${OUT_FOLD}/wtrbuck_list ${OUT_FOLD}/ 1 3.4 &
nice Rscript --vanilla ./satc.R whales_1 ${OUT_FOLD}/whales_list ${OUT_FOLD}/ 1 5.8 &
    
    
nice Rscript --vanilla ./satc.R leopard_05 ${OUT_FOLD}/leo_list ${OUT_FOLD}/ 0.5 4.2 &
nice Rscript --vanilla ./satc.R impala_05 ${OUT_FOLD}/impala_list ${OUT_FOLD}/ 0.5 3.1 &
nice Rscript --vanilla ./satc.R finches_05 ${OUT_FOLD}/finches_list ${OUT_FOLD}/ 0.5 13.8 &
nice Rscript --vanilla ./satc.R muskox_05 ${OUT_FOLD}/muskox_list ${OUT_FOLD}/ 0.5 11.4 &
nice Rscript --vanilla ./satc.R wtrbuck_05 ${OUT_FOLD}/wtrbuck_list ${OUT_FOLD}/ 0.5 3.4 &
nice Rscript --vanilla ./satc.R whales_05 ${OUT_FOLD}/whales_list ${OUT_FOLD}/ 0.5 5.8 &
  
nice Rscript --vanilla ./satc.R leopard_01 ${OUT_FOLD}/leo_list ${OUT_FOLD}/ 0.1 4.2 &
nice Rscript --vanilla ./satc.R impala_01 ${OUT_FOLD}/impala_list ${OUT_FOLD}/ 0.1 3.1 &
nice Rscript --vanilla ./satc.R finches_01 ${OUT_FOLD}/finches_list ${OUT_FOLD}/ 0.1 13.8 &
nice Rscript --vanilla ./satc.R muskox_01 ${OUT_FOLD}/muskox_list ${OUT_FOLD}/ 0.1 11.4 &
nice Rscript --vanilla ./satc.R wtrbuck_01 ${OUT_FOLD}/wtrbuck_list ${OUT_FOLD}/ 0.1 3.4 &
nice Rscript --vanilla ./satc.R whales_01 ${OUT_FOLD}/whales_list ${OUT_FOLD}/ 0.1 5.8 &
  
nice Rscript --vanilla ./satc.R leopard_001 ${OUT_FOLD}/leo_list ${OUT_FOLD}/ 0.01 4.2 &
nice Rscript --vanilla ./satc.R impala_001 ${OUT_FOLD}/impala_list ${OUT_FOLD}/ 0.01 3.1 &
nice Rscript --vanilla ./satc.R finches_001 ${OUT_FOLD}/finches_list ${OUT_FOLD}/ 0.01 13.8 &
nice Rscript --vanilla ./satc.R muskox_001 ${OUT_FOLD}/muskox_list ${OUT_FOLD}/ 0.01 11.4 &
nice Rscript --vanilla ./satc.R wtrbuck_001 ${OUT_FOLD}/wtrbuck_list ${OUT_FOLD}/ 0.01 3.4 &
nice Rscript --vanilla ./satc.R whales_001 ${OUT_FOLD}/whales_list ${OUT_FOLD}/ 0.01 5.8 &

  
  
