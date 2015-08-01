#Andres Breton
#Module 7 Homework Submission

#Problem 1
rm(list=ls())
#a
data(golub, package="multtest")
gol.fac<-factor(golub.cl,levels=0:1, labels= c("ALL","AML"))
pVals= rep(NA, 3051)
for(i in 1:3051){
  pVals[i]<-(wilcox.test(golub[i,]~gol.fac, paired=F, alternative="greater")$p.value)
}
fdr<-p.adjust(p=pVals, method="fdr")
sum(fdr<0.05)

#b
golub.gnames[order(pVals)[1:3],][,2] #Top 3 genes, original p-values
golub.gnames[order(fdr)[1:3],][,2] #Top 3 genes, FRD correction
ALL<-apply(golub[,gol.fac=="ALL"],1,mean)
AML<-apply(golub[,gol.fac=="AML"],1,mean)
golub.gnames[order(abs(ALL-AML), decreasing=T)[1:3],][,2] #Largest mean differed



#Problem 2
rm(list=ls())
data(golub, package="multtest")
gol.fac<-factor(golub.cl,levels=0:1, labels= c("ALL","AML"))
shapiro= rep(NA, 3051)
for(i in 1:3051){
  shapiro[i]<-(shapiro.test(golub[i, gol.fac=="AML"])$p.value)
}
fdr<-p.adjust(p=shapiro, method="fdr")
sum(fdr<0.05)



#Problem 3
rm(list=ls())
data(golub, package="multtest")
gol.fac<-factor(golub.cl,levels=0:1, labels= c("ALL","AML"))
wilcox.test(x=golub[grep("HOXA9 Homeo box A9",golub.gnames[,2]),gol.fac=="ALL"], y=golub[grep("CD33",golub.gnames[,2]),gol.fac=="ALL"], paired=T, alternative="two.sided")

# HOXA9<-golub[grep("HOXA9 Homeo box A9",golub.gnames[,2]),gol.fac=="ALL"]
# CD33<-golub[grep("CD33",golub.gnames[,2]),gol.fac=="ALL"]
# wilcox.test(x=HOXA9, y=CD33, paired=T, alternative="two.sided")
# diff<-golub[grep("HOXA9 Homeo box A9",golub.gnames[,2]),gol.fac=="ALL"]-golub[grep("CD33",golub.gnames[,2]),gol.fac=="ALL"]
# binom.test(x=sum(diff>0), n=length(diff), p=0.5, alternative="two.sided")



#Problem 4
rm(list=ls())
for(i in 1:6){
  print(fisher.test(UCBAdmissions[,,i]))
}
# chisq.test(UCBAdmissions)

#fisher preferred because exact, chisq is asymptotic needs big N

#Problem 5
rm(list=ls())
data(golub, package="multtest")
gol.fac<-factor(golub.cl,levels=0:1, labels= c("ALL","AML"))
data<-golub[808,]
n<-length(data)
obs<-abs((sd(data[gol.fac=="ALL"]))^2/(sd(data[gol.fac=="AML"]))^2)

nPerm<-2000
perm<-rep(NA, nPerm)
for(i in 1:nPerm){
  permData<-sample(data, n, replace=F)
  perm[i]<-abs((sd(permData[gol.fac=="ALL"]))^2/(sd(permData[gol.fac=="AML"]))^2)
}
mean(perm<obs) #p-value
