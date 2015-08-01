#Andres Breton
#Module 6 Homework Submission

#Problem 1
rm(list=ls())
data(golub, package="multtest")
gol.fac <- factor(golub.cl,levels=0:1,labels=c("ALL","AML"))

#a
t.test(golub[2972,gol.fac=="ALL"],mu=-1, alternative="greater")

#b
t.test(golub[2972,]~gol.fac)

#c
t.test(golub[2972,gol.fac=="ALL"], golub[2989,gol.fac=="ALL"], paired=T, alternative="less") #Paired
  # t.test(golub[2972,gol.fac=="ALL"], golub[2989,]) #Unpaired

#d
binom.test(x=sum(golub[2972,gol.fac=="ALL"]<golub[2989,gol.fac=="ALL"]), n=length(golub[2972,gol.fac=="ALL"]), p=0.5, alternative="greater")

#e
binom.test(x=sum(golub[2972,gol.fac=="ALL"]>-0.5), n=length(golub[2972,gol.fac=="ALL"]), p=0.5, alternative="less")
# prop.test(x=length(golub[2972,gol.fac=="ALL"]), n=length(golub[2972,]), p=0.5, alternative="two.sided")

#f
prop.test(x=c(sum(golub[2972,gol.fac=="ALL"]>-0.5),sum(golub[2972,gol.fac=="AML"]>-0.5)), n=c(length(golub[2972,gol.fac=="ALL"]), length(golub[2972,gol.fac=="AML"])), alternative="two.sided")
# prop.test(x=c(length(golub[2972,gol.fac=="ALL"]),length(golub[2972,gol.fac=="AML"])), n=c(length(golub[2972,]),length(golub[2972,])), alternative="two.sided")


#Problem 2
rm(list=ls())
pbinom(19, size=1000, prob=0.05)


#Problem 3
rm(list=ls())
n<-20
sim<-matrix(rnorm(10000*n, mean=5, sd=4), ncol=n)
tstat<-function(x) (mean(x)-3)/sd(x)*sqrt(n)
tstatSim<-apply(sim,1,tstat) #Calculate t-test statistic for each data set
power<-mean((tstatSim>qt(0.3,df=n-1))&(tstatSim<qt(0.4,df=n-1))) #Calculate the rejection rate
power+c(-1,0,1)*qnorm(0.975)*sqrt(power*(1-power)/10000)


# xSim<-matrix(rnorm(10000*n), ncol=n) #generate data sets (truemean=0)
# xMean<-apply(xSim,1,mean) #Find sample mean for each data set
# xSd<-apply(xSim,1,sd) #Find sample sd for each data set
# t0<-(xMean-3)/xSd*sqrt(n) #Find t-test statistic for each data set
# muVals<-seq(3,5,by=0.01) #mu values where power will be calculated
# power<-rep(NA, length(muVals))
# for (i in 1:length(muVals)) {
#   #Calculate power at all mu values
#   power[i]<-mean((t0+muVals[i]/xSd*sqrt(n))>qt(0.95,df=n-1))
#   ￼}
# #Draw the power curve
# plot(muVals,power,type='l', ylim=c(0,1), xlab=expression(mu),
#      ylab="power",col='red')
# #Draw the 95% confidence bounds
# ci.lim<-qnorm(0.975)*sqrt(power*(1-power)/10000)
# lines(muVals,power+ci.lim,lty=2)
# lines(muVals,power-ci.lim,lty=2)
# ￼#Compare to real power from power.t.test
# ￼lines(mVals,power.t.test(n=10,delta=(uValss-3),sig.level=0.05,￼type='one.sample', alternative ='one.sided')$power, col='green')


#Problem 4
rm(list=ls())
data(golub, package="multtest")
gol.fac <- factor(golub.cl,levels=0:1,labels=c("ALL","AML"))
# t.test(golub[, gol.fac=="ALL"], golub[, gol.fac=="AML"])

pVals <- apply(golub, 1, function(x) t.test(x~gol.fac)$p.value)
bonf <-p.adjust(p=pVals, method="bonferroni")
fdr <-p.adjust(p=pVals, method="fdr")
sum(pVals<0.05)
sum(bonf<0.05) #Bonferroni adjustment at 0.05 level
sum(fdr<0.05) #FDR adjustment at 0.05 level

minPvals<-which(pVals %in% sort(pVals)[1:3])
golub.gnames[which(pVals %in% sort(pVals)[1:3]),][,2]


#Problem 5
rm(list=ls())
#a
wald<-function(n,p,a=0.05){
  q=1-p 
  p+cbind(-1,1)*qnorm(1-a/2)*sqrt(n^-1)*sqrt(p*q)
} 

wilson<-function(n,p,a=0.05){
  x=p*n
  q=1-p
  k=qnorm(1-a/2)
  (((x+k^2)/2)/n+k^2)+cbind(-1,1)*(k*sqrt(n)/n+k^2)*sqrt((p*q+k^2/(4*n)))
}

agresti<-function(n,p,a=0.05){
  q=1-p
  k=qnorm(1-a/2)
  p+cbind(-1,1)*k*sqrt(p*q)*sqrt(n^-1)
}

#b
rm(list=ls())
n<-40
p<-0.2
nSim<-10000
waldCov<-rep(NA,nSim)
wilsonCov<-rep(NA,nSim)
agrestiCov<-rep(NA,nSim)
for (i in 1:nSim){
  pHat<-rbinom(1,n,prob=p)/n
  k<-qnorm(1-0.05/2)
  qHat<-1-pHat
  waldCIlower<-pHat-(k*sqrt(pHat*qHat)/sqrt(n))
  waldCIupper<-pHat+(k*sqrt(pHat*qHat)/sqrt(n))
  waldCov[i]<-((waldCIlower<p)&(p<waldCIupper))
  wilsons<-(pHat*n+(k^2/2))/(n+k^2)
  wilsonSe<-(k*sqrt(n)/(n+k^2))*sqrt((pHat*qHat)+((k^2)/(4*n)))
  wilsonCIlower<-wilsons-wilsonSe
  wilsonCIupper<-wilsons+wilsonSe
  wilsonCov[i]<-((wilsonCIlower<p)&(p<wilsonCIupper))
  agrestiCIlower<-(pHat*n+k^2/2)/(n+k^2)-k*sqrt((pHat*n+k^2/2)/(n+k^2))/sqrt(n+k^2)
  agrestiCIupper<-(pHat*n+k^2/2)/(n+k^2)+k*sqrt((pHat*n+k^2/2)/(n+k^2))/sqrt(n+k^2)
  agrestiCov[i]<-((agrestiCIlower<p)&(p<agrestiCIupper))
}
mean(waldCov)
mean(wilsonCov)
mean(agrestiCov)

