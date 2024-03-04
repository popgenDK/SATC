# SATC
**S**ex **A**ssignment **T**hrough **C**overage

Framework for joint determination of individual sex and sex-linked scaffolds for non-model organism based on depth of coverage (DoC). Our method assign individual sex by projecting sequencing depth of the samples to a two dimensional Principal Component Analysis plot followed by Gaussian mixture clustering. Jointly sex-linked scaffolds are identified based on differences in male and female read depth by a two-sample t-test.

SATC works following these steps:

1. Normalizing the depth of each scaffold within each sample
2. Reducing the dimensionality of the normalized depths using PCA
3. Clustering the samples using Gaussian mixtures clustering on the top PCs, 
4. Identifying the sample sex and sex-linked scaffolds from the clustering and the DoC. 


<p align="center" width="100%">
    <img width="100%" src="https://github.com/popgenDK/SATC/blob/9c6724e6ca4f0357d0891166d4b1008ea6720819/examples/plots/leo_PCA_and_boxplot.png">
</p>

# Using SATC
SATC is just a set of R functions. You can use SATC in R, in an interactive shiny app or run it from the command line. The depth of coverage information can quickly be calculated from index bam files e.g. 

```bash
samtools idxstats myFile.bam > myFile.idxstats
```

## GUI implementation

We have implemented a Graphical User Interface (GUI) version of SATC as a shiny app, where you can upload your data, interactively run the analyses and download the output:

[Link to SATC shiny](https://popgen.dk/shiny/genis/satc/)

You can find more information on how to run SATC in shiny inside the app.

## Running in R
```
## source the R functions 
source("https://raw.githubusercontent.com/popgenDK/SATC/main/satcFunc.R")

## use the mclust library. Install if needed (install.package("mclust"))
library(mclust)

## read list of filenames
IDXFILE <- "https://raw.githubusercontent.com/popgenDK/SATC/main/examples/gitpathLeopard.txt"
filenames <- scan(IDXFILE,what="sUp")

## read idx files
idx <- lapply(filenames,read.table,as.is=T)
names(idx) <- basename(filenames)

## Filter scafoolds (min 100kb ) and normalize using the M longest scaffold 
rFilt <- filterScaffold(dat=idx,minLength=1e5,M=5)

##plot normalized depth
plotDepth(rFilt) ##all scaffs
plotDepth(rFilt,normOnly=TRUE) ##scaffolds used for normalization (look for outliers)

## identify sex and sex scaffolds
sex <- sexDetermine(dat=rFilt, K=2, model="gaussian") 

## plot the clustering
plotGroup(sex)

## plot the scaffolds depths stratificed by inferred sex including the (abnormal) scaffolds
plotScafs(sex,abnormal=T)

## plot the sex scaffolds' normalized depth for each individuals
plotSamples(sex)

## visialized the gausian mixtures
plotUnc(sex)

## See the inferred status of each scaffold
 head(sex$SexScaffolds)
 
## See the inferred sex of each indiviual
head(cbind(names(idx),sex$sex))
```


## Run from the terminal
### Get SATC R code and example files
```bash
git clone https://github.com/popgenDK/SATC
cd SATC/
```

### Install dependencies
The required R package (mclust) can be easily installed, we have already included an automatic install code in our main function if needed.

## Usage

SATC is run by executing the main function file satc.R:
```bash
Rscript --vanilla satc.R -i <idxfiles list> -o <prefix for output files>
```

All arguments and options are:
```
	Required arguments:


		-i --input:  Path to file with paths to idxstat files

		-o --output:  Prefix for output files


	Optional arguments:


		--K:  Number of principal components used for clustering (default 2)

		--model:  Use gaussian clustering "gaussian" or hierarchical clustering "hclust" (default "gaussian")

		--minLength:  Minimum length of scaffolds to include, in bp (default 1e5)

		--M:  Number of scaffolds used for normalization (default 5)

		--normScaffolds:  Path to file with list of scaffolds to use for normalization; overwrites M (defualt NULL)

		--useMedian:  Use median depth of coverage of selected scaffolds for normalization instead of mean (default FALSE)

		-h:  Print help and exit
```

The main output of SATC are two tables:

- \*\_sampleSex.tsv: contains information on assigned sex for each sample and the normalized depths the inference is based on.
- \*\_scaffSex.tsv: contains information for each scaffold whether it is inferred to be and XZ chromsome and/or sex linked scaffold, the p value measuring significance of the difference between the two inferred sexes, and the median normalized depth of the scaffold in each inferred sex.

Furthermore, SATC also produces two plots in png format: 

- \*\_depth.png: plot of normalized depths.
- \*\_PCA_and_boxplot.png:  plots showing the PCA the sex assignment is based on and the distribution of normalized depths for each inferred sex of each sex linked scaffold).

And two lists:

- \*\_sexlinked_scaff.list: list of abnormal sex-linked scaffolds with depth difference consistent with being XZ chrosomome.
- \*\_XZ_scaff.list: a list of sex linked scaffolds.

and

- \*.sexSamples_sexScaffolds.rds: an R data object in (.rds) format conaining an R list with the data produced by SATC. 



## Example Usage from command line

Below is an example of performing SATC on our leopard data:
```bash
Rscript --vanilla satc.R -i examples/leo_idxstats_path.txt -o leo
```

By running SATC, it will automatically produced two plots (normalized depth plot, PCA and Sex-linked Scaffolds) in png format.

For example, here's a normalized depth plot of leopard dataset:
<p align="center" width="100%">
    <img width="50%" src="https://github.com/popgenDK/SATC/blob/6f919613ed9765ef108bcdb63a37d18c9f3e7ae7/examples/plots/leo_depth.png"> 
</p>

Also PCA plot and boxplot of Sex-linked Scaffolds:
<p align="center" width="100%">
    <img width="100%" src="https://github.com/popgenDK/SATC/blob/9c6724e6ca4f0357d0891166d4b1008ea6720819/examples/plots/leo_PCA_and_boxplot.png">
</p>

SATC can also run fully in R (see example above in **Running in R**). 


## Citation
Please cite our papers:

 Nursyifa, C., Brüniche-Olsen, A., Garcia-Erill, G., Heller, R., & Albrechtsen, A. (2021). Joint identification of sex and sex-linked scaffolds in non-model organisms using low depth sequencing data. Molecular Ecology Resources, 00, 1– 10. https://doi.org/10.1111/1755-0998.13491 
