#Andres Breton
#Midterm Submission

#Problem 1
rm(list=ls())
#a
xRange<-c(1:3)
f<-function(x) {2.469862*(x*exp(-x^2))}
f_x<-function(x) f(x)*(x%in% xRange)
print(EX<-sum(xRange*f_x(xRange))) #Mean
print(sdX<-sqrt(sum((xRange-EX)^2*f_x(xRange)))) #Standard Deviation

f_y<-function(y) {2*y*exp(-y^2)}
print(EY<-integrate(function(y) y*f_y(y), lower=0, upper=Inf)$value) #Mean
print(sdY<-sqrt(integrate(function(y) (y-EY)^2*f_y(y), lower=0, upper=Inf)$value)) #Standard Deviation

#b
#E(2X-3Y)
2*EX-3*EY

#sd(2X-3Y)
2*sdX-3*sdY



#Problem 2
rm(list=ls())
EX<-0
EX2<-1
EY<-4
format(round(EX2/(EX2+EY),2), nsmall=2)



#Problem 3
rm(list=ls())
p<-0.92
nSim<-1000
q<-940
1-pbinom(q=q,size=nSim,prob=p)



#Problem 4
rm(list=ls())
obs<-as.numeric(t(read.table(file = "normalData.txt", header=T)))
negLogLik<-function(theta) -sum(log(dnorm(obs, mean=theta, sd=theta)))
optim(par=1, negLogLik)$par
# c(mean(obs), sqrt(sum((obs-mean(obs))^2)/length(obs)))



#Problem 5
rm(list=ls())
data(golub, package="multtest")

#a
pVals<-apply(golub, 1, function(x) t.test(x,mu=0.6, alternative = "greater")$p.value)
sum(pVals<0.10)
fdr<-p.adjust(p=pVals, method="fdr")
sum(fdr<0.10)

# pVals<-apply(golub, 1, function(x) t.test(x)$p.value)
# sum(pVals>0.6)
# fdr<-p.adjust(p=pVals, method="fdr")
# sum(fdr>0.10)

#b
golub.gnames[order(pVals)[1:5],][,2] #Top 3 genes, original p-values
# golub.gnames[order(fdr)[1:5],][,2] #Top 3 genes, FRD correction



#Problem 6
rm(list=ls())
data(golub, package="multtest")
gol.fac <- factor(golub.cl,levels=0:1,labels=c("ALL","AML"))
GRO3<-golub[2715,]
MYC<-golub[2302,]

#a
hist(GRO3)

#b
GRO3_ALL<-golub[2715,gol.fac=="ALL"]
MYC_ALL<-golub[2302,gol.fac=="ALL"]
GRO3_AML<-golub[2715,gol.fac=="AML"]
MYC_AML<-golub[2302,gol.fac=="AML"]
plot(GRO3_ALL, MYC_ALL, col="blue", pch="+", xlab="GRO3", ylab="MYC")
points(GRO3_AML,MYC_AML,col="red")
legend("topright",c("ALL","AML"), col=c("blue","red"), pch=c("+","o"),cex=0.5,pt.cex=0.5)

#c
t.test(GRO3, MYC, paired=T, alternative="less")

#d
# install.packages("outliers")
library(outliers)
#Diagnostic Test for GRO3
  shapiro.test(GRO3)
  grubbs.test(GRO3)
#Diagnostic Test for MYC
  shapiro.test(MYC)
  grubbs.test(MYC)

#e
wilcox.test(GRO3, MYC, paired=T, alternative="less")

#f
diff<-abs(GRO3-MYC)
n<-length(diff)
nBoot<-1000
bootMed<-rep(NA, nBoot)
for(i in 1:nBoot){
  data<-diff[sample(1:n,replace=TRUE)]
  bootMed[i]<-median(data)
}
quantile(bootMed,0.95)

# nBoot<-1000
# bootMed<-rep(NA, nBoot)
# for(i in 1:nBoot){
#   dataGRO3<-GRO3[sample(1:length(GRO3), replace=TRUE)]
#   dataMYC<-MYC[sample(1:length(MYC), replace=TRUE)]
#   bootMed[i]<-((median(dataGRO3))-median(dataMYC))
# }
# quantile(bootMed,0.95)
# binom.test(x=median(diff), n=n, p=0.5, alternative="less",)


#g
bootMean<-rep(NA, nBoot)
for(i in 1:nBoot){
  data<-diff[sample(1:n,replace=TRUE)]
  bootMean[i]<-mean(data)
}
quantile(bootMean,0.95)

# bootMean<-rep(NA, nBoot)
# for(i in 1:nBoot){
#   dataGRO3<-GRO3[sample(1:length(GRO3), replace=TRUE)]
#   dataMYC<-MYC[sample(1:length(MYC), replace=TRUE)]
#   bootMean[i]<-((mean(dataGRO3))-mean(dataMYC))
# }
# quantile(bootMean,0.95)



#Problem 7
rm(list=ls())
data(golub, package="multtest")
gol.fac <- factor(golub.cl,levels=0:1,labels=c("ALL","AML"))

#a
grep("HPCA Hippocalcin",golub.gnames[,2])

#b
print(negExpALL<-mean(golub[118,gol.fac=="ALL"]<0))
# binom.test(x=sum(golub[118,gol.fac=="ALL"]<0), n=length(golub[118,gol.fac=="ALL"]), alternative="less")

#c
binom.test(x=sum(golub[118,gol.fac=="ALL"]<0), n=length(golub[118,gol.fac=="ALL"]), p=0.5, alternative="greater")

#d
valsALL<-golub[118,gol.fac=="ALL"]
valsAML<-golub[118,gol.fac=="AML"]
lenALL<-length(golub[118,gol.fac=="ALL"])
lenAML<-length(golub[118,gol.fac=="AML"])
nBoot<-1000
boot<-rep(NA, nBoot)
for(i in 1:nBoot){
  dataALL<-valsALL[sample(1:lenALL, replace=TRUE)]
  dataAML<-valsAML[sample(1:lenAML, replace=TRUE)]
  boot[i]<-((mean(dataALL<0))-mean(dataAML<0))
}
quantile(boot, c(0.025,0.975))


# binom.test(x=sum(golub[118,gol.fac=="ALL"]<0)-sum(golub[118,gol.fac=="AML"]<0), n=length(golub[118,]), alternative="two.sided")
# prop.test(x=c(mean(golub[118,gol.fac=="ALL"]<0),mean(golub[118,gol.fac=="AML"]<0)), n=c(length(golub[118,gol.fac=="ALL"]),length(golub[118,gol.fac=="AML"])), alternative="two.sided")
