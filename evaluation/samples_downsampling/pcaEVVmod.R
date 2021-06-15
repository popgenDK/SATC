OUT_FOLD="/home/casia16/SATCnew/review/pcaEVVmod"
nice Rscript --vanilla ./satc.R leopard ${OUT_FOLD}/leo_list ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R impala ${OUT_FOLD}/impala_list ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R finches ${OUT_FOLD}/finches_list ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R muskox ${OUT_FOLD}/muskox_list ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R wtrbuck ${OUT_FOLD}/wtrbuck_list ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R whales ${OUT_FOLD}/whales_list ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R whales ${OUT_FOLD}/gazelle_list ${OUT_FOLD} &
  
  nice Rscript --vanilla ./satc.R leopard_2each ${OUT_FOLD}/leopard_only2each.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R impala_2each ${OUT_FOLD}/impala_only2each.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R finches_2each ${OUT_FOLD}/finches_only2each.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R muskox_2each ${OUT_FOLD}/muskox_only2each.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R wtrbuck_2each ${OUT_FOLD}/wtrbuck_only2each.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R whales_2each ${OUT_FOLD}/whales_only2each.txt ${OUT_FOLD} &
  
  
  nice Rscript --vanilla ./satc.R leopard_prophet10 ${OUT_FOLD}/leopard_prophet10.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R leopard_prophet25 ${OUT_FOLD}/leopard_prophet25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R leopard_prophet50 ${OUT_FOLD}/leopard_prophet50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R leopard_prophet75 ${OUT_FOLD}/leopard_prophet75.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R leopard_prophom10 ${OUT_FOLD}/leopard_prophom10.txt ${OUT_FOLD} & ##Error in if (mean(beta[abs(beta) > 0.4 & abs(beta) < 0.6])... missing value where TRUE/FALSE needed
    nice Rscript --vanilla ./satc.R leopard_prophom25 ${OUT_FOLD}/leopard_prophom25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R leopard_prophom50 ${OUT_FOLD}/leopard_prophom50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R leopard_prophom75 ${OUT_FOLD}/leopard_prophom75.txt ${OUT_FOLD} &
  
  nice Rscript --vanilla ./satc.R impala_prophet10 ${OUT_FOLD}/impala_prophet10.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R impala_prophet25 ${OUT_FOLD}/impala_prophet25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R impala_prophet50 ${OUT_FOLD}/impala_prophet50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R impala_prophet75 ${OUT_FOLD}/impala_prophet75.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R impala_prophom10 ${OUT_FOLD}/impala_prophom10.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R impala_prophom25 ${OUT_FOLD}/impala_prophom25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R impala_prophom50 ${OUT_FOLD}/impala_prophom50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R impala_prophom75 ${OUT_FOLD}/impala_prophom75.txt ${OUT_FOLD} &
  
  nice Rscript --vanilla ./satc.R finches_prophet10 ${OUT_FOLD}/finches_prophet10.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R finches_prophet25 ${OUT_FOLD}/finches_prophet25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R finches_prophet50 ${OUT_FOLD}/finches_prophet50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R finches_prophet75 ${OUT_FOLD}/finches_prophet75.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R finches_prophom10 ${OUT_FOLD}/finches_prophom10.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R finches_prophom25 ${OUT_FOLD}/finches_prophom25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R finches_prophom50 ${OUT_FOLD}/finches_prophom50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R finches_prophom75 ${OUT_FOLD}/finches_prophom75.txt ${OUT_FOLD} &
  
  
  nice Rscript --vanilla ./satc.R muskox_prophet10 ${OUT_FOLD}/muskox_prophet10.txt ${OUT_FOLD} & 
  nice Rscript --vanilla ./satc.R muskox_prophet25 ${OUT_FOLD}/muskox_prophet25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R muskox_prophet50 ${OUT_FOLD}/muskox_prophet50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R muskox_prophet75 ${OUT_FOLD}/muskox_prophet75.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R muskox_prophom10 ${OUT_FOLD}/muskox_prophom10.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R muskox_prophom25 ${OUT_FOLD}/muskox_prophom25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R muskox_prophom50 ${OUT_FOLD}/muskox_prophom50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R muskox_prophom75 ${OUT_FOLD}/muskox_prophom75.txt ${OUT_FOLD} &
  
  nice Rscript --vanilla ./satc.R wtrbuck_prophet10 ${OUT_FOLD}/wtrbuck_prophet10.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R wtrbuck_prophet25 ${OUT_FOLD}/wtrbuck_prophet25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R wtrbuck_prophet50 ${OUT_FOLD}/wtrbuck_prophet50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R wtrbuck_prophet75 ${OUT_FOLD}/wtrbuck_prophet75.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R wtrbuck_prophom10 ${OUT_FOLD}/wtrbuck_prophom10.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R wtrbuck_prophom25 ${OUT_FOLD}/wtrbuck_prophom25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R wtrbuck_prophom50 ${OUT_FOLD}/wtrbuck_prophom50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R wtrbuck_prophom75 ${OUT_FOLD}/wtrbuck_prophom75.txt ${OUT_FOLD} &
  
  nice Rscript --vanilla ./satc.R whales_prophet10 ${OUT_FOLD}/whales_prophet10.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R whales_prophet25 ${OUT_FOLD}/whales_prophet25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R whales_prophet50 ${OUT_FOLD}/whales_prophet50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R whales_prophet75 ${OUT_FOLD}/whales_prophet75.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R whales_prophom10 ${OUT_FOLD}/whales_prophom10.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R whales_prophom25 ${OUT_FOLD}/whales_prophom25.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R whales_prophom50 ${OUT_FOLD}/whales_prophom50.txt ${OUT_FOLD} &
  nice Rscript --vanilla ./satc.R whales_prophom75 ${OUT_FOLD}/whales_prophom75.txt ${OUT_FOLD} &
  
  
##Leopard  
  
leopardrds_hybrid<-list()
leopardrds_hybrid[["def"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/leopard.sexSamples_sexScaffolds.rds")
leopardrds_hybrid[["only2"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/leopard_2each.sexSamples_sexScaffolds.rds")
leopardrds_hybrid[["het10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/leopard_prophet10.sexSamples_sexScaffolds.rds")
leopardrds_hybrid[["het25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/leopard_prophet25.sexSamples_sexScaffolds.rds")
leopardrds_hybrid[["het50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/leopard_prophet50.sexSamples_sexScaffolds.rds")
leopardrds_hybrid[["het75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/leopard_prophet75.sexSamples_sexScaffolds.rds")
leopardrds_hybrid[["hom10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/leopard_prophom10.sexSamples_sexScaffolds.rds")
leopardrds_hybrid[["hom25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/leopard_prophom25.sexSamples_sexScaffolds.rds")
leopardrds_hybrid[["hom50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/leopard_prophom50.sexSamples_sexScaffolds.rds")
leopardrds_hybrid[["hom75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/leopard_prophom75.sexSamples_sexScaffolds.rds")


##IMPALA

impalards_hybrid<-list()
impalards_hybrid[["def"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/impala.sexSamples_sexScaffolds.rds")
impalards_hybrid[["only2"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/impala_2each.sexSamples_sexScaffolds.rds")
impalards_hybrid[["het10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/impala_prophet10.sexSamples_sexScaffolds.rds")
impalards_hybrid[["het25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/impala_prophet25.sexSamples_sexScaffolds.rds")
impalards_hybrid[["het50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/impala_prophet50.sexSamples_sexScaffolds.rds")
impalards_hybrid[["het75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/impala_prophet75.sexSamples_sexScaffolds.rds")
impalards_hybrid[["hom10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/impala_prophom10.sexSamples_sexScaffolds.rds")
impalards_hybrid[["hom25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/impala_prophom25.sexSamples_sexScaffolds.rds")
impalards_hybrid[["hom50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/impala_prophom50.sexSamples_sexScaffolds.rds")
impalards_hybrid[["hom75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/impala_prophom75.sexSamples_sexScaffolds.rds")


##FINCHES

finchesrds_hybrid<-list()
finchesrds_hybrid[["def"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/finches.sexSamples_sexScaffolds.rds")
finchesrds_hybrid[["only2"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/finches_2each.sexSamples_sexScaffolds.rds")
finchesrds_hybrid[["het10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/finches_prophet10.sexSamples_sexScaffolds.rds")
finchesrds_hybrid[["het25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/finches_prophet25.sexSamples_sexScaffolds.rds")
finchesrds_hybrid[["het50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/finches_prophet50.sexSamples_sexScaffolds.rds")
finchesrds_hybrid[["het75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/finches_prophet75.sexSamples_sexScaffolds.rds")
finchesrds_hybrid[["hom10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/finches_prophom10.sexSamples_sexScaffolds.rds")
finchesrds_hybrid[["hom25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/finches_prophom25.sexSamples_sexScaffolds.rds")
finchesrds_hybrid[["hom50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/finches_prophom50.sexSamples_sexScaffolds.rds")
finchesrds_hybrid[["hom75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/finches_prophom75.sexSamples_sexScaffolds.rds")


###MUSKOX
muskoxrds_hybrid<-list()
muskoxrds_hybrid[["def"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/muskox.sexSamples_sexScaffolds.rds")
muskoxrds_hybrid[["only2"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/muskox_2each.sexSamples_sexScaffolds.rds")
muskoxrds_hybrid[["het10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/muskox_prophet10.sexSamples_sexScaffolds.rds")
muskoxrds_hybrid[["het25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/muskox_prophet25.sexSamples_sexScaffolds.rds")
muskoxrds_hybrid[["het50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/muskox_prophet50.sexSamples_sexScaffolds.rds")
muskoxrds_hybrid[["het75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/muskox_prophet75.sexSamples_sexScaffolds.rds")
muskoxrds_hybrid[["hom10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/muskox_prophom10.sexSamples_sexScaffolds.rds")
muskoxrds_hybrid[["hom25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/muskox_prophom25.sexSamples_sexScaffolds.rds")
muskoxrds_hybrid[["hom50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/muskox_prophom50.sexSamples_sexScaffolds.rds")
muskoxrds_hybrid[["hom75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/muskox_prophom75.sexSamples_sexScaffolds.rds")



##WTRBUCK

wtrbuckrds_hybrid<-list()
wtrbuckrds_hybrid[["def"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck.sexSamples_sexScaffolds.rds")
wtrbuckrds_hybrid[["only2"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_2each.sexSamples_sexScaffolds.rds")
wtrbuckrds_hybrid[["het10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_prophet10.sexSamples_sexScaffolds.rds")
wtrbuckrds_hybrid[["het25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_prophet25.sexSamples_sexScaffolds.rds")
wtrbuckrds_hybrid[["het50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_prophet50.sexSamples_sexScaffolds.rds")
wtrbuckrds_hybrid[["het75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_prophet75.sexSamples_sexScaffolds.rds")
wtrbuckrds_hybrid[["hom10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_prophom10.sexSamples_sexScaffolds.rds")
wtrbuckrds_hybrid[["hom25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_prophom25.sexSamples_sexScaffolds.rds")
wtrbuckrds_hybrid[["hom50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_prophom50.sexSamples_sexScaffolds.rds")
wtrbuckrds_hybrid[["hom75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_prophom75.sexSamples_sexScaffolds.rds")


##WHALES

whalesrds_hybrid<-list()
whalesrds_hybrid[["def"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/whales.sexSamples_sexScaffolds.rds")
whalesrds_hybrid[["only2"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/whales_2each.sexSamples_sexScaffolds.rds")
whalesrds_hybrid[["het10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/whales_prophet10.sexSamples_sexScaffolds.rds")
whalesrds_hybrid[["het25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/whales_prophet25.sexSamples_sexScaffolds.rds")
whalesrds_hybrid[["het50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/whales_prophet50.sexSamples_sexScaffolds.rds")
whalesrds_hybrid[["het75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/whales_prophet75.sexSamples_sexScaffolds.rds")
whalesrds_hybrid[["hom10"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/whales_prophom10.sexSamples_sexScaffolds.rds")
whalesrds_hybrid[["hom25"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/whales_prophom25.sexSamples_sexScaffolds.rds")
whalesrds_hybrid[["hom50"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/whales_prophom50.sexSamples_sexScaffolds.rds")
whalesrds_hybrid[["hom75"]]<-readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/whales_prophom75.sexSamples_sexScaffolds.rds")



####DIFF DEPTH

##LEOPARD

leopard_depth_hybrid=list()
leopard_depth_hybrid[["depth1"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/leopard_1.sexSamples_sexScaffolds.rds")
leopard_depth_hybrid[["depth05"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/leopard_05.sexSamples_sexScaffolds.rds")
leopard_depth_hybrid[["depth01"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/leopard_01.sexSamples_sexScaffolds.rds")
leopard_depth_hybrid[["depth001"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/leopard_001.sexSamples_sexScaffolds.rds")


##IMPALA
impala_depth_hybrid=list()
impala_depth_hybrid[["depth1"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/impala_1.sexSamples_sexScaffolds.rds")
impala_depth_hybrid[["depth05"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/impala_05.sexSamples_sexScaffolds.rds")
impala_depth_hybrid[["depth01"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/impala_01.sexSamples_sexScaffolds.rds")
impala_depth_hybrid[["depth001"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/impala_001.sexSamples_sexScaffolds.rds")

##FINCHES
finches_depth_hybrid=list()
finches_depth_hybrid[["depth1"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/finches_1.sexSamples_sexScaffolds.rds")
finches_depth_hybrid[["depth05"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/finches_05.sexSamples_sexScaffolds.rds")
finches_depth_hybrid[["depth01"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/finches_01.sexSamples_sexScaffolds.rds")
finches_depth_hybrid[["depth001"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/finches_001.sexSamples_sexScaffolds.rds")



##MUSKOX
muskox_depth_hybrid=list()
muskox_depth_hybrid[["depth1"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/muskox_1.sexSamples_sexScaffolds.rds")
muskox_depth_hybrid[["depth05"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/muskox_05.sexSamples_sexScaffolds.rds")
muskox_depth_hybrid[["depth01"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/muskox_01.sexSamples_sexScaffolds.rds")
muskox_depth_hybrid[["depth001"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/muskox_001.sexSamples_sexScaffolds.rds")


##WTRBUCK
wtrbuck_depth_hybrid=list()
wtrbuck_depth_hybrid[["depth1"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/wtrbuck_1.sexSamples_sexScaffolds.rds")
wtrbuck_depth_hybrid[["depth05"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/wtrbuck_05.sexSamples_sexScaffolds.rds")
wtrbuck_depth_hybrid[["depth01"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/wtrbuck_01.sexSamples_sexScaffolds.rds")
wtrbuck_depth_hybrid[["depth001"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/wtrbuck_001.sexSamples_sexScaffolds.rds")



##whales
whales_depth_hybrid=list()
whales_depth_hybrid[["depth1"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/whales_1.sexSamples_sexScaffolds.rds")
whales_depth_hybrid[["depth05"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/whales_05.sexSamples_sexScaffolds.rds")
whales_depth_hybrid[["depth01"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/whales_01.sexSamples_sexScaffolds.rds")
whales_depth_hybrid[["depth001"]]=readRDS(file="/home/casia16/SATCnew/review/pcaEVVmod/depthSim/whales_001.sexSamples_sexScaffolds.rds")



### GET MISMATCH NUMBER


alldepth_hybrid=list(leopard_depth_hybrid,impala_depth_hybrid,finches_depth_hybrid,muskox_depth_hybrid,wtrbuck_depth_hybrid,whales_depth_hybrid)
allnumsamples=list(leopardrds_hybrid,impalards_hybrid,finchesrds_hybrid,muskoxrds_hybrid,wtrbuckrds_hybrid,whalesrds_hybrid)

test_mismatch<-function(x,ref){
  flag=names(ref$dat) %in% names(x$dat);tab_ref=data.frame(id=names(ref$dat)[flag],sex=ref$sex[flag])
  tab_sampling=data.frame(id=names(x$dat),sex=x$sex);tab_sampling_merge=merge(tab_sampling,tab_ref,by="id",all.x = T)
  tab_sampling=tab_sampling_merge;colnames(tab_sampling)=c("id","sex","ref_sex")
  tab=table(tab_sampling$sex,tab_sampling$ref_sex)
  return(tab)
}

mismatch_hettohom<-matrix(NA,nrow=6,ncol=9);rownames(mismatch_hettohom)=c("leopard","impala","finches","muskox","wtrbuck","whales");
colnames(mismatch_hettohom)=c("only2","het_reduced_10%","het_reduced_25%","het_reduced_50%","het_reduced_75%",
                              "hom_reduced_10%","hom_reduced_25%","hom_reduced_50%","hom_reduced_75%")
mismatch_homtohet<-matrix(NA,nrow=6,ncol=9);rownames(mismatch_homtohet)=c("leopard","impala","finches","muskox","wtrbuck","whales");
colnames(mismatch_homtohet)=c("only2","het_reduced_10%","het_reduced_25%","het_reduced_50%","het_reduced_75%",
                              "hom_reduced_10%","hom_reduced_25%","hom_reduced_50%","hom_reduced_75%")
for (i in 1:6){
  for (j in 1:9){
    mismatch_hettohom[i,j]=test_mismatch(allnumsamples[[i]][[j+1]],allnumsamples[[i]][[1]])["heteromorphic","homomorphic"]
    mismatch_homtohet[i,j]=test_mismatch(allnumsamples[[i]][[j+1]],allnumsamples[[i]][[1]])["homomorphic","heteromorphic"]
    # print(test_mismatch(allnumsamples[[i]][[j+1]],allnumsamples[[i]][[1]]))
  }}

mismatch_hettohom_depth<-matrix(NA,nrow=6,ncol=4);rownames(mismatch_hettohom_depth)=c("leopard","impala","finches","muskox","wtrbuck","whales");
colnames(mismatch_hettohom_depth)=c("depth_1X","depth_0.5X","depth_0.1X","depth_0.01X")
mismatch_homtohet_depth<-matrix(NA,nrow=6,ncol=4);rownames(mismatch_homtohet_depth)=c("leopard","impala","finches","muskox","wtrbuck","whales");
colnames(mismatch_homtohet_depth)=c("depth 1X","depth 0.5X","depth 0.1X","depth 0.01X")
for (i in 1:6){
  for (j in 1:4){
    mismatch_hettohom_depth[i,j]=test_mismatch(alldepth_hybrid[[i]][[j]],allnumsamples[[i]][[1]])["heteromorphic","homomorphic"]
    mismatch_homtohet_depth[i,j]=test_mismatch(alldepth_hybrid[[i]][[j]],allnumsamples[[i]][[1]])["homomorphic","heteromorphic"]
    #print(test_mismatch(alldepth_hybrid[[i]][[j]],allnumsamples[[i]][[1]]))
  }}

mismatch_depth=mismatch_hettohom_depth+mismatch_homtohet_depth

mismatch_sample=mismatch_hettohom+mismatch_homtohet





##
problem<-c("/home/casia16/SATCnew/review/pcaEVVmod/impala_prophom10.sexSamples_sexScaffolds.rds",
           "/home/casia16/SATCnew/review/pcaEVVmod/impala_prophom25.sexSamples_sexScaffolds.rds",
           "/home/casia16/SATCnew/review/pcaEVVmod/finches_prophet10.sexSamples_sexScaffolds.rds",
           "/home/casia16/SATCnew/review/pcaEVVmod/muskox_prophet10.sexSamples_sexScaffolds.rds",
           "/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_2each.sexSamples_sexScaffolds.rds",
           "/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_prophom10.sexSamples_sexScaffolds.rds",
           "/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck_prophom25.sexSamples_sexScaffolds.rds"
)




titles_problems=c("Impala: XX:3, XY:81",
                  "Impala: XX:8, XY:81",
                  "Darwin's Finch: ZZ=126, ZW=5",
                  "Muskox: XX:56, XY:5",
                  "Waterbuck: XX:2, XY:2",
                  "Waterbuck: XX:2, XY:20",
                  "Waterbuck: XX:5, XY:20"
)

problem_default<-c("/home/casia16/SATCnew/review/pcaEVVmod/impala.sexSamples_sexScaffolds.rds",
           "/home/casia16/SATCnew/review/pcaEVVmod/finches.sexSamples_sexScaffolds.rds",
           "/home/casia16/SATCnew/review/pcaEVVmod/muskox.sexSamples_sexScaffolds.rds",
           "/home/casia16/SATCnew/review/pcaEVVmod/wtrbuck.sexSamples_sexScaffolds.rds"
)

titles_problems_default=c("Impala: XX:32, XY:81",
                  "Darwin's Finch: ZZ=126, ZW=54",
                  "Muskox: XX:56, XY:47",
                  "Waterbuck: XX:20, XY:20"
)


png(paste("/home/casia16/SATCnew/review/plot_failedsimulation/problem_pcaHYBRID_1.png",sep=""),width=750, height=900)
layout(matrix(c(1:8),4,by=T),w=c(1.2,2.8))
for (i in 1:4){
  print(i)
  test<-readRDS(file=problem[i])
  d <- test$pca$x[,1:2]
  mod <- Mclust(d,G=2,modelName="EVV")
  if(is.null(mod))
    mod <- Mclust(d,G=2)
  par(mar=c(4,4,4,0))
  plot(mod,what = "unc")
  title(basename(titles_problems[i]),cex.main=2,xpd=T,adj=0)
  title(ylab="PC2", line=2.2, cex.lab=1.3, xlab="PC1")
  par(mar=c(5,5,5,0))
  if (i==6 ||i==1){
    plotIndv_ind_label_top(test)
  } else {
    plotIndv_ind_label(test)}
}
dev.off()
png(paste("/home/casia16/SATCnew/review/plot_failedsimulation/problem_pcaHYBRID_2.png",sep=""),width=750, height=900)
layout(matrix(c(1:8),4,by=T),w=c(1.2,2.8))
for (i in c(6,7,5)){
  print(i)
  test<-readRDS(file=problem[i])
  d <- test$pca$x[,1:2]
  mod <- Mclust(d,G=2,modelName="EVV")
  if(is.null(mod))
    mod <- Mclust(d,G=2)
  par(mar=c(4,4,4,0))
  plot(mod,what = "unc")
  title(basename(titles_problems[i]),cex.main=2,xpd=T,adj=0)
  title(ylab="PC2", line=2.2, cex.lab=1.3, xlab="PC1")
  par(mar=c(5,5,5,0))
  if (i==6 ||i==1){
    plotIndv_ind_label_top(test)
  } else {
    plotIndv_ind_label(test)}
}
dev.off()


png(paste("/home/casia16/SATCnew/review/plot_failedsimulation/problem_pcaHYBRID_default.png",sep=""),width=750, height=900)
layout(matrix(c(1:8),4,by=T),w=c(1.2,2.8))
for (i in 1:4){
  print(i)
  test<-readRDS(file=problem_default[i])
  d <- test$pca$x[,1:2]
  mod <- Mclust(d,G=2,modelName="EVV")
  if(is.null(mod))
    mod <- Mclust(d,G=2)
  par(mar=c(4,4,4,0))
  plot(mod,what = "unc")
  title(basename(titles_problems_default[i]),cex.main=1.63,xpd=T,adj=0)
  title(ylab="PC2", line=2.2, cex.lab=1.3, xlab="PC1")
  par(mar=c(5,5,5,0))
  if (i==6 ||i==1){
    plotIndv_ind_label_top(test)
  } else {
    plotIndv_ind_label(test)}
}
dev.off()

##all




plotIndv_ind_label_top <- function(x,ylim=c(0,2),abnormal=TRUE,main=""){
  #par(mar=c(10.1,4.1,3.1,2.1))
  #par(mar=c(10.1,4.1,3.1,2.1))
  mat <- sapply(x$dat,function(y) y$norm)
  scafNames <-x$dat[[1]][,1]
  indNames<- names(x$dat)
  rownames(mat) <- scafNames
  colnames(mat)<- indNames
  sexLinkedScaf <- scafNames[x$SexScaffolds$Abnormal_sex_linked_Scaffolds| x$SexScaffolds$X_Z_Scaffolds]
  XZScaf <- scafNames[x$SexScaffolds$X_Z_Scaffolds]
  keep <-XZScaf
  if(abnormal)
    keep <-sexLinkedScaf
  newOrder <- order(x$sex,decreasing=TRUE)
  matOrder<- mat[keep,newOrder]
  namOrder <- gsub(".idxstat|.idxstats","",colnames(matOrder))
  s <- factor(rep(namOrder,each=nrow(matOrder)),levels=namOrder)
  n<-length(namOrder)
  b<-boxplot(as.vector(matOrder)~s,
             col=col12[as.factor(x$sex)[newOrder]]
             ,ylab="Normalized
Depth",
             axes=F,xlab="",ylim=ylim)
  axis(2,cex.axis=1.05,ylim=ylim)
  #text(1:n,y=rep(-0.1,n),namOrder,xpd=T,srt=90,cex=0.7)
  title(main,adj=0.2,cex.main=1.5)
  gen <- c("Heterogametic ","Homogametic ")
  # legend("topright",gen,pch=16,cex=1,col=col12,bty="n",horiz=T,xpd=T)
  legend(0.6*n,2.7,gen,pch=16,cex=1.4,col=col12,bty="n",horiz=T,xpd=T)
  abline(h=0.5,lty=2,lwd=1.5,xlim=c(0,n),col=col12[1])
  abline(h=1,lty=2,lwd=1.5,xlim=c(0,n),col=col12[2])
  abline(v=sum(x$sex=="homomorphic")+0.5,lty=1,lwd=1.5,ylim=c(0,2))
}



plotIndv_ind_label <- function(x,ylim=c(0,2),abnormal=TRUE,main=""){
  #par(mar=c(10.1,4.1,3.1,2.1))
  mat <- sapply(x$dat,function(y) y$norm)
  scafNames <-x$dat[[1]][,1]
  indNames<- names(x$dat)
  rownames(mat) <- scafNames
  colnames(mat)<- indNames
  sexLinkedScaf <- scafNames[x$SexScaffolds$Abnormal_sex_linked_Scaffolds | x$SexScaffolds$X_Z_Scaffolds]
  XZScaf <- scafNames[x$SexScaffolds$X_Z_Scaffolds]
  keep <-XZScaf
  if(abnormal)
    keep <-sexLinkedScaf
  newOrder <- order(x$sex,decreasing=TRUE)
  matOrder<- mat[keep,newOrder]
  namOrder <- gsub(".idxstat|.idxstats","",colnames(matOrder))
  s <- factor(rep(namOrder,each=nrow(matOrder)),levels=namOrder)
  n<-length(namOrder)
  b<-boxplot(as.vector(matOrder)~s,
             col=col12[as.factor(x$sex)[newOrder]]
             ,ylab="Normalized
Depth",
             axes=F,xlab="",ylim=ylim)
  axis(2,cex.axis=1.05,ylim=ylim)
  #text(1:n,y=rep(-0.1,n),namOrder,xpd=T,srt=90,cex=0.7)
  title(main,adj=0.2,cex.main=1.5)
  gen <- c("Heterogametic ","Homogametic ")
  # legend("topright",gen,pch=16,cex=1,col=col12,bty="n",horiz=T,xpd=T)
  # legend(0.8*n,2.5,gen,pch=16,cex=1,col=col12,bty="n",horiz=T,xpd=T)
  abline(h=0.5,lty=2,lwd=1.5,xlim=c(0,n),col=col12[1])
  abline(h=1,lty=2,lwd=1.5,xlim=c(0,n),col=col12[2])
  abline(v=sum(x$sex=="homomorphic")+0.5,lty=1,lwd=1.5,ylim=c(0,2))
  # legend("topright",gen,pch=16,cex=1,col=col12,bty="n",horiz=T,xpd=T)
  #legend(0.65*n,2.5,gen,pch=16,cex=1.2,col=col12,bty="n",horiz=T,xpd=T)
}






##leopard

png("/home/casia16/SATCnew/review/plots/SATChybrid/leopard_diffsamplesBETTER.png",width=700, height=850)

layout(matrix(c(0,0,0,1:9,10,10,10),5,by=T),w=c(1.2,1.2,1.2),h=c(0.2,1,1,1,0.2))
par(mar=c(2,4,0,0))
sex_system=c("XY","XX")
par(mar=c(4,4,10,3))
for(i in 2:10){
  plotGroupMod(leopardrds_hybrid[[i]],leopardrds_hybrid[[1]],sex_system)}
par(mar=c(2,4,0,0))
plot.new()
#legend(x="center", ncol=3,legend=c("0-1 km","1-5 km","outside barrier"),
#      fill=c("green","orange","red"), title="Fetch")

legend(x="center", c("inferred heterogametic(XY)", "inferred homogametic(XX)", "true heterogametic(XY)", "true homogametic(XX)"), 
       xpd = TRUE, horiz = TRUE,
       bty = "n", pch = c(22, 22, 22,21),pt.bg= c("#FFB7FC","#FF106A","black","black"),
       col=c("black","black","black","black"), cex = 1.5,pt.cex=2.5,x.intersp=1.3)
mtext("Leopard",side=3,cex=1.6,outer=T,line=-5,adj=0.05)
mtext("A",side=3,cex=1.7,outer=T,line=-2,adj=0)
dev.off()

##MUSKOX

png("/home/casia16/SATCnew/review/plots/SATChybrid/muskox_diffsamplesBETTER.png",width=700, height=850)

layout(matrix(c(0,0,0,1:9,10,10,10),5,by=T),w=c(1.2,1.2,1.2),h=c(0.2,1,1,1,0.2))
par(mar=c(2,4,0,0))
sex_system=c("XY","XX")
par(mar=c(4,4,10,3))
for(i in 2:10){
  plotGroupMod(muskoxrds_hybrid[[i]],muskoxrds_hybrid[[1]],sex_system)}
par(mar=c(2,4,0,0))
plot.new()
#legend(x="center", ncol=3,legend=c("0-1 km","1-5 km","outside barrier"),
#      fill=c("green","orange","red"), title="Fetch")

legend(x="center", c("inferred heterogametic(XY)", "inferred homogametic(XX)", "true heterogametic(XY)", "true homogametic(XX)"), 
       xpd = TRUE, horiz = TRUE,
       bty = "n", pch = c(22, 22, 22,21),pt.bg= c("#FFB7FC","#FF106A","black","black"),
       col=c("black","black","black","black"), cex = 1.5,pt.cex=2.5,x.intersp=1.3)
mtext("Muskox",side=3,cex=1.6,outer=T,line=-5,adj=0.05)
mtext("B",side=3,cex=1.7,outer=T,line=-2,adj=0)
dev.off()


##IMPALA

png("/home/casia16/SATCnew/review/plots/SATChybrid/impala_diffsamplesBETTER.png",width=700, height=850)
layout(matrix(c(0,0,0,1:9,10,10,10),5,by=T),w=c(1.2,1.2,1.2),h=c(0.2,1,1,1,0.2))
par(mar=c(2,4,0,0))
sex_system=c("XY","XX")
par(mar=c(4,4,10,3))
for(i in 2:10){
  plotGroupMod(impalards_hybrid[[i]],impalards_hybrid[[1]],sex_system)}
par(mar=c(2,4,0,0))
plot.new()
#legend(x="center", ncol=3,legend=c("0-1 km","1-5 km","outside barrier"),
#      fill=c("green","orange","red"), title="Fetch")

legend(x="center", c("inferred heterogametic(XY)", "inferred homogametic(XX)", "true heterogametic(XY)", "true homogametic(XX)"), 
       xpd = TRUE, horiz = TRUE,
       bty = "n", pch = c(22, 22, 22,21),pt.bg= c("#FFB7FC","#FF106A","black","black"),
       col=c("black","black","black","black"), cex = 1.5,pt.cex=2.5,x.intersp=1.3)
mtext("Impala",side=3,cex=1.6,outer=T,line=-5,adj=0.05)
mtext("D",side=3,cex=1.7,outer=T,line=-2,adj=0)
dev.off()


## FINCHES
png("/home/casia16/SATCnew/review/plots/SATChybrid/finches_diffsamplesBETTER.png",width=700, height=850)
layout(matrix(c(0,0,0,1:9,10,10,10),5,by=T),w=c(1.2,1.2,1.2),h=c(0.2,1,1,1,0.2))
par(mar=c(2,4,0,0))
sex_system=c("ZW","ZZ")
par(mar=c(4,4,10,3))
for(i in 2:10){
  plotGroupMod(finchesrds_hybrid[[i]],finchesrds_hybrid[[1]],sex_system)
}
par(mar=c(2,4,0,0))
plot.new()
#legend(x="center", ncol=3,legend=c("0-1 km","1-5 km","outside barrier"),
#      fill=c("green","orange","red"), title="Fetch")

legend(x="center", c("inferred heterogametic(ZW)", "inferred homogametic(ZW)", "true heterogametic(ZW)", "true homogametic(ZZ)"), 
       xpd = TRUE, horiz = TRUE,
       bty = "n", pch = c(22, 22, 22,21),pt.bg= c("#FFB7FC","#FF106A","black","black"),
       col=c("black","black","black","black"), cex = 1.5,pt.cex=2.5,x.intersp=1.3)
mtext("Darwin's Finches",side=3,cex=1.6,outer=T,line=-5,adj=0.05)
mtext("F",side=3,cex=1.7,outer=T,line=-2,adj=0)
dev.off()


##WTRBUCK

png("/home/casia16/SATCnew/review/plots/SATChybrid/wtrbuck_diffsamplesBETTER.png",width=700, height=850)

layout(matrix(c(0,0,0,1:9,10,10,10),5,by=T),w=c(1.2,1.2,1.2),h=c(0.2,1,1,1,0.2))
par(mar=c(2,4,0,0))
sex_system=c("XY","XX")
par(mar=c(4,4,10,3))
for(i in 2:10){
  plotGroupMod(wtrbuckrds_hybrid[[i]],wtrbuckrds_hybrid[[1]],sex_system)}
par(mar=c(2,4,0,0))
plot.new()
#legend(x="center", ncol=3,legend=c("0-1 km","1-5 km","outside barrier"),
#      fill=c("green","orange","red"), title="Fetch")

legend(x="center", c("inferred heterogametic(XY)", "inferred homogametic(XX)", "true heterogametic(XY)", "true homogametic(XX)"), 
       xpd = TRUE, horiz = TRUE,
       bty = "n", pch = c(22, 22, 22,21),pt.bg= c("#FFB7FC","#FF106A","black","black"),
       col=c("black","black","black","black"), cex = 1.5,pt.cex=2.5,x.intersp=1.3)
mtext("Waterbuck",side=3,cex=1.6,outer=T,line=-5,adj=0.05)
mtext("E",side=3,cex=1.7,outer=T,line=-2,adj=0)
dev.off()


##WHALES

png("/home/casia16/SATCnew/review/plots/SATChybrid/whales_diffsamplesBETTER.png",width=700, height=850)
layout(matrix(c(0,0,0,1:9,10,10,10),5,by=T),w=c(1.2,1.2,1.2),h=c(0.2,1,1,1,0.2))
par(mar=c(2,4,0,0))
sex_system=c("XY","XX")
par(mar=c(4,4,10,3))
for(i in 2:10){
  plotGroupMod(whalesrds_hybrid[[i]],whalesrds_hybrid[[1]],sex_system)}
par(mar=c(2,4,0,0))
plot.new()
#legend(x="center", ncol=3,legend=c("0-1 km","1-5 km","outside barrier"),
#      fill=c("green","orange","red"), title="Fetch")

legend(x="center", c("inferred heterogametic(XY)", "inferred homogametic(XX)", "true heterogametic(XY)", "true homogametic(XX)"), 
       xpd = TRUE, horiz = TRUE,
       bty = "n", pch = c(22, 22, 22,21),pt.bg= c("#FFB7FC","#FF106A","black","black"),
       col=c("black","black","black","black"), cex = 1.5,pt.cex=2.5,x.intersp=1.3)
#mtext("Whales 1",side=3,cex=1.7,outer=T,line=-2,adj=0)
mtext("Gray Whales",side=3,cex=1.6,outer=T,line=-5,adj=0.05)
mtext("C",side=3,cex=1.7,outer=T,line=-2,adj=0)
dev.off()







leopard="/home/casia16/leopard/krishang_remap_idxstat/"
impala="/home/casia16/projects/impala/results/sexScaffolds/idxstatNoTarseq"
finches="/home/anna/sex_scaffolds/Darwins_finches/"
muskox="/home/casia16/projects/sex_scaffolds/muscox/idxstats/"
wtrbuck="/home/casia16/projects/sex_scaffolds/waterbuck/idxstatNOPREFIXfilteredsamples/"
whales="/home/casia16/sex_scaffolds_analysis/whales/idxstatsNoScafPrefix"


alldepth<-list()
alldepth["leopard"]= leopard_depth_hybrid
alldepth["muskox"]= muskox_depth_hybrid
alldepth["whales"]= whales_depth_hybrid
alldepth["impala"]= impala_depth_hybrid
alldepth["wtrbuck"]= wtrbuck_depth_hybrid
alldepth["finches"]= finches_depth_hybrid

alldepth=list(leopard_depth_hybrid,muskox_depth_hybrid,
              whales_depth_hybrid,impala_depth_hybrid,
              wtrbuck_depth_hybrid,finches_depth_hybrid)

allnumsamples=list(leopardrds_hybrid,muskoxrds_hybrid,whalesrds_hybrid,impalards_hybrid,wtrbuckrds_hybrid,finchesrds_hybrid)
ylim<-c(0.3,1.8)
list_titles<-c("depth 1X","depth 0.5X","depth 0.1X","depth 0.01X")
list_titles_species<-list(list("Leopard","","",""),list("Muskox","","",""),
                          list("Gray Whale","","",""),list("Impala","","",""),
                          list("Waterbuck","","",""),list("Darwin's Finches","","","")
                          )


png("/home/casia16/SATCnew/review/plots/SATChybrid/allspecies_diffdepthBETTER_part1.png",width=700, height=850)

layout(matrix(c(1:16,17,17,17,17),5,by=T),h=c(2.4,2.4,2.4,0.5,0.5))
par(mar=c(4,4,10,3))
for (i in 1:3){
  ref=allnumsamples[[i]][[1]]
  for(j in 1:4){
    plotGroupModDepth(alldepth[[i]][[j]],ref,main=list_titles_species[[i]][j])
  }
}
plot.new()
par(mar=c(0,0,0,0))
plot.new()
par(mar=c(0,0,0,0))
title(list_titles[1],cex.main=1.5,,adj=0.6,line = -1.2)
plot.new()
par(mar=c(0,0,0,0))
title(list_titles[2],cex.main=1.5,,adj=0.6,line = -1.2)
plot.new()
par(mar=c(0,0,0,0))
title(list_titles[3],cex.main=1.5,,adj=0.6,line = -1.2)
plot.new()
par(mar=c(0,0,0,0))
title(list_titles[4],cex.main=1.5,,adj=0.6,line = -1.2)

par(mar=c(2,4,0,0))
plot.new()
#legend(x="center", ncol=3,legend=c("0-1 km","1-5 km","outside barrier"),
#      fill=c("green","orange","red"), title="Fetch")

legend(x="center", c("inferred heterogametic(XY)", "inferred homogametic(XX)", "true heterogametic(XY)", "true homogametic(XX)"), 
       xpd = TRUE, horiz = TRUE,
       bty = "n", pch = c(22, 22, 22,21),pt.bg= c("#FFB7FC","#FF106A","black","black"),
       col=c("black","black","black","black"), cex = 1.5,pt.cex=2.5,x.intersp=1.3)

dev.off()


png("/home/casia16/SATCnew/review/plots/SATChybrid/allspecies_diffdepthBETTER_part2.png",width=700, height=850)

layout(matrix(c(1:16,17,17,17,17),5,by=T),h=c(2.4,2.4,2.4,0.5,0.5))
par(mar=c(4,4,10,3))
for (i in 4:6){
  ref=allnumsamples[[i]][[1]]
  for(j in 1:4){
    plotGroupModDepth(alldepth[[i]][[j]],ref,main=list_titles_species[[i]][j])
  }
}
plot.new()
par(mar=c(0,0,0,0))
plot.new()
par(mar=c(0,0,0,0))
title(list_titles[1],cex.main=1.5,,adj=0.6,line = -1.2)
plot.new()
par(mar=c(0,0,0,0))
title(list_titles[2],cex.main=1.5,,adj=0.6,line = -1.2)
plot.new()
par(mar=c(0,0,0,0))
title(list_titles[3],cex.main=1.5,,adj=0.6,line = -1.2)
plot.new()
par(mar=c(0,0,0,0))
title(list_titles[4],cex.main=1.5,,adj=0.6,line = -1.2)

par(mar=c(2,4,0,0))
plot.new()
#legend(x="center", ncol=3,legend=c("0-1 km","1-5 km","outside barrier"),
#      fill=c("green","orange","red"), title="Fetch")

legend(x="center", c("inferred heterogametic(XY)", "inferred homogametic(XX)", "true heterogametic(XY)", "true homogametic(XX)"), 
       xpd = TRUE, horiz = TRUE,
       bty = "n", pch = c(22, 22, 22,21),pt.bg= c("#FFB7FC","#FF106A","black","black"),
       col=c("black","black","black","black"), cex = 1.5,pt.cex=2.5,x.intersp=1.3)

dev.off()



###analysis depth

#alldepth=list(leopard_depth_hybrid,muskox_depth_hybrid,
#              whales_depth_hybrid,impala_depth_hybrid,
#              wtrbuck_depth_hybrid,finches_depth_hybrid)

#allnumsamples=list(leopardrds_hybrid,muskoxrds_hybrid,whalesrds_hybrid,impalards_hybrid,wtrbuckrds_hybrid,finchesrds_hybrid)


#scaffold
table_num_length=matrix(NA,ncol=10,nrow=6);colnames(table_num_length)<-c("#Scaf_Fulldata","Total_length_Fulldata",
                                                       "#Scaf_1X","Total_length_1X",
                                                       "#Scaf_0.5X","Total_length_0.5X",
                                                       "#Scaf_0.1X","Total_length_0.1X",
                                                       "#Scaf_0.01X","Total_length_0.01X"
                                                      );
rownames(table_num_length)<-c("Leopard","Muskox","Gray Whale","Impala","Waterbuck","Darwin's Finches")

for(i in 1:6){
  for (j in 1:5){
  if (j == 1){
    targetScaf=(allnumsamples[[i]][[1]]$SexScaffolds$X_Z_Scaffolds |  allnumsamples[[i]][[1]]$SexScaffolds$Abnormal_sex_linked_Scaffolds)
    table_num_length[i,(j*2-1)]=sum(targetScaf)
    table_num_length[i,(j*2)]=sum(allnumsamples[[i]][[1]]$SexScaffolds$Length[targetScaf])
  }else {
    targetScaf=(alldepth[[i]][[j-1]]$SexScaffolds$X_Z_Scaffolds |  alldepth[[i]][[j-1]]$SexScaffolds$Abnormal_sex_linked_Scaffolds)
    table_num_length[i,(j*2-1)]=sum(targetScaf)
    table_num_length[i,(j*2)]=sum(alldepth[[i]][[j-1]]$SexScaffolds$Length[targetScaf])
  }
  }}


write.table(table_num_length,"/home/casia16/SATCnew/review/plots/SATChybrid/table_scaf_num_length_diff_depth.txt",quote=F)

###better version
table_num_length=matrix(NA,ncol=14,nrow=6);colnames(table_num_length)<-c("#Scaf_Fulldata","Total_length_Fulldata",
                                                                         "#Scaf_1X","Total_length_1X","#Overlapped_Scafs",
                                                                         "#Scaf_0.5X","Total_length_0.5X","#Overlapped_Scafs",
                                                                         "#Scaf_0.1X","Total_length_0.1X","#Overlapped_Scafs",
                                                                         "#Scaf_0.01X","Total_length_0.01X","#Overlapped_Scafs"
);
rownames(table_num_length)<-c("Leopard","Muskox","Gray Whale","Impala","Waterbuck","Darwin's Finches")

for(i in 1:6){
  for (j in 1:5){
    if (j == 1){
      targetScafRef=(allnumsamples[[i]][[1]]$SexScaffolds$X_Z_Scaffolds |  allnumsamples[[i]][[1]]$SexScaffolds$Abnormal_sex_linked_Scaffolds)
      table_num_length[i,(j*2-1)]=sum(targetScafRef)
      table_num_length[i,(j*2)]=sum(allnumsamples[[i]][[1]]$SexScaffolds$Length[targetScafRef])
    }else {
      targetScaf=(alldepth[[i]][[j-1]]$SexScaffolds$X_Z_Scaffolds |  alldepth[[i]][[j-1]]$SexScaffolds$Abnormal_sex_linked_Scaffolds)
      table_num_length[i,(j*3-3)]=sum(targetScaf)
      table_num_length[i,(j*3-2)]=sum(alldepth[[i]][[j-1]]$SexScaffolds$Length[targetScaf])
      table_num_length[i,(j*3-1)]=length(intersect(allnumsamples[[i]][[1]]$SexScaffolds$Name[targetScafRef],alldepth[[i]][[j-1]]$SexScaffolds$Name[targetScaf]))
    }
  }}


write.table(table_num_length,"/home/casia16/SATCnew/review/plots/SATChybrid/table_scaf_num_length_diff_depth.txt",quote=F)



