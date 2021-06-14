#!/usr/bin/env R
col12<-c("#FFB7FC","#ef8a62","#fddbc7","#d1e5f0","#FF106A","#FFB7FC")[c(1,5)]

if (!require(mclust)) install.packages('mclust',repos='http://cran.us.r-project.org')
library(mclust)  

filterScaffold <- function(dat,minLength=1e5,M=5,normScaffolds,range=c(0.3,2),useMedian=FALSE){
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

    ## scaffolds use for normalization
    if(!missing(normScaffolds)){
        if(!all(normScaffolds%in%filtered[[1]]$scaffolds))
            warnings("Chosen normalizing scaffold not found (efter min length filtering)")
        normScarfs <- filtered[[1]]$scaffolds%in%normScaffolds
    }
    else
        normScarfs <- rank(-filtered[[1]]$Length)%in%1:M
    
    norma <- function(x){
        if(useMedian){
            denom <- median(x$Nreads[normScarfs]/x$Length[normScarfs])
            x$norm <- x$Nreads/x$Length/denom
            }
        else{
            denom <- sum(x$Nreads[normScarfs])/sum(x$Length[normScarfs])
            x$norm <- x$Nreads/x$Length/denom
            cov <- x$Nreads[normScarfs]/x$Length[normScarfs]/denom 
            if(diff(range(cov)) > 0.3){
                warning("large difference in covarage of the scaffolds used for normalization. Consider using the median instead (useMedian=TRUE) or manually choose scaffolds")
            print(x[normScarfs,])
              }
        }
        x
    }
    normed <- lapply(filtered,norma)
    meanNormDepth <- rowMeans(sapply(normed,function(x) x$norm))
    keep <- meanNormDepth > range[1] & meanNormDepth<range[2]
    lapply(normed,function(x) x[keep,])
}

plotDepth <- function(dat,ylim,col=1:length(dat),...){
    dat<-dat$dat
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
    #center
    mat <- mat_first-rowMeans(mat_first)
    
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
     
    beta <- rowMeans(mat[,g==1])-rowMeans(mat[,g==2])
    if( mean(beta[ abs(beta) > 0.4 & abs(beta) < 0.6]) > 0 )
        sex <- c("homomorphic","heteromorphic")[g]
    else{
        sex <- c("heteromorphic","homomorphic")[g]
        beta <- - beta
    }
    
    sexScafs <- beta > 0.4 & beta < 0.6
    outlierScafs<- rowMeans(mat_first) > 1.3
    autoScafs<- as.logical
    pval <- apply(mat,1,function(x) t.test(x~sex)$p.value) #new
    sexAssoScafs <- pval < 0.05/nrow(mat) #new
    list(dat=dat,pca=pca,sex=sex,SexScaffolds=data.frame(Name=dat[[1]][,1],Length=dat[[1]][,2],X_Z_Scaffolds=sexScafs,Abnormal_sex_linked_Scaffolds=sexAssoScafs,Pval=pval,stringsAsFactors = FALSE))
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
    rownames(mat) <- x$dat[[1]][,1]
    sexLinkedScaf <- x$SexScaffolds$Abnormal_sex_linked_Scaffolds|x$SexScaffolds$X_Z_Scaffolds
    XZScaf <- x$SexScaffolds$X_Z_Scaffolds
    
    keep <- x$dat[[1]][,1][XZScaf]
    if(abnormal)
      keep<- x$dat[[1]][,1][sexLinkedScaf]
    
    mat <- mat[keep,]
    nam <- gsub("NW_0176|NW_0050","",rownames(mat))
  
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



satc <- function(SPECIES,IDXFILE,OUTFOLD,minLength=1e5,M=5) { 
    filenames <- scan(IDXFILE,what="sUp") 
    ## read.files
    r <- lapply(filenames, read.table,colClasses=c("character","integer","integer","integer")) 
    names(r) <- basename(filenames)
    ## filter and normalized
    rFilt <- filterScaffold(r,minLength=1e5,M=5)
    ## identify sex
		sex <- sexDetermine(rFilt) 
    return(sex)
    
    
}
