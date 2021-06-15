plotIndv_withlabel <- function(x,ylim=c(0,2),abnormal=TRUE,main=""){
  #par(mar=c(10.1,4.1,3.1,2.1))
  mat <- sapply(x$dat,function(y) y$norm)
  rownames(mat) <- x$dat[[1]][,1]
  colnames(mat)<-names(x$dat)
  sexLinkedScaf <- x$dat[[1]][,1][x$SexScaffolds$Sex_linked_Scaffolds]
  XZScaf <- x$dat[[1]][,1][x$SexScaffolds$X_Z_Scaffolds]
  
  keep <- x$dat[[1]][,1][x$SexScaffolds$X_Z_Scaffolds]
  if(abnormal)
    keep<- c(keep,x$dat[[1]][,1][!x$SexScaffolds$X_Z_Scaffolds & x$SexScaffolds$Sex_linked_Scaffolds ])
  
  #mat <- mat[, order(x$sex)]
  
  mat <- mat[keep,]
  mat_hom<-mat[keep,x$sex=="homomorphic"]
  mat_het<-mat[keep,x$sex=="heteromorphic"]
  mat_sort<-cbind(mat_hom, mat_het)
  nam <- gsub(".idxstat|.idxstats","",colnames(mat))
  
  n<- ncol(mat)
  m<-nrow(mat)
  s <- factor(rep(nam,each=n),levels=nam)
  g<-rep(x$sex,m)
  #if(missing(ylim))
   # ylim <-range(mat)
  
  
  gghom<-rep(nam[x$sex=="homomorphic"],nrow(mat_hom))
  gghet<-rep(nam[x$sex=="heteromorphic"],nrow(mat_het))
  gg<-c(gghom,gghet)
  gg<-ordered(gg,levels=c(nam[x$sex=="homomorphic"],nam[x$sex=="heteromorphic"]))
  #b<-boxplot(as.vector(mat_hom)~gghom) b<-boxplot(as.vector(mat_het)~gghet) 
  #b<-boxplot(as.vector(mat_sort)~gg) 
  #b<-boxplot(as.vector(mat_sort)~gg,col=col12[as.factor(c(x$sex[x$sex=="homomorphic"],x$sex[x$sex=="heteromorphic"]))])
  b<-boxplot(as.vector(mat_sort)~gg,
             col=col12[as.factor(c(x$sex[x$sex=="homomorphic"],x$sex[x$sex=="heteromorphic"]))],ylab="Normalized 
Depth",
             axes=F,xlab="",ylim=ylim)
  axis(2,cex.axis=1.05,ylim=ylim)
  text(1:n,y=rep(-0.1,n),c(nam[x$sex=="homomorphic"],nam[x$sex=="heteromorphic"]),xpd=T,srt=90,cex=0.7)
  title(main,adj=0.2,cex.main=1.5)
  gen <- c("Heterogametic ","Homogametic ")
 # legend("topright",gen,pch=16,cex=1,col=col12,bty="n",horiz=T,xpd=T)
  legend(0.8*n,2.5,gen,pch=16,cex=1,col=col12,bty="n",horiz=T,xpd=T)
    }
