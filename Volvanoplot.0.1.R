#VolcanoPlot.2 by NachoGarcia
#garcia.nacho@gmail.com

#Define vertical and horizontal lines
Vlimit<<-c(0.4)
Hlimit<<-c(0.45)

border <- function(x){
  (Hlimit*x^2)/(x^2-Vlimit)
}


library(calibrate)

#Defining cutoffs and genes
pCO=.5
diffCO=0.65
GoI <- c("")
GoNI<- c("")
nGoI<-length(GoI)


#Reading the file
i=0
res <- read.table("datafile.txt", header=TRUE)
head(res)

# Drawing the plot
with(res, plot(difference, -log10(pvalue), pch=21,  col="black", bg="black", main="Volcano plot", xlim=c(-2,2)))
# Drawing the limits

plot(border,0.65,2.5, add=TRUE, col="red")
plot(border,-2.5,-0.65, add=TRUE, col="red")

# Adding colored points
res<-res[!res$Gene %in% GoNI,]
with(subset(res, pvalue<pCO & abs(difference)>diffCO), points(difference, -log10(pvalue), pch=21, col="black", bg="chartreuse2"))

# Labeling points
with (subset(res, pvalue<pCO & abs(difference)>diffCO), textxy(difference, -log10(pvalue), labs=Gene, cex=.8))

for (i in 1:nGoI){
  with(subset(res, Gene==GoI[i]), points(difference, -log10(pvalue), pch=4, col="blue"))
  with(subset(res, Gene==GoI[i]), textxy(difference, -log10(pvalue), labs=Gene, cex=.8, col="blue"))}
