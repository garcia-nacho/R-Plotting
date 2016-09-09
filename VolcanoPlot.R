#VolcanoPlot by Nacho Garcia
#2016
#garcia.nacho@gmail.com

#This script allows to represent mass-spectrometry data using a volcano plot  

library(calibrate)


#Defining cutoffs and genes
#pCO = pValue cuttoff
#diffCO = difference cutoff (log)
#GoI = list of genes of insterest to be identifed even though they don't reach the cutoffs
#GoNI = list of genes of No interest to be suppresed of the plot even though they reach the cutoff (noise genes)
#nGoI = number of genes of interest 

pCO=.5
diffCO=0.5
GoI <- c("GEN1","GEN2")
GoNI<- c("GEN3","GEN4")



#Reading the file
i=0
res <- read.table("Example.txt", header=TRUE)
head(res)

# Drawing the plot
with(res, plot(difference, -log10(pvalue), pch=19, main="Volcano plot", xlim=c(-2,2)))

# Adding colored points
#with(subset(res, pvalue<pCO), points(difference, -log10(pvalue), pch=20, col="red"))
#with(subset(res, abs(difference)>diffCO), points(difference, -log10(pvalue), pch=20, col="orange"))
#with(subset(res, pvalue<pCO & difference>diffCO), points(difference, -log10(pvalue), pch=20, col="green"))
with(subset(res, pvalue<pCO & abs(difference)>diffCO), points(difference, -log10(pvalue), pch=20, col="green"))

# Labeling points

#print (subset(res, pvalue<pCO & abs(difference)>diffCO))
#with (subset(res, pvalue<pCO & difference>diffCO), textxy(difference, -log10(pvalue), labs=Gene, cex=.8))

res<-res[!res$Gene %in% GoNI,]
with (subset(res, pvalue<pCO & abs(difference)>diffCO), textxy(difference, -log10(pvalue), labs=Gene, cex=.8))



for (i in 1:length(GoI){
with(subset(res, Gene==GoI[i]), points(difference, -log10(pvalue), pch=4, col="blue"))
with(subset(res, Gene==GoI[i]), textxy(difference, -log10(pvalue), labs=Gene, cex=.8, col="blue"))}
