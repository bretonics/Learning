#Andres Breton
#Module 2 Homework Submission

#Problem 1
rm(list=ls())
#a)
library(multtest)
data(golub)
gol.fac <- factor(golub.cl, levels=0:1, labels = c("ALL", "AML"))
meanALL <- apply(golub[,gol.fac=="ALL"], 1, mean)
meanALL
#b)
meanAML <- apply(golub[,gol.fac=="AML"], 1, mean)
meanAML
#c)
sortedALLMean<-sort(meanALL, decreasing=TRUE)
geneALL <- vector()
geneNamesALL <- vector()
for(i in 1:3) {
  geneALL[i] <- grep(sortedALLMean[i],meanALL)
  geneNamesALL[i] <- golub.gnames[geneALL[i],][3]
}
geneNamesALL
#d)
sortedAMLMean<-sort(meanAML, decreasing=TRUE)
geneAML <- vector()
geneNamesAML <- vector()
for(i in 1:3) {
  geneAML[i] <- grep(sortedAMLMean[i],meanAML)
  geneNamesAML[i] <- golub.gnames[geneAML[i],][3]
}
geneNamesAML

#Problem 2
rm(list=ls())
#a)
data(golub)
gol.fac <- factor(golub.cl, levels=0:1, labels = c("ALL", "AML"))
write.csv(golub[1:5,gol.fac=="AML"],file="AML5.csv")
read.csv("AML5.csv")
#b)
write.table(golub[1:5,gol.fac=="ALL"], file="ALL5.txt")
read.table("ALL5.txt")
#c)
sd(golub[100:200,1])
#d)
geneSD <- apply(golub,1,sd)
length(geneSD[geneSD > 1])
#e)
gene1<-golub[101,]
gene2<-golub[102,]
plot(gene1, gene2, xlab=golub.gnames[101,][3], ylab=golub.gnames[102,][3], main="Gene Expressions", col="red")


#Problem 3
rm(list=ls())
#a)
source("http://www.bioconductor.org/biocLite.R")
biocLite
biocLite("ALL")
library(ALL)
data(ALL)
x<-exprs(ALL[,ALL$BT=="B1"])
hist(x)
#b)
meanB1<-apply(x,1,mean)
meanB1
#c)
sortMean<-sort(meanB1, decreasing=TRUE)
str(sortMean)
#--OR--
sortMean[1:3]


#Problem 4
rm(list=ls())
#a)
data(trees)
class(trees)
is.data.frame(trees)
#b)
girth<-trees[,1]
height<-trees[,2]
volume<-trees[,3]
plot(girth,height,main="Tree Data",col="blue",pch="+",ylim=c(0,90))
points(girth,volume,col="red",pch="o")
par(xpd=TRUE)
legend(5,120,c("Girth vs Height","Girth vs Volume"),col=c("blue","red"),lty=c(1,1),cex=.5,pt.cex=1)

