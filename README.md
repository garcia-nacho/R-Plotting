# R-Plotting
Scripts to plot bioinformatical data:

VolcanoPlot.R

This script can generate volcano plots from high throughput data such as protein interactions (obtained by MS) or gene expression (obtain by RNA seq). 

The datafile.txt must look like this:

pvalue	difference	Gene
0.197206	-0.488355	GEN1
0.826091	-0.0359863	GEN2
0.100951	0.344121	GEN3

The cutoffs for difference and pvalues are defined in the script here:
pCO=.5
diffCO=0.5
Change them according to your needs. 

The search for Genes of interest allow the identification of genes on your dataset even if they don't reach the cutoffs and must be defined here:
GoI <- c("GoI1", "GoI2")

To reduce the noise the labeling of undesired genes can be removed including those genes in the Genes of no interest (GoNI) variable:
GoNI<- c("GoNI1", "GoNI2")

In the next version the cutoffs will be unified with the drawn borders

