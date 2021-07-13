# SATC (**S**ex **A**ssignment **T**hrough **C**overage) Shiny interface

This is a Shiny app to run interactively the program SATC. You can find more information and the implementation of the program (which can be run also from the command line or from R) in [github](https://github.com/popgenDK/SATC).

### Input file

You need first to upload the file with the input data, which is a table where the two first columns indicate the scaffold name and length and all remaining columns how many reads map to each scaffold for each sample (see example file in left tab).

The input file can be done from the output of the samtools idxstats tool. If you have a file with the path to all idxstats files you want to use, you can use the [make_shiny_input.sh](https://raw.githubusercontent.com/popgenDK/SATC/main/shiny/make_shiny_input.sh) bash script to generate the input file (right click on the link and select save link as to download the script):

```
bash make_shiny_input.sh <file with path to all idxstats> <name of output file>
```

Alternatively if you have all your idxstats files in the same folder and they are called with the ending .idxstats you can use the following code:

```{bash}
#identify all of the idxstat file e.g. 
FILES=`ls ~/github/SATC/examples/idx_leopard/*idxstats`
F1=`ls ~/github/SATC/examples/idx_leopard/*idxstats | head -1`

#name of output file (satc shiny input file)
OUTFILE='tmp2.idxes'

# add header to the file
echo -e -n 'scaffold len ' > $OUTFILE 
echo $FILES | xargs -n1 basename |  tr '\n' ' ' | sed 's/.idxstats//g' >> $OUTFILE
echo >> $OUTFILE

## add the nreads per individual to the file
paste <( cut -f1-2 $F1 ) <(awk '{ a[FNR] = (a[FNR] ? a[FNR] FS : "") $3 } END { for(i=1;i<=FNR;i++) print a[i] }' $FILES) >> $OUTFILE
```

### Running SATC

#### 1. Quality control of input data

Once you have uploaded you data, we recommend taking a look at the Individuals and Normalized depths plot as a first quality control step.

The Individuals tab has information on how many total mapped reads each sample has, and minimum and maximum normalized depth of each sample in the normalizing scaffolds. Here we want to make sure all samples have some amount of data.

The maximum and minimum normalizing depth of normalizing scaffolds should ideally be not too far away from 1. If is very far away from 1 it can be for too reasons: you are either using a bad scaffold for normalization, or one sample has very abnormal depths in general. The Normalized depths plot tab has visual informaiton on the normalized depth of all samples in all scaffolds and only in the normalizing scaffolds. Our focus should be in normalizing scaffolds, again we want all samples and scaffolds to be as close to 1 as possible. If some sample/s deviate a lot from 1 you can try to the identify them in the Individuals table, and use the Choose individuals in the bottom left to remove them from the analyses.

#### 2. Running SATC

To run SATC and visualize the results, use the Sex assignment plot tab.

The PCA shows the inferred grouping of samples in Heterogametic / Homogametic sexes. If the program worked we expect to see two clearly delimited clusters, where each clusters corrresponds to one of the sexes.

The boxplot of Sex scaffolds normalized depths per sample shows for each scaffold identified as sex linked its normalized depth for each group. Scaffolds to the left of the dotted vertical line are those that behave as expected for X/Z scaffolds (meaning they have ~0.5 mean difference in normalized depth between the groups) while to the right of the vertical dotted line have stastically signficiant difference in depth between the sexes but do not clearly behave as a X/Z scaffold. The boxplot of Per sample normalzied depths shows the normalized depth in sex linked scaffolds per each sample colored with its inferred sex.

If the results are not convincing you can change some of the optional argument to try to improve it.

If the results are good you can download the resulting tables and list of sex linked scaffolds.

### Citation

If you use SATC in a publication please cite our paper:

Nursyifa C, Brüniche-Olsen A, Garcia-Erill G, Heller R, Albrechtsen A. () Joint identification of sex and sex-linked scaffolds in non-model organisms using low depth sequencing data. https://doi.org/10.1101/2021.03.03.433779
