#Andres Breton
#Module 7 Homework Submission

#Problem 1
rm(list=ls())
library(ALL);data(ALL)

#a
ALLBs<-ALL[,ALL$BT %in% c("B","B1","B2","B3","B4")] #patient stages
exprsVals<-exprs(ALLBs)["109_at",]  #gene expression vals for 109_at
anova(lm(exprsVals~ALLBs$BT)) #ANOVA test, group indicator in ALLBs$BT

#b
group<-as.factor(c("B","B1","B2","B3","B4"))
summary(lm(exprsVals~ALLBs$BT -1))

#c
pairwise.t.test(exprsVals,ALLBs$BT,p.adjust.method="fdr")
# summary(lm(exprsVals~ALLBs$BT))

#d
pairwise.t.test(exprsVals,ALLBs$BT,p.adjust.method="fdr")

#e
shapiro.test(residuals(lm(exprsVals~ALLBs$BT))) #Test normality
install.packages("lmtest")
library(lmtest)
bptest(lm(exprsVals~ALLBs$BT), studentize=F)  #Homoscedasticity test

# kruskal.test(exprsVals~ALLBs$BT)  #Test for non-normal distributed
# oneway.test(exprsVals~ALLBs$BT)  #Test for non-equal variances


#Problem 2
rm(list=ls())
library(ALL);data(ALL)
ALLBs<-ALL[,ALL$BT %in% c("B","B1","B2","B3","B4")] #patient stages
exprsVals<-apply(exprs(ALLBs),1, function(x) kruskal.test(x~ALLBs$BT)$p.value)

#a
fdr<-p.adjust(p=exprsVals, method="fdr")
sum(fdr<0.05)

#b
sort(fdr)[1:5]


#Problem 3
rm(list=ls())
library(ALL);data(ALL)
#a
ALLBs<-ALL[,which (ALL$BT %in% c("B1","B2","B3","B4") & ALL$sex %in% c("M", "F"))] #selected patients
exprsVals<-exprs(ALLBs)["38555_at",]  #gene expression vals for 38555_at
stages<-ALLBs$BT #Disease stages
gender<-ALLBs$sex #Patient gender
anova(lm(exprsVals~stages*gender))

#b
shapiro.test(residuals(lm(exprsVals~stages*gender))) #Test normality
library(lmtest)
bptest(lm(exprsVals~stages*gender), studentize=F)  #Homoscedasticity test


#Problem 4
rm(list=ls())
library(ALL);data(ALL)
#a
ANOVA<-function(ALLBs, exprsVals){
  group<-ALLBs$BT[,drop=T] #drop unused levels
  exprsLen<-length(exprsVals) #number of expressions
  groupLen<-length(group) #number

  groupMeans<-by(exprsVals,group,mean) #sample group means
  groupMeansLen<-length(groupMeans) #number of groups
  muHat<-function(g) 1/g*sum(groupMeans[1:groupMeansLen])
  testStats<-function(g) (1/(g-1))*sum((groupMeans[1:groupMeansLen]-muHat(g))^2)
  print(obs<-testStats(groupMeansLen)) #observed statistics

  nPerms<-2000
  permMuHat<-rep(NA, nPerms)
  perms<-rep(NA, nPerms)
  for(i in 1:nPerms){
    data<-sample(exprsVals, exprsLen, replace=F)
    permGroupMeans<-by(data,group,mean)
    permMuHat<-function(g) 1/g*sum(permGroupMeans[1:groupMeansLen])
    permTestStats<-function(g) (1/(g-1))*sum((permGroupMeans[1:groupMeansLen]-permMuHat(g))^2)
    perms[i]<-permTestStats(groupMeansLen)
  }
  mean(perms>=obs) #pval
}

#b
ALLBs<-ALL[,ALL$BT %in% c("B1","B2","B3")] #patient stages
exprsVals<-exprs(ALLBs)["1242_at",] #expression vals for 1242_at
ANOVA(ALLBs,exprsVals)
