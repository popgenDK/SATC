

library(mclust,lib.loc="/home/albrecht/R/x86_64-pc-linux-gnu-library/3.2/")
library(shiny)
options(shiny.maxRequestSize=100*1024^2) # set limit to upload file to 100 Mb (default is 5 MB)
source("https://raw.githubusercontent.com/popgenDK/SATC/main/satcFunc.R")


error <- function(txt)
    validate(  need(FALSE, txt)  ) 

shinyServer(function(input, output) {

    output$chooseInd = renderUI( {
        idx <- loadData()
        selectInput( "ind", label = 'Choose indvidauls ',
                 as.list( names(idx) ), multiple = TRUE,  selectize = TRUE,
                 selected = names(idx) )
    })

    output$chooseScaf = renderUI( {
        idx <- loadData()
        ord <- order(idx[[1]][,2],decreasing=T)
        
        scaf <-head( idx[[1]][ord,1],100)
        M <- input$M
        chose <- scaf[1:M]
        selectInput( "scaf", label = 'Choose normalizing scaffolds (max 100 largest shown)',
                    
                 as.list( scaf ), multiple = TRUE,  selectize = TRUE,
                 selected = chose )
    })

  ###########################################################   
  #### this runs satc
  ###########################################################   
    # TO DO: ADD SOME PROGRESS INFORMATION SO THE USER NOW IF SATC IS RUNNING WHEN IT'S SLOW
 
    #  loadData = eventReactive(input$load,{
      loadData = reactive({
          f <- input$idxstats_file
          req(f)
        # f <- list(datapath="tmp2.idxes")
     a <- read.table(f$datapath, h=T,as.is=T) 

        
      r<- lapply(3:ncol(a),function(x) data.frame(scaffolds=a$scaffold,V2=a$len,nreads=a[,x],rand=0,stringsAsFactors=F))
      
     names(r) <- scan(f$datapath, nlines=1, what="da")[-(1:2)] # this avoids that numeric sample ID get X at beginning. at some point might be worth let user set sample ids by uploading file?
     return(r)

    })
 

    filt <- reactive({
        idx <- loadData()
        idx<-idx[input$ind]
        minLength <- input$minLength
        normScaffolds <- input$scaf
        useMedian <- input$useMedian
  
        ## Filter scafoolds (min 100kb ) and normalize using the M longest scaffold
     ##  minLength <- 1e5; normScaffolds<- idx[[1]][order(idx[[1]][,2],decreasing=T)[1:5],1]
        rFilt <- filterScaffold(dat=idx,minLength=minLength,normScaffolds=normScaffolds,useMedian=useMedian)
        rFilt
    })
  sex <- eventReactive(input$run, {
      
      # this must be all idxstats files will columns pasted one next to other, tab separated
      rFilt <- filt()
      model <- input$model
      weight <- T
      K <- input$K
    

   
      withProgress(message="Running SATC...",{
## identify sex and sex scaffolds
      sex <- sexDetermine(dat=rFilt, K=K, weight=weight, model=model) 
      
      sex$rFilt <- rFilt
      })
      
      #save(sex, file="/pontusData/shiny/satcGenis.Rdata")
      return(sex)
      
    })
     
    ###########################################################   
    #### things below generate different output plots and tables
    ###########################################################
    output$plotInd <- renderPlot({
        idx <- loadData()
        idx<-idx[input$ind]
        nReads <- sapply(idx,function(x) sum(as.numeric(x[,3]))) 
        hist(nReads,br=50,col="darkred",xlab="# reads")
    })
output$tableInd <- renderDataTable( {


    idx <- loadData()
    idx<-idx[input$ind]
    nReads <- sapply(idx,function(x) sum(as.numeric(x[,3])))
    keepNorm <- idx[[1]][,1]%in%input$scaf
    nReadsNorm <- sapply(idx,function(x) sum(as.numeric(x[keepNorm,3])))
    rangeMeanNorm <- sapply(idx,function(x) range(x[keepNorm,3]/x[keepNorm,2] / (sum(as.numeric(x[keepNorm,3]))/sum(as.numeric(x[keepNorm,2])))))
    
    df <- data.frame(ID=names(idx),nReads=nReads,nReadsNormalizing=nReadsNorm,"min normalized norm scaffold"=rangeMeanNorm[1,],"max normalized norm scaffold"=rangeMeanNorm[2,],stringsAsFactors=F)
     return( df )

})

    output$pcaPlot <- renderPlot({
#      req(sex())
      plotGroup(sex(), main="Clustering for sample sex assignment")
    })
    
    output$sexScaffPlot <- renderPlot({
      req(sex())
      plotScafs(sex(),ylim=c(0,2),abnormal=T, main="Sex scaffolds normalized depths per sample")
#plotScafs(sex(),ylim=c(0,2),abnormal=F, main="Sex scaffolds normalized depths per sample")
    })
    
  output$sampleScaffPlot <- renderPlot({
    req(sex())
    plotSamples(sex(),ylim=c(0,2),abnormal=TRUE, main="Per sample normalized depths in sex linked scaffolds")
  })
    
  output$sampleSexTable <- renderDataTable({
    req(sex())
    d <- makeIndTable(sex())
    #d <- data.frame(d)
    d
  })
  
  output$sexScaff <- renderDataTable({
      req(sex())
      df <- sex()$SexScaffolds
     
      d <- data.frame(`Sex Scaffolds` = df)
      names(d) <- c("Scaffold", "Length", "X_Z", "Abnormal_sex_linked","pVal", "homogametic_median", "heterogametic_median")
    d
  })
    
  output$depthsPlot <- renderPlot({
    rFilt <- filt()
    plotDepth(rFilt, main="All scaffolds that pass filters", ylim=c(0,2))
  })

  output$depthsPlotNorm <- renderPlot({
      rFilt <- filt()
    plotDepth(rFilt, main="Only normalizing scaffolds that pass filters", normOnly=TRUE)
  })
  
  ###########################################################   
  #### things below are to download the output files
  ###########################################################   
  
  output$downloadSampleSexTable <- downloadHandler(
    filename = function(){"sampleSexTable.tsv"}, 
    content = function(fname){
        d <- makeIndTable(sex())
        write.table(d, fname, sep="\t", col.names=T, row.names=F,quote=F)
    }
  )


  output$downloadScaffTable <- downloadHandler(
       filename = function(){"sexScaffTable.tsv"}, 
       content = function(fname){
           d <- data.frame(sex()$SexScaffolds)
           names(d) <- c("Scaffold", "Length", "X_Z", "Abnormal_sex_linked","pVal", "homogametic_median", "heterogametic_median")
           write.table(d, fname, sep="\t", col.names=T, row.names=F,quote=F)
    }
  )

  output$downloadSexScaff <- downloadHandler(
    filename = function(){"sexScaff.txt"}, 
    content = function(fname){
        write.table(data.frame(`Sex Scaffolds` = sex()$SexScaffolds$Name[sex()$SexScaffolds$X_Z_Scaffolds]), fname, sep="\t", col.names=F, row.names=F,quote=F)
    }
  )
  
  
  output$downloadSexScaffAbnormal <- downloadHandler(
    filename = function(){"sexLinkedAndAbnormalScaff.txt"}, 
    content = function(fname){
      write.table(data.frame(`Sex Linked and Abnormal Scaffolds` = sex()$SexScaffolds$Name[sex()$SexScaffolds$Abnormal_sex_linked_Scaffold]), fname, sep="\t", col.names=F, row.names=F,quote=F)
    }
  )
  
})

