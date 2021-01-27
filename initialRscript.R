library(mclust) library(ggplot2) filterScaffold <- function(dat,minLength=1e5,top=5,range=c(0.3,2)){
  ord <- order(dat[[1]]$V2,decreasing=T)
  dat <- lapply(dat,function(x) x[ord,])
  keepScarfs <- dat[[1]]$V2 > minLength
  filtered <- lapply(dat,function(x) x[keepScarfs,])
  
  normScarfs <- rank(-filtered[[1]]$V2)%in%1:top
  norma <- function(x){
    denom <- mean(x$V3[normScarfs]/x$V2[normScarfs])
    x$norm <- x$V3/x$V2/denom
    x
  }
  normed <- lapply(filtered,norma)
  meanNormDepth <- rowMeans(sapply(normed,function(x) x$norm))
  keep <- meanNormDepth > range[1] & meanNormDepth<range[2]
  lapply(normed,function(x) x[keep,])
  
}
plotDepth <- function(dat,ylim,col=1:length(dat),...){
  scafLen <- dat[[1]][,2]
  
  mmax <- mmax <- max(sapply(dat,function(x) max(x[,"norm"])))
  
  if(missing(ylim))
    ylim <- c(0,mmax)
  par(mar = c(7, 7, 2, 3))
  plot(scafLen,dat[[1]][,"norm"],log="x",xlab="",ylab="",ylim=ylim,type="l", cex.lab=2.8, cex.axis=1.5,...)
    s<- sapply(1:length(dat),function(x) lines(scafLen,dat[[x]][,"norm"],col=col[x],pch=16,type="b",cex=.3))
  title(ylab="normalized depth", line=4, cex.lab=1.5, family="Calibri Light")
  title(xlab="scaffold length", line=4, cex.lab=1.5, family="Calibri Light")
}
sexDetermine <- function(dat,K=2){
  
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
  
  group <- Mclust(pca$x[,1:K],G=2)
  g <- group$classification
  
  beta <- rowMeans(mat[,g==1])-rowMeans(mat[,g==2])
  if( mean(beta[ abs(beta) > 0.4 & abs(beta) < 0.6]) > 0 )
    sex <- c("female","male")[g]
  else{
    sex <- c("male","female")[g]
    beta <- - beta
  }
  
  sexScafs <- beta > 0.4 & beta < 0.6
  outlierScafs<- rowMeans(mat_first) > 1.3
  autoScafs<- as.logical(rep("TRUE",dim(mat_first)[1])) & !sexScafs & !outlierScafs
  pval <- apply(mat,1,function(x) t.test(x~sex)$p.value) #new
  sexAssoScafs <- pval < 0.05/nrow(mat) #new
  list(dat=dat,pca=pca,group=g,sex=sex,sexScafsLogic=sexScafs,sexScaf=dat[[1]][,1][sexScafs],pval=pval,sexAssoScafLogic=sexAssoScafs,sexAssoScaf=dat[[1]][,1][sexAssoScafs],autoScafLogic=autoScafs,outlierScafLogic=outlierScafs)
}
sexDetermineZW <- function(dat,K=2){
  
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
  
  group <- Mclust(pca$x[,1:K],G=2)
  g <- group$classification
  
  beta <- rowMeans(mat[,g==1])-rowMeans(mat[,g==2])
  if( mean(beta[ abs(beta) > 0.4 & abs(beta) < 0.6]) > 0 )
    sex <- c("male","female")[g]
  else{
    sex <- c("female","male")[g]
    beta <- - beta
  }
  
  sexScafs <- beta > 0.4 & beta < 0.6
  outlierScafs<- rowMeans(mat_first) > 1.3
  autoScafs<- as.logical(rep("TRUE",dim(mat_first)[1])) & !sexScafs & !outlierScafs
  pval <- apply(mat,1,function(x) t.test(x~sex)$p.value) #new
  sexAssoScafs <- pval < 0.05/nrow(mat) #new
  list(dat=dat,pca=pca,group=g,sex=sex,sexScafsLogic=sexScafs,sexScaf=dat[[1]][,1][sexScafs],pval=pval,sexAssoScafLogic=sexAssoScafs,sexAssoScaf=dat[[1]][,1][sexAssoScafs],autoScafLogic=autoScafs,outlierScafLogic=outlierScafs)
  }
plotGroup <- function(x,col=1:2,...){
  add_legend <- function(...) {
    opar <- par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0),
                mar=c(0, 0, 0, 0), new=TRUE)
    on.exit(par(opar))
    plot(0, 0, type='n', bty='n', xaxt='n', yaxt='n')
    legend(...)
  }
  par(mar = c(8, 8, 3, 2))
  lab <- ifelse(x$sex=="female","#FF69B4","#009ACD")
  pch_lab <- ifelse(x$sex=="female",16,17)
  plot(x$pca$x[,1:2],xlab="",ylab="",col=lab,pch=pch_lab,cex=2,cex.axis=1.75)
  #legend("bottom",levels(as.factor(x$sex)),col=c("#FF69B4","#009ACD"),pch=c(16,17),box.lwd = 0,,bg="transparent",cex=2.5)
  title(ylab=paste("PC2 ","(",round(sex$pca$d[2]/sum(sex$pca$d)*100, 2),"%)",sep=""), line=3, cex.lab=2, family="Calibri 
Light")
  title(xlab=paste("PC1 ","(",round(sex$pca$d[1]/sum(sex$pca$d)*100, 2),"%)",sep=""), line=3, cex.lab=2, family="Calibri 
Light")
  add_legend("topright", legend=levels(as.factor(x$sex)), pch=c(16,17),
             col=c("#FF69B4","#009ACD"),
             horiz=TRUE, bty='n', cex=2)
  }
plotAssoScafs <- function(x,abnormalOnly=FALSE,...){
  
  
  keep <- x$sexAssoScafLogic
  if(abnormalOnly)
    keep <- x$sexAssoScafLogic & !x$sexScafsLogic
  mat <- sapply(x$dat,function(y) y$norm)
  female <- rowMeans(mat[keep,x$sex=="female"])
  male <- rowMeans(mat[keep,x$sex=="male"])
  
  par(mar = c(9, 7, 2, 3))
  
barplot(rbind(female,male),xlab="",las=2,cex.names=.9,border=NA,col=c("black","red"),beside=T,legend=c("female","male"),ylab="normalized 
depth",ylim=c(0,1.3),names=x$dat[[1]][keep,1],...)
  title(xlab = "scaffolds", line = 8)
  
}
plotScafBoxplot<-function(x,...){
  mat <- sapply(x$dat,function(y) y$norm)
  depth<- c(as.vector(mat[x$sexScafsLogic,x$sex=="female"]),as.vector(mat[x$sexScafsLogic,x$sex=="male"]))
  scaf<-as.vector(sapply(x$dat,function(y) y$V1[x$sexScafsLogic]))
  sex_lab=c(rep("female",sum(x$sexScafsLogic)*sum(x$sex=="female")),rep("male",sum(x$sexScafsLogic)*sum(x$sex=="male")))
  sex_col=rep(c("#FF69B4","#009ACD"),sum(x$sexScafsLogic))
  mydaf2=data.frame(depth=depth,scaf=scaf,sex_lab=sex_lab)
  ggplot(mydaf2, aes(scaf, depth, fill=factor(sex_lab))) +
    geom_boxplot(lwd=0.2,outlier.size = 1.5,outlier.stroke = 0.2) +
    theme(axis.text.x = element_text(angle = 90,size=15),axis.text.y = element_text(size=15),axis.title.y = 
element_text(size=20),axis.title.x = element_text(size=20)) +
    labs(x="Scaffolds",y="Normalized Depth",color="") +
    theme(legend.title = element_blank(),legend.text=element_text(size=rel(2))) +
    geom_vline(xintercept = seq(1,sum(x$sexScafsLogic),1)+0.5, linetype=2, color = "darkgrey", size=0.5)+
    scale_fill_manual(values=sex_col)+
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank(), axis.line = element_line(colour = "black"))
}
plotAutosome<-function(x,...){
  mat <- sapply(x$dat,function(y) y$norm)
  autos_list=data.frame(Name=x$dat[[1]]$V1[x$autoScafLogic],Len=x$dat[[1]]$V2[x$autoScafLogic],Mean=rowMeans(mat[x$autoScafLogic,]),SD=apply(mat[x$autoScafLogic,],1, 
sd, na.rm = TRUE))
  
  myplot<-ggplot(autos_list, aes(x=Mean, y=log(Len)))+geom_point(aes(color="#8B1C62"))+
    geom_errorbarh(aes(xmin=Mean-SD,xmax=Mean+SD))+theme_classic()+
    scale_color_manual(values=c("#8B1C62"))+
    labs(x="Normalized Depth",y="Log Length of Scaffolds",color="") +
    theme(legend.position = "none")
  print(myplot)
}
plotOutlier<-function(x,...){
  mat <- sapply(x$dat,function(y) y$norm)
  outlier_list=data.frame(Name=x$dat[[1]]$V1[x$outlierScafLogic],Len=x$dat[[1]]$V2[x$outlierScafLogic],Mean=rowMeans(mat[x$outlierScafLogic,]),SD=apply(mat[x$outlierScafLogic,],1, 
sd, na.rm = TRUE))
  
  myplot<-ggplot(outlier_list, aes(x=Mean, y=log(Len)))+geom_point(aes(color="#20B2AA",size=1.5))+
    geom_errorbarh(aes(xmin=Mean-SD,xmax=Mean+SD))+theme_classic()+
    scale_color_manual(values=c("#20B2AA"))+
    labs(x="Normalized Depth",y="Log Length of Scaffolds",color="") +
    theme(legend.position = "none")
  print(myplot)
}
