#Andres Breton

#Problem 1
rm(list = ls())
data(golub, package="multtest")
CCND3<-grep("CCND3 Cyclin D3",golub.gnames[,2])
CCND3exp<-golub[CCND3,]
factors<-factor(golub.cl,levels=0:1, labels=c("ALL","AML"))

#(a)
singleClust<-hclust(dist(CCND3exp, method="eucl"), method="single")
wardClust<-hclust(dist(CCND3exp, method="eucl"), method="ward.D2")

par(mfrow=c(1,2))
plot(singleClust,labels=factors) #Single linkage dendrogram
rect.hclust(singleClust, k=2)

plot(wardClust,labels=factors) #Ward linkage dendrogram
rect.hclust(wardClust, k=2)

table(factors,cutree(singleClust, k=2))
table(factors,cutree(wardClust, k=2))

#(b)
kmeansClust<-kmeans(CCND3exp,centers=2)
table(factors,kmeansClust$cluster)
# plot(CCND3exp,col=kmeansClust$cluster,pch="+")

#(c)

#(d)
print(initClustMeans<-kmeansClust$centers)
n<-length(CCND3exp); nBoot<-1000
kMeansBoot<-matrix(NA, nrow=nBoot, ncol=2)
for(i in 1:nBoot) {
  data<-CCND3exp[sample(1:n,replace=TRUE)]
  clust<-kmeans(data, initClustMeans, nstart=10)
  kMeansBoot[i,]<-clust$centers[,1]
}
apply(kMeansBoot,2,mean)
quantile(kMeansBoot[,1],c(0.025,0.975))
quantile(kMeansBoot[,2],c(0.025,0.975))

#(e)
K<-1:30
SSE<-rep(NA,length(K))
for(k in K) {
  SSE[k]<-kmeans(CCND3exp, centers=k, nstart=10)$tot.withinss
}
plot(K, SSE, type="o", xaxt="n"); axis(1, at=K, las=2)



#Problem 2
rm(list = ls())
data(golub, package="multtest")
factors<-factor(golub.cl,levels=0:1, labels=c("ALL","AML"))

#(a)
oncogenes<-grep("oncogene",golub.gnames[,2])
antigens<-grep("antigen",golub.gnames[,2])
selected<-rbind((golub[oncogenes,]),(golub[antigens,]))

#(b)
kMeansSelected<-kmeans(selected,centers=2)
indicator<-c(rep("Oncogene",length(oncogenes)),rep("Antigen",length(antigens)))
kMeansSelectedTable<-table(indicator,kMeansSelected$cluster) #compare cluster analysis w/ corresponding gene numbers
kMeansSelectedTable

library(cluster)
kMedSelected<-pam(selected,k=2)
kMedSelectedTable<-table(indicator,kMedSelected$cluster) #compare cluster analysis w/ groups, oncogenes or antigens 
kMedSelectedTable

#(c)
fisher.test(kMeansSelectedTable) #Test null hypothesis of marginal independence for K-Means
fisher.test(kMedSelectedTable) #Test null hypothesis of marginal independence for K-Means
# chisq.test(kMeansSelectedTable)
# chisq.test(kMedSelectedTable)


#(d)
singleEuclDendo<-hclust(dist(selected,method="eucl"),method="single")
completeEuclDendo<-hclust(dist(selected,method="eucl"),method="complete")

indicator<-c(rep("O",length(oncogenes)),rep("A",length(antigens))) #same as above, allows better graph
plot(singleEuclDendo, labels=indicator, main="Single Linkage Cluster")
legend("topright",legend=c("Oncogene","Antigen"),pch=c("O","A"))
plot(completeEuclDendo, labels=indicator, main="Complete Linkage Cluster")
legend("topright",legend=c("Oncogene","Antigen"),pch=c("O","A"))



#Problem 3
rm(list = ls())
# install.packages('ISLR')
library(ISLR)
nciData<-NCI60$data
nciLabs<-NCI60$labs

#(a)
K<-1:30
SSE<-rep(NA,length(K))
for(k in K) {
  SSE[k]<-kmeans(nciData, centers=k, nstart=10)$tot.withinss
}
plot(K, SSE, type="o", xaxt="n"); axis(1, at=K, las=2)


#(b)
library(cluster)
table(nciLabs,pam(as.dist(1-cor(t(nciData))),k=7)$cluster)



