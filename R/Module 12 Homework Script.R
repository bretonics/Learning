#Andres Breton

#Problem 1
rm(list = ls())

#(a)
library(ALL); data(ALL)
ALL.fac<-c(rep(2,sum(ALL$BT %in% c("B","B1","B2","B3","B4"))),rep(1,sum(ALL$BT %in% c("T","T1","T2","T3","T4"))))

#(b)
exprsVals<-exprs(ALL)
par(mfrow=c(1,3))
for(i in 1:3){
  hist(exprsVals[i,], main=paste(row.names(exprsVals)[i]), xlab="Expressions")
}

#(c)
pairs(t(exprsVals[1:5,]), col=ALL.fac)

#(d)
# install.packages("scatterplot3d")
require(scatterplot3d)
geneNums<-c(which(row.names(exprsVals)=="39317_at"), which(row.names(exprsVals)=="32649_at"), which(row.names(exprsVals)=="481_at"))
genes<-data.frame(exprsVals[geneNums,]); row.names(genes)<-paste(row.names(exprsVals[geneNums,]))
genes<-t(genes)
scatterplot3d(genes, color=ALL.fac)

#(e))
kmeans2<-kmeans(genes,center=2)
table(ALL.fac,kmeans2$cluster)

kmeans3<-kmeans(genes,center=3)
table(ALL.fac,kmeans3$cluster)

#(f)
PCA<-prcomp(exprsVals, scale=TRUE)
PCsdev<-summary(PCA)$sdev[1:2] #sdev for PC1 & PC2
propVar<-(PCsdev)^2/sum(PCA$sdev^2) #proportion of variance = sdev^2
propVar #proportion of variance for PC1 & PC2

summary(PCA)$importance[,1:2]

#(g)
biplot(PCA, cex=0.5)
print(PCA$rotation[,1:2], digits=3) #Loadings

#(h)
i<-order(PCA$x[,2]) 
d<-order(PCA$x[,2], decreasing=TRUE) 
print(smallest<-row.names(exprsVals)[i[1:3]]) #3 smallest loadings
print(biggest<-row.names(exprsVals)[d[1:3]]) #3 biggest loadings

#(i)
annotation(ALL)
library(hgu95av2.db); library(annotate)

#Biggest PCA2
get(biggest[1], env=hgu95av2GENENAME) #Gene Name
get(biggest[1], env=hgu95av2CHRLOC) #Chromosome

#Smallest PCA2
get(smallest[1], env=hgu95av2GENENAME) #Gene Name
get(smallest[1], env=hgu95av2CHRLOC) #Chromosome



#Problem 2
rm(list = ls())

#(a)
irisData<-iris[,1:4]
scaled<-scale(irisData, scale=TRUE, center=TRUE) #scaled data set mean zero and variance one
        #or use apply(irisData, 2, function(x)  (x-mean(x)/sd(x))()

#(b)
cor(irisData) #unscaled
cor(scaled) #scaled

#(c)
dist(t(scaled),method="eucl")
Edist<-as.vector(dist(t(scaled),method="eucl"))
Edist^2/as.vector(as.dist(1-cor(scaled)))

#(d)
print(scaledPCA<-prcomp(scaled, scale=FALSE))
print(unscaledPCA<-prcomp(irisData, scale=FALSE))


#(e)

#Scaled
PCsdev<-summary(scaledPCA)$sdev[1:2] #sdev for PC1 & PC2
print(scaledPropVar<-(PCsdev)^2/sum(scaledPCA$sdev^2)) #proportion of variance = sdev^2
# -OR-
summary(scaledPCA)$importance[2,1:2]

#Unscaled
unPCsdev<-summary(unscaledPCA)$sdev[1:2] #sdev for PC1 & PC2
print(unPropVar<-(unPCsdev)^2/sum(unscaledPCA$sdev^2)) #proportion of variance = sdev^2
# -OR-
summary(unscaledPCA)

#(f)
cols<-ncol(scaled); rows<-nrow(scaled); nBoot<-1000
propVar<-array(dim=c(nBoot,cols))
for(i in 1:nBoot){
  bootData<-scaled[sample(1:rows,replace=TRUE),]
  propVar[i,]<-(prcomp(bootData)$sdev)^2/sum((prcomp(bootData)$sdev)^2)
  # propVar[i,]<-summary(prcompr(bootData, scale=T))$importance[2,]
}
quantile(propVar[,2], c(0.05,0.95))
scaledPropVar[2] #PC2 proportion of variance

