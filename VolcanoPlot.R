#VolcanoPlot by NachoGarcia
#ignacio.garcia.llorente@rr-research.no


#Defining cutoffs and genes
pCO=.5
diffCO=0.65
GoI <- c("")
GoNI<- c("DEF1","ESP1","RPN8","UTP1","TRI1","ESP1","ECM33","NHP2","UTP11","LSP1","RPL13A","UBC1")

nGoI=4


#Reading the file
i=0
res <- read.table("Kel1-9myc minus vs plus alpha.txt", header=TRUE)
head(res)

# Drawing the plot
with(res, plot(difference, -log10(pvalue), pch=19, main="Volcano plot", xlim=c(-2,2)))

# Adding colored points
#with(subset(res, pvalue<pCO), points(difference, -log10(pvalue), pch=20, col="red"))
#with(subset(res, abs(difference)>diffCO), points(difference, -log10(pvalue), pch=20, col="orange"))
#with(subset(res, pvalue<pCO & difference>diffCO), points(difference, -log10(pvalue), pch=20, col="green"))
with(subset(res, pvalue<pCO & abs(difference)>diffCO), points(difference, -log10(pvalue), pch=20, col="green"))

# Labeling points
library(calibrate)
#print (subset(res, pvalue<pCO & abs(difference)>diffCO))
#with (subset(res, pvalue<pCO & difference>diffCO), textxy(difference, -log10(pvalue), labs=Gene, cex=.8))

res<-res[!res$Gene %in% GoNI,]
with (subset(res, pvalue<pCO & abs(difference)>diffCO), textxy(difference, -log10(pvalue), labs=Gene, cex=.8))

#Uncomment next line to get GoI

for (i in 1:nGoI){
with(subset(res, Gene==GoI[i]), points(difference, -log10(pvalue), pch=4, col="blue"))
with(subset(res, Gene==GoI[i]), textxy(difference, -log10(pvalue), labs=Gene, cex=.8, col="blue"))}