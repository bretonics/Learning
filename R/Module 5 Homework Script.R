#Andres Breton
#Module 5 Homework Submission

#Problem 1
#a NOT REQUIRED
#b
rm(list=ls())
#Numerical Optomization
obs<-c(1.636, 0.374, 0.534, 3.015, 0.932, 0.179)
negLogLik<-function(lam) -sum(log(dexp(obs,rate=lam)))
optim(par=1,negLogLik)$par
#OR
lik<-function(lam) prod(dexp(obs,lam))
negLik<-function(lam) -lik(lam)
optim(par=1,negLik)$par

#Analytic Formula
1/mean(obs)
# c(1/mean(obs),sqrt(sum((obs-mean(obs))^2)/6))



#Problem 2
rm(list=ls())
#a NOT REQUIRED
#b
(100.8+qt(0.05, df=52)*(12.4/sqrt(53)))
# (100.8+qnorm(0.05)*(12.4/sqrt(53)))



#Problem 3
rm(list=ls())
data(golub, package="multtest")
Zyxin<-golub[2124,]
n<-length(Zyxin)
gol.fac <- factor(golub.cl,levels=0:1,labels=c("ALL","AML"))
nBoot<-1000

#a Bootstrap 95% CI
####################
# Overall, NOT ASKED
bootMeanOv<-rep(NA, nBoot)
bootVarOv<-rep(NA, nBoot)
for (i in 1:nBoot){
  dataZyxin<-Zyxin[sample(1:n, replace=TRUE)]
  bootMeanOv[i]<-mean(dataZyxin)
  bootVarOv[i]<-var(dataZyxin)
}
quantile(bootMeanOv, c(0.025,0.975)) #OVERALL Mean
quantile(bootVarOv, c(0.025,0.975)) #OVERALL Variance
####################

#ALL
ALL<- golub[2124, gol.fac=="ALL"]
lengALL<-length(ALL)
bootMeanALL<-rep(NA, nBoot)
bootVarALL<-rep(NA, nBoot)
for (i in 1:nBoot){
  dataALL<-ALL[sample(1:lengALL, replace=TRUE)]
  bootMeanALL[i]<-mean(dataALL)
  bootVarALL[i]<-var(dataALL)
}
quantile(bootMeanALL, c(0.025,0.975)) #ALL Mean
quantile(bootVarALL, c(0.025,0.975)) #ALL Variance

#AML 
AML<- golub[2124, gol.fac=="AML"]
lengAML<-length(AML)
bootMeanAML<-rep(NA, nBoot)
bootVarAML<-rep(NA, nBoot)
for (i in 1:nBoot){
  dataAML<-AML[sample(1:lengAML, replace=TRUE)]
  bootMeanAML[i]<-mean(dataAML)
  bootVarAML[i]<-var(dataAML)
}
quantile(bootMeanAML, c(0.025,0.975)) #AML Mean
quantile(bootVarAML, c(0.025,0.975)) #AML Variance

#b Parametric 95% CI
#Mean
mean(ALL)+qt(c(0.025,0.957),df=lengALL-1)*sd(ALL)/sqrt(lengALL) #CI Mean for ALL
mean(AML)+qt(c(0.025,0.957),df=lengAML-1)*sd(AML)/sqrt(lengAML) #CI Mean for AML

#Variance
((lengALL-1)*sd(ALL)^2)/qchisq(c(0.975,0.025),df=lengALL-1) #CI Variance for ALL
((lengAML-1)*sd(AML)^2)/qchisq(c(0.975,0.025),df=lengAML-1) #CI Variance for AML


#c
bootMedALL<-rep(NA, nBoot)
bootMedAML<-rep(NA, nBoot)
for (i in 1:nBoot){
  medDataALL<-ALL[sample(1:lengALL, replace=TRUE)]
  medDataAML<-AML[sample(1:lengAML, replace=TRUE)]
  bootMedALL[i]<-median(medDataALL)
  bootMedAML[i]<-median(medDataAML)
}
quantile(bootMedALL, c(0.025,0.975)) #ALL Median CI
quantile(bootMedAML, c(0.025,0.975)) #AML Median CI


#Problem 4
rm(list=ls())
nSim<-1000
n<-50
#a
sMean<-matrix(NA, nrow=nSim, ncol=2)
sVar<-matrix(NA, nrow=nSim, ncol=2)
for (i in 1:nSim){
  X<-rpois(50, lambda=0.1)
  sMean[i,]<-mean(X)+qt(c(0.05,0.95), df=n-1)*sqrt(mean(X)/n)
  sVar[i,]<-((n-1)*sd(X)^2)/qchisq(c(0.95,0.05),df=n-1)
}
mean((sMean[,1]<0.1)&(0.1<sMean[,2])) #Proportion of CI of Mean
mean((sVar[,1]<0.1)&(0.1<sVar[,2])) #Proportion of CI of Variance
  
#b
sMeanMatrix_0.1<-matrix(NA, nrow=nSim, ncol=2)
sMeanMatrix_1<-matrix(NA, nrow=nSim, ncol=2)
sMeanMatrix_10<-matrix(NA, nrow=nSim, ncol=2)
sVarMatrix_0.1<-matrix(NA, nrow=nSim, ncol=2)
sVarMatrix_1<-matrix(NA, nrow=nSim, ncol=2)
sVarMatrix_10<-matrix(NA, nrow=nSim, ncol=2)
for (i in 1:nSim){
  X_0.1<-rpois(50, lambda=0.1)
  X_1<-rpois(50, lambda=1)
  X_10<-rpois(50, lambda=10)
  sMeanMatrix_0.1[i,]<-mean(X_0.1)+qt(c(0.05,0.95), df=n-1)*sqrt(mean(X_0.1)/n)
  sMeanMatrix_1[i,]<-mean(X_1)+qt(c(0.05,0.95), df=n-1)*sqrt(mean(X_1)/n)
  sMeanMatrix_10[i,]<-mean(X_10)+qt(c(0.05,0.95), df=n-1)*sqrt(mean(X_10)/n)
  sVarMatrix_0.1[i,]<-(n-1)*sd(X_0.1)^2/(qchisq(c(0.95,0.05),df=n-1))
  sVarMatrix_1[i,]<-(n-1)*sd(X_1)^2/(qchisq(c(0.95,0.05),df=n-1))
  sVarMatrix_10[i,]<-(n-1)*sd(X_10)^2/(qchisq(c(0.95,0.05),df=n-1))
}
mean((sMeanMatrix_0.1[,1]<0.1)&(0.1<sMeanMatrix_0.1[,2])) #Proportion of CI of Mean, Paramater 0.1
mean((sMeanMatrix_1[,1]<1)&(1<sMeanMatrix_1[,2])) #Proportion of CI of Mean, Paramater 1
mean((sMeanMatrix_10[,1]<10)&(10<sMeanMatrix_10[,2])) #Proportion of CI of Mean, Paramater 10

mean((sVarMatrix_0.1[,1]<0.1)&(0.1<sVarMatrix_0.1[,2])) #Proportion of CI of Variance, Paramater 0.1
mean((sVarMatrix_1[,1]<1)&(1<sVarMatrix_1[,2])) #Proportion of CI of Variance, Paramater 1
mean((sVarMatrix_10[,1]<10)&(10<sVarMatrix_10[,2])) #Proportion of CI of Variance, Paramater 10