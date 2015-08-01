#Andres Breton
#Problem 1
rm(list = ls())
data(golub, package="multtest")
GRO2<-grep("GRO2 GRO2",golub.gnames[,2])
GRO3<-grep("GRO3 GRO3",golub.gnames[,2])

#(a)
GRO2exp<-golub[GRO2,]
GRO3exp<-golub[GRO3,]
cor(GRO2exp,GRO3exp)

#(b)
cor.test(GRO2exp, GRO3exp, conf.level=0.90)

#(c)
nBoot<-2000
bootCor<-matrix(0,nrow=nBoot, ncol=1)
data<-cbind(GRO2exp,GRO3exp)
for(i in 1:nBoot){
  dataSamp<-data[sample(1:nrow(data), replace=TRUE),] #Resample pairs
  bootCor[i,]<-cor(dataSamp[,1],dataSamp[,2]) #Correlation on resampled data
}
quantile(bootCor[,1],c(0.05,0.95))

#(d)
corBoot<-rep(NA, nBoot)
# corBootPval<-rep(NA, nBoot)
for(i in 1:nBoot){
  corSamp<-data[sample(1:nrow(data), replace=TRUE),]
  corBoot[i]<-cor(corSamp[,1],corSamp[,2])
#   corBootPval[i]<-cor.test(corSamp[,1],corSamp[,2], alternative="greater")$p.value
}
# mean(corBootPval<0.05)
quantile(corBoot,0.05) #95% CI



#Problem 2
rm(list = ls())
data(golub, package="multtest")
zyxin<-grep("Zyxin",golub.gnames[,2])
zyxinExp<-golub[zyxin,]

#(a)
zyxinCor<-rep(NA, 3051)
for(i in 1:3051){
  zyxinCor[i]<-cor(zyxinExp,golub[i,])
}
sum(zyxinCor<(-0.5))

#(b)
golub.gnames[order(zyxinCor)[1:5],][,2]

#(c)
zyxinPvals<-rep(NA, 3051)
for(i in 1:3051){
  zyxinPvals[i]<-cor.test(zyxinExp, golub[i,], alternative="less")$p.value
}
zyxinFDR<-p.adjust(p=zyxinPvals, method="fdr")
sum(zyxinFDR<0.05)



#Problem 3
rm(list = ls())
data(golub, package="multtest")
GRO2<-grep("GRO2 GRO2",golub.gnames[,2])
GRO3<-grep("GRO3 GRO3",golub.gnames[,2])

#(a)
GRO2exp<-golub[GRO2,]
GRO3exp<-golub[GRO3,]
print(regFit<-lm(GRO3exp~GRO2exp)) #Regression GRO3 GRO3 oncogene on the expression values of the GRO2 GRO2 oncogene
confint(regFit, level=0.90)
summary(regFit)

#(b)
confint(regFit, level=0.95)

#(c)
predict(regFit, newdata=data.frame(GRO2exp=0), interval="prediction", level=0.80)

#(d)
#Check normal[distributed] random noise
shapiro.test(resid(regFit))

qqnorm(resid(regFit))
qqline(resid(regFit))

plot(regFit, which=2)

#Check errors are independent of X
plot(regFit, which=1)
#linear (red line), y=0 means that X would be independent of Y
#Want to look for red line to be y=0


#Problem 4
rm(list = ls())
data(stackloss)

#(a)
AF<-stackloss$Air.Flow
WT<-stackloss$Water.Temp
AC<-stackloss$Acid.Conc
regFit<-lm(stack.loss~AF+WT+AC) #Multiple regression
regFit

#(b)
summary(regFit)

#(c)
predict(regFit, newdata=data.frame(AF=60,WT=20,AC=90), interval="confidence", level=0.90) #90% Confidence interval
predict(regFit, newdata=data.frame(AF=60,WT=20,AC=90), interval="prediction", level=0.90) #90% Prediction interval 

