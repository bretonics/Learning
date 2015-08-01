#Andres Breton
#Module 3 Homework Submission

#Problem 1
rm(list=ls())
f<-function(x) {2*exp(-2*(x-1))} #continious, x>1
integrate(f, lower=1, upper=4) #P(0 < X < 4)


#Problem 2
rm(list=ls())
f<-function(x) {(2^x/factorial(x))*exp(-2)}  #discrete, x= 0,1,2,...
f(1)  #P(X=1)
sum(f(0:3)) #P(-2 < X < 4)


#Problem 3
#NO R REQUIRED


#Problem 4
rm(list=ls())
y<-c(0,1,2) #P(Y ≤ 2) 
sum(dbinom(y,3,0.25))
#OR 
pbinom(2,3,.25)
#pbinom takes probability up to (<) 'x' (2) value

#Problem 5
rm(list=ls())
f<-function(x) dchisq(x,3)
integrate(f, lower=1, upper=4)$value  #P(1< X <4)
#Monte Carlo Simulation
x<-rchisq(100000,3)
mean((1<x)&(x<4))
#integrate(function(x) dchisq(x,3), lower=1, upper=4)$value #Exact value

#Problem 6
rm(list=ls())
f<-function(x) dchisq(x,5)

#Problem 7
rm(list=ls())
#a)
integrate(function(x) dnorm(x,1.6,0.4), lower=1, upper=1.6)$value  #P(1< X < 1.6)
#b)
x<-rnorm(500000,1.6,0.4)
mean((1<x)&(x<1.6))
#c)
dbinom(2,5,0.4331928)


#Problem 8
rm(list=ls())
#X~F(m=2,n=5) 
EX<-integrate(function(x) x*df(x,2,5), lower=0, upper=Inf)$value
EX
varX<-integrate(function(x) (x-EX)^2*df(x,2,5), lower=0, upper=Inf)$value
varX

#Y~F(m=10,n=5) 
EY<-integrate(function(y) y*df(y,10,5), lower=0, upper=Inf)$value
EY
varY<-integrate(function(y) (y-EY)^2*df(y,10,5), lower=0, upper=Inf)$value
varY