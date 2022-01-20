#!/usr/bin/env R
require(mclust)
col12<-c("#FFB7FC","#ef8a62","#fddbc7","#d1e5f0","#FF106A","#FFB7FC")[c(1,5)]


printHelp <- function(){

    cat("\tRequired arguments:\n\n
\t\t-i --input:\t  path to file with paths to idxstat files\n
\t\t-o --output:\t prefix for output files\n\n
\tOptional arguments:\n\n
\t\t--K:\t Number of principal components used for clustering (default 2)\n
\t\t--model:\t Use gaussian clustering \"gaussian\" or hierarchical clustering \"hclust\" (default \"gaussian\")\n
\t\t--minLength:\t Minimum length of scaffolds to include, in bp (default 1e5)\n
\t\t--M:\t Number of scaffolds used for normalization (default 5)\n
\t\t--normScaffolds:\t Path to file with list of scaffolds to use for normalization; overwrites M (defualt NULL)\n
\t\t--useMedian:\t Use median depth of coverage of selected scaffolds for normalization instead of mean (default FALSE)\n
\t\t-h:\t print help and exit\n
")

}

readArgs <- function(args){
    
    pars <- list(infile = NULL, outprefix = NULL,
                 weight=TRUE, K=2, model="gaussian", minLength=1e5,
                 M=5, normScaffolds=NULL, useMedian=FALSE
                 )
    
    for(i in seq(1, length(args), 2)){
        
        if(args[i]=="-i" | args[i]=="--input"){ pars$infile <- args[i+1]
        } else if(args[i]=="-o"| args[i] == "--output"){ pars$outprefix <- args[i+1]
        #} else if(args[i]=="--weight"){ pars$weight <- as.logical(args[i+1])
        } else if(args[i]=="--K"){ pars$K <- as.integer(args[i+1])
        } else if(args[i]=="--model"){ pars$model <- args[i+1]
        } else if(args[i] == "--minLength"){ pars$minLength <- as.numeric(args[i+1])
        } else if(args[i] == "--M"){ pars$M <- as.integer(args[i+1])
        } else if(args[i] == "--normScaffolds"){ pars$normScaffolds <- args[i+1]
        } else if(args[i] == "--useMedian"){ pars$useMedian <- as.logical(args[i+1])
        } else if(args[i] == "-h"){
            printHelp()
            stop("Printed help and exited due to -h flag, not really an error.")
        } else {
            printHelp()
            stop("Unkonwn argument ", args[i], ", see above accepted arguments.\n")
        }

    }

    if(is.null(pars$infile) | is.null(pars$outprefix)){
        printHelp()
        stop("Missing requried argument, see help above.")
    }
    
    return(pars)
}


filterScaffold <- function(dat,minLength=1e5,M=5,normScaffolds = NULL,range=c(0.3,2),useMedian=FALSE,saveWarn=FALSE){
    #order of size of scaffold
    ord <- order(dat[[1]]$V2,decreasing=T)

    keepScarfs <- dat[[1]]$V2[ord] > minLength
    fun <- function(x){
        colnames(x)[1:3] <- c("scaffold","Length","Nreads")
        rownames(x) <- x$scaffold
        x[ord,][keepScarfs,]
    }
    ## filter and sort idxstat files
    filtered <- lapply(dat,fun)
    warnMsg <- "none"
    ## scaffolds use for normalization
    if(!is.null(normScaffolds)){
      #  normScaffolds <- scan(normScaffolds, what="d")
        if(!all(normScaffolds%in%filtered[[1]][,1]))
            warnings("Chosen normalizing scaffold not found (after min length filtering)")
        normScarfs <- filtered[[1]]$scaffold%in%normScaffolds
    }
    else
        normScarfs <- rank(-filtered[[1]]$Length)%in%1:M
    
    norma <- function(x){
         x$normScafs <- normScarfs
        if(useMedian){
            denom <- median(x$Nreads[normScarfs]/x$Length[normScarfs])
            x$norm <- x$Nreads/x$Length/denom
           
            }
        else{
            denom <- sum(x$Nreads[normScarfs])/sum(x$Length[normScarfs])
            x$norm <- x$Nreads/x$Length/denom
            cov <- x$Nreads[normScarfs]/x$Length[normScarfs]/denom 
            if(diff(range(cov)) > 0.3){
                if(saveWarn)
                    warnMsg <- "large difference in covarage of the scaffolds used for normalization. Consider using the median instead or manually choose normalizing scaffolds "
                else 
                    warning("large difference in covarage of the scaffolds used for normalization. Consider using the median instead (--useMedian TRUE) or manually choose scaffolds (--normScaffolds)")
           # print(normScarfs)
              }
        }
        x
    }
    normed <- lapply(filtered,norma)
    meanNormDepth <- rowMeans(sapply(normed,function(x) x$norm))
    keep <- meanNormDepth > range[1] & meanNormDepth<range[2]
    if(saveWarn)
        return(list(lapply(normed,function(x) x[keep,]),warnMsg))
    lapply(normed,function(x) x[keep,])
}

               
               
plotDepth <- function(dat,normOnly=FALSE,ylim,col,...){
    if(length(dat)<6)
        dat<-dat$dat
    if(missing(col))
        col=1:length(dat)
    if(normOnly){
        dat <- lapply(dat,function(x) x[x$normScafs,])
       if(missing(ylim))
           ylim<-range(sapply(dat,function(x) x$norm))
    }
    scafLen <- dat[[1]][,2]
    mmax <- mmax <- max(sapply(dat,function(x) max(x[,"norm"])))
    if(missing(ylim))
        ylim <- c(0,mmax)
    par(mar = c(7, 7, 2, 3))
    plot(scafLen,dat[[1]][,"norm"],log="x",xlab="",ylab="",ylim=ylim,type="l", cex.lab=2.8, 
         cex.axis=1.5,...)
    s<- sapply(1:length(dat),function(x) 
        lines(scafLen,dat[[x]][,"norm"],col=col[x],pch=16,type="b",cex=.3))
    title(ylab="normalized depth", line=4, cex.lab=1.5)
    title(xlab="scaffold length", line=4, cex.lab=1.5)
}

sexDetermine <- function(dat,K=2,weight=TRUE,model="gaussian"){
    model <- char.expand(model, c("gaussian","hclust"))
    
    mat_first <- sapply(dat,function(x) x$norm)
    noNArow=apply(mat_first,1,function(x) ifelse(sum(is.na(x))==0,TRUE,FALSE))
    #center
    mat <- mat_first[noNArow,]-rowMeans(mat_first[noNArow,])
    
    #    pca <- prcomp(t(mat),scale=F)
    maxRank <- min(dim(mat))
    svd <- svd(t(mat))
    SIG <- matrix(0,maxRank,maxRank)
    diag(SIG)<-svd$d
    pca <- svd
    pca$x <- svd$u[,1:maxRank]%*%SIG
    
    if(weight)
      d<- pca$x[,1:K]
    else
      d <- svd$u[,1:maxRank]
    if(model=="gaussian"){
        group <- Mclust(d,G=2,modelName="EVV")
        if(is.null(group))
            group <- Mclust(d,G=2)
        g <- group$classification
    }
    else if(model=="hclust"){
        hh<-hclust(dist(d))
        g <- cutree(hh, k=2) # cut
    }

    if(sum(g==1) ==1 |  sum(g==2) ==1 ) stop("Dataset can not be used for sex determination (poor clustering). One of the inferred sex groups only have one member.")

    beta <- rowMeans(mat[,g==1])-rowMeans(mat[,g==2])

    if(!any( abs(beta) > 0.4 & abs(beta) < 0.6))
        stop("No good candidates for sex scaffold found based on depth of coverage. Try changing the clustering method, or consider SATC might not work for your data.")

    if( mean(beta[ abs(beta) > 0.4 & abs(beta) < 0.6]) > 0 )
        sex <- c("homomorphic","heteromorphic")[g]
    else{
        sex <- c("heteromorphic","homomorphic")[g]
        beta <- - beta
    }
    homoMedian <- apply( mat_first [,sex=="homomorphic"],1,median)
    heteroMedian <- apply( mat_first [,sex=="heteromorphic"],1,median) 
    sexScafs <- beta > 0.4 & beta < 0.6
    outlierScafs<- rowMeans(mat_first) > 1.3
    autoScafs<- as.logical
    pval <- apply(mat,1,function(x) t.test(x~sex)$p.value) #new
    sexAssoScafs <- pval < 0.05/nrow(mat) #new
    list(dat=dat,pca=pca,sex=sex,SexScaffolds=data.frame(Name=dat[[1]][,1],Length=dat[[1]][,2],X_Z_Scaffolds=sexScafs,Abnormal_sex_linked_Scaffolds=sexAssoScafs,Pval=pval,homoMedian=homoMedian,heteroMedian=heteroMedian,stringsAsFactors = FALSE))
}


plotGroup <- function(x,main=""){
    par(mar=c(4.1,4.6,3.1,2.1))
    lab <- as.factor(x$sex)
    #plot(x$pca$x[,1:2],col=col12[lab],cex=1.6,pch=16,ylab="PC2",xlab="PC1",cex.lab=1.5)
    plot(x$pca$x[,1:2],bg=col12[lab],cex=1.6,pch=21,ylab="PC2",xlab="PC1",cex.lab=1.5)
    
}

plotScafs <- function(x,ylim,abnormal=FALSE,main=""){
    par(mar=c(4.1,4.1,3.1,2.1))
    mat <- sapply(x$dat,function(y) y$norm)
    rownames(mat) <- as.character(x$dat[[1]][,1])
    sexLinkedScaf <- x$SexScaffolds$Abnormal_sex_linked_Scaffolds|x$SexScaffolds$X_Z_Scaffolds
    XZScaf <- x$SexScaffolds$X_Z_Scaffolds
    
    keep <- as.character(x$dat[[1]][,1][XZScaf])
    if(abnormal)
        keep<- c(keep, as.character(x$dat[[1]][,1][sexLinkedScaf & !XZScaf])) # this forces correct order in plot
    
    mat <- mat[keep,]
    #nam <- gsub("NW_0176|NW_0050","",rownames(mat))
    nam <- rownames(mat)

    n<- ncol(mat)
    m<-nrow(mat)
    s <- factor(rep(nam,each=n),levels=nam)
    g<-rep(x$sex,m)
    at <- cumsum(rep(c(1.2,1),m))
    if(missing(ylim))
    			ylim <-range(mat)
    b<-boxplot(as.vector(t(mat))~g+s,las=2,col=col12,names=NA,ylab="Normalized Depth",at=at,axes=F,xlab="Sex Associated Scaffolds",lwd=0.5,pch=16,outcol=col12,ylim=ylim,cex.lab=1.2)
    #  abline(v=1:m*2.2+0.6,lty=2)
    axis(2,cex.axis=1.05)
    
    text(1:m*2.2-1.1,y=rep(min(ylim)-diff(ylim)/10,m),nam,xpd=T,srt=45,cex=0.9)
  			title(main,adj=0.2,cex.main=1.5)
    gen <- c("Heterogametic ","Homogametic ")
    if(abnormal)
        abline(v=sum(x$SexScaffolds$X_Z_Scaffolds)*2.2+0.6,lty=2)
    #legend("topright",gen,pch=16,cex=1,col=col12,bty="n",horiz=T,)
    legend(2.5*m*0.5,1.1*max(ylim)*1,gen,pch=16,cex=1,col=col12,bty="n",horiz=T,xpd=T)
    abline(h = 0.5, col="#20A387FF", lwd=1, lty=2)
  			abline(h = 1, col="#20A387FF", lwd=1, lty=2)
}



plotSamples <- function(x,ylim=c(0,2),abnormal=TRUE,main=""){
     par(mar=c(8.1,4.1,3.1,2.1))
     mat <- sapply(x$dat,function(y) y$norm)
     scafNames <- as.character(x$dat[[1]][,1])
     indNames<- names(x$dat)
     rownames(mat) <- scafNames
     colnames(mat)<- indNames
     sexLinkedScaf <- as.character(scafNames[x$SexScaffolds$Abnormal_sex_linked_Scaffold | x$SexScaffolds$X_Z_Scaffolds])
     XZScaf <- as.character(scafNames[x$SexScaffolds$X_Z_Scaffolds])
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
     text(1:n,y=rep(-0.1,n),namOrder,xpd=T,srt=90,cex=0.7)
     title(main,adj=0.2,cex.main=1.5)
     gen <- c("Heterogametic ","Homogametic ")
     abline(h=0.5,lty=2,lwd=1.5,xlim=c(0,n),col=col12[1])
     abline(h=1,lty=2,lwd=1.5,xlim=c(0,n),col=col12[2])
     abline(v=sum(x$sex=="homomorphic")+0.5,lty=1,lwd=1.5,ylim=c(0,2))
     legend("topright",gen,pch=16,cex=1,col=col12,bty="n",horiz=T,xpd=T)
 }

 plotUnc<-function(x,main=""){
     mod<-Mclust(x$pca$x[,1:2],G=2)
     suppressWarnings(plot(mod,what = "unc",bg="transparent"))
   }

satc <- function(SPECIES,IDXFILE,OUTFOLD,minLength=1e5,M=5, weight=TRUE, K=2, model="gaussian", normScaffolds=NULL, useMedian=FALSE){ 

    filenames <- scan(IDXFILE,what="sUp") 
    ## read.files


    r <- lapply(filenames, read.table,colClasses=c("character","integer","integer","integer")) 

    names(r) <- basename(filenames)
    ## filter and normalized
    rFilt <- filterScaffold(dat=r,minLength=minLength,M=M,normScaffolds=normScaffolds, useMedian=useMedian)
    ## identify sex
    sex <- sexDetermine(dat=rFilt, K=K, weight=weight, model=model) 
    
    return(sex)
}

makeIndTable <- function(dat){

    XZscaff <- dat$SexScaffolds$X_Z_Scaffolds
    keepNorm <- dat$dat[[1]]$normScafs
    d <- data.frame(Sample = names(dat$dat), Inferred_sex = dat$sex,
                    Median_depth_sex_scaffolds = sapply(dat$dat, function(x) median(x$norm[XZscaff])),
                    Nreads = sapply(dat$dat, function(x) sum(x$Nreads)),
                    NreadsNormalizing = sapply(dat$dat, function(x) sum(x$Nreads[keepNorm])),
                    minNormDepNormalizing = sapply(dat$dat, function(x) min(x$norm[keepNorm])),
                    maxNormDepNormalizing = sapply(dat$dat, function(x) max(x$norm[keepNorm])))
                    
                                                  
                    
    return(d)

    
}
