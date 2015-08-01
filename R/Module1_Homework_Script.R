#Andres Breton
#Problem 1
rm(list = ls())
#(a)
vec <-c(5,TRUE)
class(vec)
#(b)
x<-1:4
y<-1:2
x+y
#(c)
fsin<-function(x) sin(pi*x)
fsin(1)
#(d)
c(1,2) %*% t(c(1,2))
#(e)
f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}
z <- 15
f(3)


#Problem 2
rm(list = ls())

x<-1:1000
total = sum(x^2)
total


#Problem 3
rm(list = ls())
#(a)
X<-2*(1:20)
X
#(b)
Y<-rep(0,20)
Y
#(c)
Y<-1:20
for(k in 1:11) {
  Y[k]<-cos(k)
}
for(k in 12:20) {
  integrand<- function(t) sqrt(t)
  Y[k]<-integrate(integrand, lower=0, upper=k)$value
}
Y
