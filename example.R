
#########################################################
col12<-c("#b2182b","#ef8a62","#fddbc7","#d1e5f0","#67a9cf","#2166ac")[c(1,5)]

plotGroup <- function(x){
    par(mar=c(4.1,4.6,3.1,2.1))
    lab <- as.factor(x$sex)
    plot(x$pca$x[,1:2],col=col12[lab],cex=1.6,pch=16,ylab="PC2",xlab="PC1",cex.lab=1.5)

}
plotScafs <- function(x,ylim,abnormal=FALSE,main=""){
  
    par(mar=c(4.1,4.1,3.1,2.1))
    mat <- sapply(x$dat,function(y) y$norm)
    rownames(mat) <- x$dat[[1]][,1]
    keep <- x$sexScaf
    if(abnormal)
                keep<- c(keep,x$sexAssoScaf[!x$sexAssoScaf%in%x$sexScaf])
                  
    mat <- mat[keep,]
    nam <- gsub("NW_0176|NW_0050","",rownames(mat))
 
    n<- ncol(mat)
    m<-nrow(mat)
    s <- factor(rep(nam,each=n),levels=nam)
    g<-rep(x$sex,m)
    at <- cumsum(rep(c(1.2,1),m))
    if(missing(ylim))
      ylim <-range(mat)
    b<-boxplot(as.vector(t(mat))~g+s,las=2,col=col12,names=NA,ylab="normalized depth",at=at,axes=F,xlab="Sex Associated Scaffolds",lwd=0.5,pch=16,outcol=col12,ylim=ylim)
  #  abline(v=1:m*2.2+0.6,lty=2)
    axis(2)

    text(1:m*2.2-1.1,y=rep(min(ylim)-diff(ylim)/10,m),nam,xpd=T,srt=45,cex=0.8)
    title(main,adj=0.2,cex.main=1.5)
    gen <- c("homogameticmorphic (ZZ)","heterogameticmorphic (ZW)")
    if(abnormal)
         abline(v=sum(x$sexScafsLogic)*2.2+0.6,lty=2)
    #legend("topright",gen,pch=16,cex=1,col=col12,bty="n",horiz=T,)
  legend(2*m*0.5,max(ylim)*1.2,gen,pch=16,cex=1,col=col12,bty="n",horiz=T,xpd=T)


} 
#################################
finces<-readRDS(file ="/home/casia16/satcplot/finches_sexList.rds")
impala<-readRDS(file ="/home/casia16/satcplot/impala_sexList.rds")
leopard<-readRDS(file ="/home/casia16/satcplot/leopard_sexList.rds")
muscox<-readRDS(file ="/home/casia16/satcplot/muscox_sexList.rds")
waterbuck<-readRDS(file ="/home/casia16/satcplot/waterbuck_sexList.rds")
whales<-readRDS(file ="/home/casia16/satcplot/whales_sexList.rds") 

ylim<-c(0.3,1.5)
pdf("~/public/open/tmp.pdf",w=2*5,h=5*3-2)
layout(matrix(1:10,5,by=T),w=c(1.5,3.5))
plotGroup(leopard)
plotScafs(leopard,main="Leopards",ylim=ylim)
plotGroup(finces)
plotScafs(finces,main="Finces",ylim=ylim)
plotGroup(muscox) 
plotScafs(muscox,main="Muscox",ylim=ylim)
plotGroup(whales)
plotScafs(whales,main="Whales",ylim=ylim)
plotGroup(impala)
plotScafs(impala,main="Impala",ylim=ylim)
dev.off()

pdf("~/public/open/tmp2.pdf",w=2*5,h=5*3-2)
layout(matrix(1:10,5,by=T),w=c(1.5,3.5))
plotGroup(leopard)
plotScafs(leopard,main="Leopards",ylim=ylim,ab=T)
plotGroup(finces)
plotScafs(finces,main="Finces",ylim=ylim,ab=T)
plotGroup(muscox) 
plotScafs(muscox,main="Muscox",ylim=ylim,ab=T)
plotGroup(whales)
plotScafs(whales,main="Whales",ylim=ylim,ab=T)
plotGroup(impala)
plotScafs(impala,main="Impala",ylim=ylim,ab=T)
dev.off()

