leo_sextable="/home/casia16/SATCnew/review/leo_sampleSex.tsv" 
impala_sextable="/home/casia16/SATCnew/review/impala_sampleSex.tsv" 
finches_sextable="/home/casia16/SATCnew/review/finches_sampleSex.tsv" 
muskox_sextable="/home/casia16/SATCnew/review/muskox_sampleSex.tsv" 
wtrbuck_sextable="/home/casia16/SATCnew/review/wtrbuck_sampleSex.tsv" 
whales_sextable="/home/casia16/SATCnew/review/whales_sampleSex.tsv" 
pathfile=c("/../../examples/idxstats/leopard/",
           "/../../examples/idxstats/impala/",
           "/../../examples/idxstats/finches/",
           "/../../examples/idxstats/muskox/",
           "/../../examples/idxstats/wtrbuck/",
           "/../../examples/idxstats/whales/") 
sextab=c(leo_sextable,impala_sextable,finches_sextable,muskox_sextable,wtrbuck_sextable,whales_sextable) 
species=c("leopard","impala","finches","muskox","wtrbuck","whales") 
OUT_FOLD="/home/casia16/SATCnew/review/"
###now run only 2
for (i in 1:6){
  file=sextab[i]
  df=read.table(file,header=T,stringsAsFactors = F)
  library(dplyr)
  sampling= df %>% group_by(inferred_sex) %>% sample_n(2)
  pathSampling=paste(rep(pathfile[i],dim(sampling)[1]),as.vector(data.frame(sampling[,1],stringsAsFactors=F)[,1]),sep="")
  
write.table(pathSampling,paste(OUT_FOLD,species[i],"_only2each.txt",sep=""),r=F,c=F,quote=F)} 
nice Rscript --vanilla ./satc.R leo_2each ${OUT_FOLD}/leopard_only2each.txt ${OUT_FOLD} & 
nice Rscript --vanilla ./satc.R impala_2each ${OUT_FOLD}/impala_only2each.txt ${OUT_FOLD} & 
nice Rscript --vanilla ./satc.R finches_2each ${OUT_FOLD}/finches_only2each.txt ${OUT_FOLD} & 
nice Rscript --vanilla ./satc.R muskox_2each ${OUT_FOLD}/muskox_only2each.txt ${OUT_FOLD} & 
nice Rscript --vanilla ./satc.R wtrbuck_2each ${OUT_FOLD}/wtrbuck_only2each.txt ${OUT_FOLD} & 
nice Rscript --vanilla ./satc.R whales_2each ${OUT_FOLD}/whales_only2each.txt ${OUT_FOLD} &
  
##run 25%, 50%, 75% (equal number)
stat_sampling=list()
  for (i in 1:5){
    file=sextab[i]
    df=read.table(file,header=T,stringsAsFactors = F)
    library(dplyr)
    num_het=table(df[,2])[1]; 
sampling_het=c(round(0.75*num_het),round(0.5*num_het),round(0.25*num_het),round(0.1*num_het))
    num_homo=table(df[,2])[2]; 
sampling_homo=c(round(0.75*num_homo),round(0.5*num_homo),round(0.25*num_homo),round(0.1*num_homo))
    vect_sampling<-list(sampling_het,sampling_homo)
    prop_file=c("prop75","prop50","prop25","prop10")
    stat_sampling[[species[i]]]=vect_sampling
    for (prop in 1:4){
    sampling= stratified(df, "inferred_sex", size = c(heteromorphic 
=as.numeric(vect_sampling[[1]][prop]), homomorphic = as.numeric(vect_sampling[[2]][prop]))) 
#https://stackoverflow.com/questions/23831711/sample-n-random-rows-per-group-in-a-dataframe
    pathSampling=paste(rep(pathfile[i],dim(sampling)[1]),as.vector(data.frame(sampling[,1],stringsAsFactors=F)[,1]),sep="")
    write.table(pathSampling,paste(OUT_FOLD,species[i],"_",prop_file[prop],".txt",sep=""),r=F,c=F,quote=F)
    }
    }
##run 25%, 50%, 90% (reduced male number)
stat_sampling_reducedhet=list() for (i in 1:5){
  file=sextab[i]
  df=read.table(file,header=T,stringsAsFactors = F)
  library(dplyr)
  num_het=table(df[,2])[1]; 
sampling_het=c(round(0.75*num_het),round(0.5*num_het),round(0.25*num_het),round(0.1*num_het))
  num_homo=table(df[,2])[2]; sampling_homo=c(rep(num_homo,4))
  vect_sampling<-list(sampling_het,sampling_homo)
  prop_file=c("prophet75","prophet50","prophet25","prophet10")
  stat_sampling_reducedhet[[species[i]]]=vect_sampling
  for (prop in 1:4){
    sampling= stratified(df, "inferred_sex", size = c(heteromorphic 
=as.numeric(vect_sampling[[1]][prop]), homomorphic = as.numeric(vect_sampling[[2]][prop]))) 
#https://stackoverflow.com/questions/23831711/sample-n-random-rows-per-group-in-a-dataframe
    pathSampling=paste(rep(pathfile[i],dim(sampling)[1]),as.vector(data.frame(sampling[,1],stringsAsFactors=F)[,1]),sep="")
   # write.table(pathSampling,paste(OUT_FOLD,species[i],"_",prop_file[prop],".txt",sep=""),r=F,c=F,quote=F)
  }
}
##run 25%, 50%, 90% (reduced female number)
  stat_sampling_reducedhomo=list()
  for (i in 1:5){
    file=sextab[i]
    df=read.table(file,header=T,stringsAsFactors = F)
    library(dplyr)
    num_het=table(df[,2])[1]; sampling_het=c(rep(num_het,4))
    num_homo=table(df[,2])[2]; 
sampling_homo=c(round(0.75*num_homo),round(0.5*num_homo),round(0.25*num_homo),round(0.1*num_homo))
    vect_sampling<-list(sampling_het,sampling_homo)
    prop_file=c("prophom75","prophom50","prophom25","prophom10")
    stat_sampling_reducedhomo[[species[i]]]=vect_sampling
    for (prop in 1:4){
      sampling= stratified(df, "inferred_sex", size = c(heteromorphic 
=as.numeric(vect_sampling[[1]][prop]), homomorphic = as.numeric(vect_sampling[[2]][prop]))) 
#https://stackoverflow.com/questions/23831711/sample-n-random-rows-per-group-in-a-dataframe
      pathSampling=paste(rep(pathfile[i],dim(sampling)[1]),as.vector(data.frame(sampling[,1],stringsAsFactors=F)[,1]),sep="")
      write.table(pathSampling,paste(OUT_FOLD,species[i],"_",prop_file[prop],".txt",sep=""),r=F,c=F,quote=F)
    }
  }
