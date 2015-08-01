# Andres Breton
# Final Exam


##################################
# Problem 1
rm(list = ls())

#(a)
DataPois<-as.numeric(t(read.table("./DataPois.txt", header=T)))
n<-length(DataPois); n
mean(DataPois)

#(b)
lik<-function(lam) prod(dpois(DataPois, lambda=lam)) #likelihood function
negLik<-function(lam) -lik(lam) #negative-likelihood
optim(par=1, negLik)$par #minimize negative likelihood

negLogLik<-function(lam) -sum(log(dpois(DataPois, lambda=lam))) #negative log-likelihood
MLE<-optim(par=1, negLogLik)$par; MLE #minimize negative log-likelihood

#(c)
nBoot<-1000
MLEboot<-rep(NA, nBoot)
for(i in 1:nBoot){
  dataSample<-DataPois[sample(1:n, replace=TRUE)]
  negLogLikBoot<-function(lam) -sum(log(dpois(dataSample, lambda=exp(lam)))) #negative log-likelihood
  MLEboot[i]<-optim(par=1, negLogLikBoot)$par  #minimize negative log-likelihood
}
quantile(MLEboot, c(0.025,0.975)) #95% CI
mean(MLEboot>=MLE) #p-value


##################################
# Problem 2
rm(list = ls())
# install.packages('ISLR')
library(ISLR)
nciData<-NCI60$data
nciLabs<-NCI60$labs
row.names(nciData)<-unlist(nciLabs) #64 cancer cell lines x 6830 gene exprs

##(a)
library(cluster)
cancerTypes<-unique(nciLabs) #types of cancers
nCancers<-length(unique(nciLabs)) #number of cancer types
cancerCounts<-table(nciLabs) #counts per cancer type
delete<-which(cancerCounts < 3) #select cancers which have < 3 cases
cancersKeep<-cancerCounts[-delete] #remove those cancers
cancersKeep #cancers with > 3 cases
#Curate expression nciData
keep<-which(row.names(nciData) %in% row.names(cancersKeep)) #get location of cancers with > 3 cases in data
curData<-nciData[keep,] #Curated data: kept cancer types with > 3 cases


##(b)
gene1<-curData[,1]
indicator<-factor(row.names(curData))
anova(lm(gene1~indicator))
summary(lm(gene1~indicator)) #ANOVA summary results
pairwise.t.test(gene1, indicator, p.adjust.method="fdr")


##(c)
shapiro.test(residuals(lm(gene1~indicator))) #Normality assumption
library(lmtest)
bptest(lm(gene1~indicator), studentize=F) #Homoscedasticity assumption


##(d)
pVals<-rep(NA,6830)
for(i in 1:6830){
  pVals[i]<-anova(lm(curData[,i]~indicator))$Pr[1]
}
fdr<-p.adjust(pVals, method="fdr")
sum(fdr<0.05)



##################################
# Problem 3
rm(list = ls())

##(a)
stateData<-as.data.frame(state.x77)
pairs(stateData)

##(b)
regression<-lm(`Life Exp`~Income+Illiteracy+Frost, data=stateData)
summary(regression)

##(c)
n<-dim(stateData)[1]
MSE<-rep(NA, n)
for(i in 1:n){
  training<-stateData[-i,]
  testing<-stateData[i,]
  regCV<-lm(`Life Exp`~Income+Illiteracy+Frost, data=training)
  prediction<-predict(regCV, newdata=testing, type="response")
  MSE[i]<-(stateData[i,4]-prediction)^2
}
mean(MSE)


##################################
# Problem 4
rm(list = ls())
library(ALL); data(ALL)

##(a)
ALLBs<-ALL[,ALL$BT %in% c("B","B1","B2","B3","B4")]
expData<-exprs(ALLBs) #expressions from B-cell patients


##(b)
n<-nrow(expData)
coef<-rep(NA,n)
for(i in 1:n){
  coef[i]<-sd(expData[i,])/mean(expData[i,]) #coef calc
}
length(keep<-which(coef > 0.2)) #select genes coef > 0.2
filtExpData<-as.data.frame(expData[keep,]) #expression data of selected genes
filtGenes<-row.names(filtExpData)


##(c)

##(d)
Bstages<-ALLBs$BT[,drop=T] #B cell type factors
MBT<-ALLBs$mol.biol[,drop=T] #molecule biology types
wardClust<-hclust(dist(t(filtExpData), method="eucl"), method="ward.D2")

#B Stages
plot(wardClust,labels=Bstages, main="B Stages Clustering") #Ward linkage dendrogram, B staged
rect.hclust(wardClust, k=4)
table(Bstages,cutree(wardClust, k=4)) #B stages comparison
#Molecule Biology Type
plot(wardClust,labels=MBT, main="MBT Clustering") #Ward linkage dendrogram, MBT
rect.hclust(wardClust, k=4)
table(MBT,cutree(wardClust, k=4)) #MBT comparison


##(e)
library(gplots)
filtExpData<-as.matrix(filtExpData)

#B stages heatmap
colorMap<-function(B){ #color for each type of B-cell
  if(B=="B") "gold"
  else if(B=="B1") "chocolate1"
  else if(B=="B2") "cornflowerblue"
  else if(B=="B3") "darkorchid"
  else if(B=="B4") "chartreuse3"
  else "red"
}
stagesColors<-unlist(lapply(Bstages,colorMap)) #apply color code to B-cell types
heatmap.2(filtExpData, main="B Stages Heatmap", hclustfun=function(d) hclust(d,method="ward.D2"), 
          col=greenred(75), scale="row", dendrogram="column", ColSideColors=stagesColors,
          key=F, density.info="none", trace="none", labRow=NA, labCol=NA)

#MBT heatmap
colorMapMBT<-function(B){ #color for each type of B-cell
  if(B=="ALL1/AF4") "gold"
  else if(B=="BCR/ABL") "chocolate1"
  else if(B=="E2A/PBX1") "cornflowerblue"
  else if(B=="NEG") "darkorchid"
  else if(B=="p15/p16") "chartreuse3"
  else "red"
}
MBTColors<-unlist(lapply(MBT,colorMapMBT)) #apply color code to B-cell types
heatmap.2(filtExpData, main="MBT Heatmap", hclustfun=function(d) hclust(d,method="ward.D2"),
          col=greenred(75), scale="row", dendrogram="column", ColSideColors=MBTColors,
          key=F, density.info="none", trace="none", labRow=NA, labCol=NA)


##(f)
library(limma)
ALLB14<-ALL[,ALL$BT %in% c("B1","B2","B3","B4")] #ExpressionSet for B1-B4
exprALLB14<-exprs(ALLB14) #expressions for selected patients
selBs<-ALLB14$BT[,drop=T] #Factors, drop unsused
levels(selBs)<-c("B1","B2","B34","B34") #Factors, combine B3/B4 levels into B34

designMatrix<-model.matrix(~ 0 + selBs) #Design matrix for ANOVA w/o intercept on B1,B2,B34
colnames(designMatrix)<-c(levels(selBs))
fit<-lmFit(ALLB14,designMatrix); fit<-eBayes(fit) #fit linear model w/ design matrix, apply Empirical Bayes
# print(topTable(fit, adjust.method="fdr"), digits=4)
dim(topTable(fit, number=Inf, p.value=0.05, adjust.method="fdr")) #total number genes

contMatx<-makeContrasts(B1-B2,B1-B34,B2-B34, levels=selBs) #design matrix from 3 contrasts
contFit<-contrasts.fit(fit,contMatx); contFit<-eBayes(contFit) #fit linear model w/ contrast design matrix, apply Empirical Bayes
dim(selectedGenes<-(topTable(contFit, number=Inf, p.value=0.05, adjust.method="fdr"))) #total number genes selected


##(g)
geneNames<-row.names(selectedGenes) #selected gene names
geneExp<-t(exprALLB14[geneNames,])

##SVM
library(e1071)
SVM<-svm(selBs~geneExp, type="C-classification", kernel="linear")
SVMpred<-predict(SVM, geneExp)
empSVMmcr<-mean(SVMpred!=selBs);empSVMmcr #empirical MCR
table(SVMpred, selBs)

#leave-one-out CV
n<-length(selBs)
mcrSVM<-rep(NA,n)
for(i in 1:n){
  svmCV<-svm(geneExp[-i,],selBs[-i], type="C-classification", kernel="linear")
  svmCVpred<-predict(svmCV,t(geneExp[i,]))
  mcrSVM[i]<-mean(svmCVpred!=selBs[i])
}
SVMmcr<-mean(mcrSVM);SVMmcr #cross validation MCR


##Classification Tree
require(rpart)
geneExpData<-data.frame(selBs,geneExp)
classTree<-rpart(selBs~., data=geneExpData, method="class") #fit tree on the data
rpartPred<-predict(classTree, type="class")
empCTmcr<-mean(rpartPred!=selBs); empCTmcr #emprical MCR for classTree
table(rpartPred,selBs)

#leave-one-out CV
mcrClassTree<-rep(NA,n)
for(i in 1:n){
  ctCV<-rpart(selBs~., data=geneExpData[-i,], method="class") #fit tree
  ctCVpred<-predict(ctCV, geneExpData[i,], type="class")
  mcrClassTree[i]<-mean(ctCVpred!=selBs[i])
}
CTmcr<-mean(mcrClassTree); CTmcr #cross validation MCR

c(empSVMmcr,empCTmcr,SVMmcr,CTmcr) #ALL mcrs


##(h)
#selected genes from filters in (b):filtGenes {184 genes} and (f):geneNames {1,169 genes}
filtered<-c(filtGenes,geneNames); length(filtered)
filtGenesExprs<-t(exprALLB14[filtered,]) #expression data of filtered genes from selected B patients part(f)

##SVM
library(e1071)
SVMfilt<-svm(selBs~filtGenesExprs, type="C-classification", kernel="linear")
SVMpredFilt<-predict(SVMfilt, filtGenesExprs)
empSVMmcrFilt<-mean(SVMpredFilt!=selBs);empSVMmcrFilt #empirical MCR
table(SVMpredFilt, selBs)

#leave-one-out CV
n<-length(selBs)
mcrSVMfilt<-rep(NA,n)
for(i in 1:n){
  svmCVfilt<-svm(filtGenesExprs[-i,],selBs[-i], type="C-classification", kernel="linear")
  svmCVpredFilt<-predict(svmCVfilt,t(filtGenesExprs[i,]))
  mcrSVMfilt[i]<-mean(svmCVpredFilt!=selBs[i])
}
SVMmcrFilt<-mean(mcrSVMfilt);SVMmcrFilt #cross validation MCR


##Classification Tree
require(rpart)
filtGenesData<-data.frame(selBs,filtGenesExprs)
classTreeFilt<-rpart(selBs~., data=filtGenesData, method="class") #fit tree on the data
rpartPredFilt<-predict(classTreeFilt, type="class")
empCTmcrFilt<-mean(rpartPredFilt!=selBs); empCTmcrFilt #emprical MCR for classTree
table(rpartPredFilt,selBs)

#leave-one-out CV
mcrClassTreeFilt<-rep(NA,n)
for(i in 1:n){
  ctCVfilt<-rpart(selBs~., data=filtGenesData[-i,], method="class") #fit tree
  ctCVpredFilt<-predict(ctCVfilt, filtGenesData[i,], type="class")
  mcrClassTreeFilt[i]<-mean(ctCVpredFilt!=selBs[i])
}
CTmcrFilt<-mean(mcrClassTreeFilt); CTmcrFilt #cross validation MCR

c(empSVMmcrFilt,empCTmcrFilt,SVMmcrFilt,CTmcrFilt) #All mcrs


##(i)
c(empSVMmcr,empCTmcr,SVMmcr,CTmcr) #SVM and CT classifiers part(g)
c(empSVMmcrFilt,empCTmcrFilt,SVMmcrFilt,CTmcrFilt) #SVM and CT classifiers part(h)



#### BONUS ####
# Problem 5
rm(list = ls())
DataPoisReg<-read.table(file="./DataPoisReg.txt", header=T)
x<-DataPoisReg[,1]
y<-DataPoisReg[,2]
n<-nrow(DataPoisReg)

#(a)
meanX<-mean(x); meanY<-mean(y)
negLogLik<-function(par) {
  lam<-par[1]; x<-par[2]
  -sum(log(dpois(y, lambda=lam))) #negative log-likelihood
} 
optim(par=c(1,1), negLogLik)$par #minimize negative log-likelihood


#(b)
regFit<-lm(y~x); regFit #Regression intercept/slope values
summary(regFit) #summary w/ two-sided t-statistic p-values
confint(regFit, level=0.90) #two-sided 90% CI from regression fit
confint(regFit, level=0.95) #two-sided 95% CI from regression fit


# #Y(i) from poisson distribution
# ##MLE-Least Squares Estimators
# beta0<-4.128
# beta1<-8.091
# LSE<- (y-beta0-beta1*x)^2
# inter<-function(lam) -sum(log(meanY-(x*meanX))) #negative log-likelihood
# optim(par=1, inter)$par #minimize negative log-likelihood
# slope<-function(n) -sum(log((sum((x[n]-meanX)*(y[n]-meanY))/sum((x[n]-meanX)^2))))
# optim(par=1,slope)$par 
# dpois(y,2.33)
# slope<-rep(NA,n)
# for(i in 1:(n-1)){
#   j<-(i+1)
#   slope[i]<- (y[j]-y[i])/(x[j]-x[i])
# }
# mean(slope)
# quantile(dpois(y,2.33), c(0.025,0.975), na.rm=T) 
# lik<-function(lam) prod(dpois(y, lambda=lam)) #likelihood function
# negLik<-function(lam) -lik(lam) #negative-likelihood
# optim(par=1, negLik)$par #minimize negative likelihood

