#Andres Breton
#Module 4 Homework Submission

#Problem 1
#a #NOT REQUIERED
#b
rm(list=ls())
pnorm(5.1, mean=5, sd=sqrt(9/5))-pnorm(2, mean=5, sd=sqrt(9/5))
#Not possible, n<30

#Problem 2
rm(list=ls())
n<-20
p<-0.7
EY<-n*p
varY<-n*p*(1-p)
  #P(Y>15)
1-pnorm(15,mean=EY,sd=sqrt(varY/100))


#Problem 3
rm(list=ls())
#N(EX,EY) = (9,10)) varX=3, varY=5, covariance=2
require(mvtnorm)
prob<-c(1:1000)
for (i in 1:1000){
XY<-rmvnorm(50,mean=c(9,10),sigma=matrix(c(3,2,2,5),nrow=2))
meanXY<-apply(XY,2,mean)
prob[i]<-((meanXY[1]+0.5)<meanXY[2])
}
print(true<-mean(prob[1:1000]))
mean(prob) + c(-1,1)*1.96*sqrt(var(prob)/1000)

#Bonus
1-pnorm(0.5, mean=1, sd=sqrt(0.08))



#Problem 4
rm(list=ls())
X1<-rchisq(100000,df=10)
X2<-rgamma(100000,shape=1,scale=2)
X3<-rt(100000,df=3)
Y<-sqrt(X1)*X2+4*(X3)^2
print(mean(Y))


#Problem 5
rm(list=ls())
n<-1000
an <- sqrt(2*log(n)) - 0.5*(log(log(n))+log(4*pi))*(2*log(n))^(-1/2)
bn <- (2*log(n))^(-1/2)
e <- c(1:1000)
par(mfrow=c(1,2))
for (i in 1:n) e[i] <- (max(rnorm(1000))-an)/bn
plot(density(e),main="Density size=1000",ylim=c(0,0.5)) #Data Density
f<-function(x){exp(-x)*exp(-exp(-x))} #Extreme value function
curve(f,range(density(e)$x),add=TRUE,col = "blue") #Extreme
curve(dnorm,add=TRUE,col = "red") #Normal

for (i in 1:n) e[i] <- (max(rnorm(n))-an)/bn
plot(density(e),main="Density size=1000",ylim=c(0,0.5),xlim=c(-4,8)) #Data Density
f<-function(x){exp(-x)*exp(-exp(-x))} #Extreme value function
curve(f,add=TRUE,col = "blue") #Extreme
curve(dnorm,add=TRUE,col = "red") #Normal

