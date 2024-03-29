#!/usr/bin/env Rscript

    cat("\nSex Assignment Trough Coverage (SATC):\nprogram to jointly identify sex linked scaffolds and infer individuals sex based on depht of coverage of NGS data.\n\n")

whereDir <- function(){
    # function to get directory where scripts are, so satcFunc.R can be sourced when run from any folderfrom outside
    # made by krishang
    cmdArgs <- commandArgs(trailingOnly = FALSE)
    needle <- "--file"
    match <- grep(needle, cmdArgs)
    tf <- unlist(strsplit(cmdArgs[match], "="))[2]
    d <- dirname(tf)
    return(d)
}



d <- whereDir()
source(paste(d, "satcFunc.R", sep="/"))




args <- commandArgs(trailingOnly=TRUE)
col12 <- c("#FFB7FC","#ef8a62","#fddbc7","#d1e5f0","#FF106A","#FFB7FC")[c(1,5)]

pars <- readArgs(args)

cat("Running SATC with following parameters:\n
\tinfile:", pars$infile,"\n\toutprefix:", pars$outprefix,
"\n\tK:", pars$K, "\n\tmodel:", pars$model,
"\n\tminLength:", pars$minLength, "\n\tM:", pars$M,
"\n\tnormScaffolds:", pars$normScaffolds, "\n\tuseMedian:", pars$useMedian, "\n\n")

SPECIES <- basename(pars$outprefix)
OUTFOLD <- dirname(pars$outprefix)
IDXFILE <- pars$infile

# load mclust only when need gaussian clustering
if(pars$model == "gaussian"){
    if (!require(mclust)) install.packages('mclust',repos='http://cran.us.r-project.org')
    library(mclust)  
}

normScaffolds <- pars$normScaffolds
if(!is.null(pars$normScaffolds)) normScaffolds <- scan(pars$normScaffolds, what="df")


sex <- satc(SPECIES,IDXFILE,OUTFOLD, minLength=pars$minLength, M=pars$M, weight=TRUE, # hard code bc FALSE doesn't work
            K=pars$K, model=pars$model, normScaffolds=normScaffolds, useMedian=pars$useMedian)


cat("\nFinished all analyses\n\n")

outpng1 <- paste0(OUTFOLD,"/",SPECIES,"_depth.png")
outpng2 <- paste0(OUTFOLD,"/",SPECIES,"_PCA_and_boxplot.png")
outpng3 <- paste0(OUTFOLD,"/",SPECIES,"_PCAuncertainty_and_BoxplotPerSample.png")

sexFile <- paste0(OUTFOLD,"/",SPECIES,"_sampleSex.tsv")
scafFile <- paste0(OUTFOLD,"/",SPECIES,"_scaffSex.tsv")
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

bitmap(outpng3,w=12,h=4,res = 300) 
layout(matrix(1:2,1,by=T),w=c(1.2,3.8))
par(mar=c(2,2,2,0)) 
plotUnc(sex,main=SPECIES) 
plotSamples(sex,ylim=ylim,abnormal=TRUE)
dv<-dev.copy(png,outpng3,bg="transparent")
invisible(dev.off())


cat("Plots saved in", outpng1, outpng2, "and", outpng3, "\n\n")

sampleTable <- makeIndTable(sex)

write.table(sampleTable, sexFile, quote=F, row.names=F, col.names=TRUE, sep="\t")

scaffTable <- sex$SexScaffolds
names(scaffTable) <- c("Scaffold", "Length", "X_Z", "Abnormal_sex_linked","pVal", "homogametic_median", "heterogametic_median")

write.table(scaffTable, scafFile,  quote=F, row.names=F, col.names=TRUE, sep="\t")


cat("Inferred sex for each sample and information on normalized depth written to", sexFile, "\n\n")

cat("Inferred sex for scaffolds and information on normalized depth written to", scafFile, "\n\n")


abnormalsexlinked <- sex$SexScaffolds$Name[sex$SexScaffolds$Abnormal_sex_linked_Scaffold]
xz <- sex$SexScaffolds$Name[sex$SexScaffolds$X_Z_Scaffolds]

write(abnormalsexlinked, outlist1)
write(xz, outlist2)

cat("List of abnormal sex linked scaffolds written to", outlist1, "\n")
cat("List of XZ scaffolds written to", outlist2, "\n\n")
cat("We recommend excluding scaffolds in", outlist1, " and in ",outlist2, " from any analyses that should focus on autosomes.\nIf you want to do analyses in sexual chromosomes we recommend to use only scaffolds in", outlist2, "which seem well behaved regarding ploidy difference between sexes\n\n")


datout <-  paste0(OUTFOLD,"/",SPECIES,".sexSamples_sexScaffolds.rds")


saveRDS(sex, datout) 

    
cat("All data saved in", datout,"\nUse readRDS to read file\n")

