#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE) 
col12<-c("#FFB7FC","#ef8a62","#fddbc7","#d1e5f0","#FF106A","#FFB7FC")[c(1,5)]

if (length(args)<2) {
  stop("At least two arguments must be supplied (prefix, input_folder)", call.=FALSE)
} else if (length(args)==2) {
  # default output file
  args[3] = "."
}



SPECIES=args[1] 
IDXFILE=args[2] 
OUTFOLD=args[3] 
DEPTH_SIM=args[4]
DEPTH_REAL=args[5]

cat("output prefix\t:",SPECIES,"\ninput file list\t:",IDXFILE,"\noutput folder\t: ",OUTFOLD,"\n")


source("satcFunc.R")

sex <- satc(SPECIES,IDXFILE,OUTFOLD,DEPTH_SIM,DEPTH_REAL)


cat("\nFinished all analyses\n\n")

outpng1 <- paste0(OUTFOLD,"/",SPECIES,"_depth.png")
outpng2 <- paste0(OUTFOLD,"/",SPECIES,"_PCA_and_boxplot.png")

sexlist <- paste0(OUTFOLD,"/",SPECIES,"_sampleSex.tsv")

outlist1 <- paste0(OUTFOLD,"/",SPECIES,"_sexlinked_scaff.list")
outlist2 <- paste0(OUTFOLD,"/",SPECIES,"_XZ_scaff.list")

ylim<-c(0,2) 
bitmap(outpng1,w=12,h=6,res = 300) 
par(mar=c(2,2,2,0))
plotDepth(sex,ylim=ylim) 
invisible(dev.off())


bitmap(outpng2,w=12,h=4,res = 300) 
layout(matrix(1:2,1,by=T),w=c(1.2,3.8))
par(mar=c(2,2,2,0)) 
plotGroup(sex,main=SPECIES) 
plotScafs(sex,ylim=ylim,ab=T)
invisible(dev.off())


cat("Plots saved in", outpng1, "and", outpng2, "\n\n")

write.table(cbind(names(sex$dat), sex$sex), sexlist, quote=F, row.names=F, col.names=c("sample", "inferred_sex"), sep="\t")

cat("Inferred sex for each sample written to", sexlist, "\n\n")

sexlinked <- sex$SexScaffolds$Name[sex$SexScaffolds$Sex_linked_Scaffolds]
xz <- sex$SexScaffolds$Name[sex$SexScaffolds$X_Z_Scaffolds]

write(sexlinked, outlist1)
write(xz, outlist2)

cat("List of sex linked scaffolds written to", outlist1, "\n")
cat("List of XZ scaffolds written to", outlist2, "\n\n")
cat("All scaffolds in", outlist2,"are also in", outlist1, "\n\n")
cat("We recommend excluding scaffolds in", outlist1, "from any analyses that should focus on autosomes.\nIf you want to do analyses in sexual chromosomes we recommend to use only scaffolds in", outlist2, "which seem well behaved regarding ploidy difference between sexes\n\n")


datout <-  paste0(OUTFOLD,"/",SPECIES,".sexSamples_sexScaffolds.rds")


saveRDS(sex, datout) 

    
cat("All data saved in", datout,"\nUse readRDS to read file\n")

