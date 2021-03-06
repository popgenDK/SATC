
library(shiny)
library(markdown, lib.loc="/home/genis/R/x86_64-pc-linux-gnu-library/3.2")
library(xfun, lib.loc="/home/genis/R/x86_64-pc-linux-gnu-library/3.2")


shinyUI(fluidPage(

    # Application title
    titlePanel("SATC: Sex Assignment Through Coverage"),

    # Sidebar with a slider for different input 
    sidebarLayout(
        sidebarPanel(
            fileInput("idxstats_file", "Upload your input file (see Usage tab on how to make it)"),
        
            #actionButton("load", label="Load data"),
            helpText('Test file (right click):', a("leopard idxes", href="http://pontus.popgen.dk/albrecht/open/tmp2.idxes")),
            actionButton("run", label="Run SATC"),
            helpText("After running SATC you can download the output:"),
            
            downloadButton("downloadSampleSexTable", "Table of assigned sex per sample"),
            downloadButton("downloadScaffTable", "Table of depth and assigned sex per scaffold"),
            downloadButton("downloadSexScaff", "List of sex scaffolds"),
            downloadButton("downloadSexScaffAbnormal", "List of sex linked and abnormal scaffolds"),
            
            helpText("Optional arguments (ignore to run with default values):"),
            #fileInput("sample_names", "Upload file with sample IDs:"),
            radioButtons("model", h5("Choose clustering model"),
                         choices = list("Gaussian" = "gaussian", "Hierarchical" = "hclust")),
            radioButtons("useMedian", h5("Choose what normalization is based on"), choices= list("Mean" = FALSE, "Median" = TRUE)),
            numericInput("M", h5("Choose M (number of scaffolds used for normalization)"), value=5),
            numericInput("K", h5("Choose K (number of PCs used for clustering)"), value=2),
            numericInput("minLength", h5("Set minimum length of scaffolds to include"),
                         value = 1e5),
                  uiOutput('chooseScaf'),
                        uiOutput('chooseInd')
      

         #   textInput("normScaffolds", h5("List of scaffold names to use for normalization (separated by \",\"; overwrittes M, default is empty)"), value=NULL)
        ),

        mainPanel(
            tabsetPanel(
            #textOutput("text")
                #plotOutput("pcaPlot")
                tabPanel("Usage", includeMarkdown("README.md")),
                tabPanel("Individuals", h1("histogram of #reads"),  plotOutput("plotInd"),dataTableOutput("tableInd")),
                tabPanel("Normalized depths plot", plotOutput("depthsPlot"), plotOutput("depthsPlotNorm", click="depth_norm_click")),
                tabPanel("Sex assignment plots", h1("press Run SATC to update"), plotOutput("pcaPlot"), plotOutput("sexScaffPlot"), plotOutput("sampleScaffPlot")),
                tabPanel("Sample sex table", h1("press Run SATC to update"), dataTableOutput("sampleSexTable")),
                tabPanel("Sex scaffolds", h1("press Run SATC to update"),  dataTableOutput("sexScaff"))
         #   tabPanel("make input file", h1("how to make the input file"),  verbatimTextOutput("text")),
         #   tabPanel("Sex linked and abnormal scaffolds", tableOutput("sexScaffAbnormal")),
           
            
        ))
    )
))

