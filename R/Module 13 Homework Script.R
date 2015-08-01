#Andres Breton

# install.packages(c("caret","e1071","ROCR","VGAM"))

#Problem 1
rm(list = ls())
library(ALL); data(ALL)

#(a)
#Indicator, TRUE for B-cell, False for T-cell
IsB<-c(rep("TRUE",sum(ALL$BT %in% c("B","B1","B2","B3","B4"))),rep("FALSE",sum(ALL$BT %in% c("T","T1","T2","T3","T4"))))

#(b)
require(rpart); library(hgu95av2.db)
probes<-c("39317_at", "38018_g_at")
expresData<-exprs(ALL[probes,]) #expressions for probes
genes<-mget(probes, env=hgu95av2SYMBOL)
row.names(expresData)<-unlist(genes)

classTree<-rpart(IsB~., data=data.frame(t(expresData))) #Fit tree on data set, transpose to due on patients (rows)
plot(classTree, branch=0, margin=0.1) #plot v-shaped tree
text(classTree, digits=3) #decision rule text
classPred<-predict(classTree, type="class") #class prediction from tree
table(classPred, IsB)

library(ROCR)
predProb<-predict(classTree, type="prob")[,2] #predict class probability
prediction<-prediction(predProb, IsB=="TRUE") #use prediction probability to predict response
perf<-performance(prediction, "tpr", "fpr") #compute tpr/fpr for prediction
plot(perf,col="red") #plot tpr vs fpr, ROC curve

#(c)
sum(classPred!=IsB)/length(classPred) #empirical mcr
fpr<-sum(classPred=="TRUE" & IsB =="FALSE")/sum(IsB=="FALSE"); fpr
1-fpr #true negative rate (specificity)
fnr<-sum(classPred!="TRUE" & IsB =="TRUE")/sum(IsB=="TRUE"); fnr
1-fnr #true positive rate (sensitivity)

slot(AUC<-performance(prediction, "auc"), "y.values") #ROC area under curve (AUC)

#(d)
require(caret)
exprsGenes<-data.frame(IsB,(t(expresData)))
n<-dim(exprsGenes)[1]
index<-1:n
K<-10
folds<-createFolds(index, k=K)
fnr<-rep(NA,K)
for(i in 1:K){
  testID<-folds[[i]]
  trainData<-exprsGenes[-testID,]
  testData<-exprsGenes[testID,]
  lgrFit<-glm(IsB~., family=binomial(link="logit"), data=trainData)
  predProb<-predict(lgrFit, newdata=testData, type="response") #class prediction from tree
  classPred<-(predProb>0.5)
  fnr[i]<-sum(classPred!="TRUE" & IsB[testID] =="TRUE")/(sum(IsB[testID]=="TRUE"))
}
mean(fnr)

#(e)
lgrData<-data.frame(IsB, t(expresData)) #data frame of indicator and expressions
lgrFit<-glm(IsB~., family=binomial(link="logit"), data=lgrData) #logistic regression of class indicator on probe expression values
confint(lgrFit, level=0.8)

#(f)
mcrRaw<-rep(NA, n)
for(i in 1:n){
  trainingData<-lgrData[-i,]
  testingData<-lgrData[i,]
  fitLgr<-glm(IsB~., family=binomial(link="logit"), data=trainingData)
  predProb2<-predict(fitLgr, newdata=testingData, type="response")
  prediClass<-(predProb2>0.5)
  mcrRaw[i]<-sum(prediClass!=testingData$IsB)/length(prediClass)
}
mean(mcrRaw)

#(g)
PCA<-prcomp(t(exprs(ALL)), scale=TRUE)
# summary(PCA)$importance[3,]; sum(summary(PCA)$importance[3,] < 0.99)
PropVar<-summary(PCA)$importance[2,]
plot(1:length(PropVar), PropVar, xlab='number of principal components', ylab='proportion of variance explained', xlim=c(0,60))

#(h)
library(e1071)
PCAdata<-PCA$x[,1:5]
svm<-svm(IsB~PCAdata, type="C-classification", kernel="linear")
svmPred<-predict(svm,PCAdata)
table(svmPred, IsB)
fnr<-sum(svmPred!="TRUE" & IsB =="TRUE")/sum(IsB=="TRUE"); fnr
1-fnr #true positive rate (sensitivity)

#(i)
mcrRaw<-rep(NA, n)
for(i in 1:n){
  svm<-svm(PCAdata[-i,], IsB[-i], type="C-classification", kernel="linear")
  svmPred<-predict(svm, t(PCAdata[i,]))
  mcrRaw[i]<-mean(svmPred!=IsB[i])
}
mcr<-mean(mcrRaw); mcr




#Problem 2
rm(list = ls())

#(a)
PCAiris<-prcomp(iris[,1:4], scale=TRUE)
summary(PCAiris)
Species<-iris$Species
PCAdata<-PCAiris$x[,1:4]
n<-length(Species)
K<-4

iris2<-data.frame(Species, PCAdata)
fit<-rpart(Species~., data=iris2, method="class")
treePred<-predict(fit, iris2, type="class")
mcrEmp<-mean(treePred!=Species)

#Classification Tree
mcrCV<-rep(NA,K)
# fitTree<-data.frame(matrix(ncol=4, nrow =n))
for(i in 1:K){
  PCAraw<-PCAiris$x[,i]
  irisPCA<-data.frame(Species,PCAraw)
  mcrRaw<-rep(NA,n)
  for(j in 1:n){
    fitTree<-rpart(Species~., data=irisPCA[-j,], method="class")
    pred<-predict(fitTree, irisPCA[j,], type ="class")
    mcrRaw[j]<-mean(pred!=Species[j])
  }
  mcrCV[i]<-mean(mcrRaw)
}
c(mcrEmp, mcrCV) #empirical and cross validation mcr K=1:4


#Logistic Regression
y<-as.numeric(iris$Species=='setosa')
SepalLength<-iris$Sepal.Length
irisLgr<-cbind(iris[,1:4],y)
lgrFit<-glm(y~., data=irisLgr, family=binomial(link='logit'))
predLgr <-(predict(lgrFit, type="response")>0.5)
predLgr <- factor(predLgr, levels=c(TRUE,FALSE),labels=c("setosa","not setosa"))
setosa<-factor(y, levels=c(1,0), labels=c("setosa","not setosa"))

library(VGAM)
irisLGR<-vglm(Species~., family=multinomial, data=iris2)
preProbLGR<-predict(irisLGR, iris2[,-1], type="response")
predLGR<-apply(preProbLGR, 1, which.max)
predLGR<-factor(predLGR, levels=c("1","2","3"), labels=levels(iris2$Species))
mcrLGR<-mean(predLGR!=iris2$Species); mcrLGR

mcrCvRaw<-rep(NA,n)
mcrCV<-rep(NA,K)

for(j in 1:K){
  PCArawData<-PCAiris$x[,j]
  irisLog<-data.frame(Species,PCArawData)
  for(i in 1:n){
    fitLGR<-vglm(Species~., family=multinomial, data=irisLog[-i,])
    preProb<-predict(fitLGR, irisLog[i,-1], type="response")
    pred<-apply(preProb, 1, which.max)
    pred<-factor(pred, levels=c("1","2","3"), labels=levels(irisLog$Species))
    mcrCvRaw[i]<-mean(pred!=Species[i])
  }
  mcrCV[j]<-mean(mcrCvRaw)
}
mcrCV

#SVM
irisSVM<-svm(PCAdata, Species, type="C-classification", kernel="linear")
predSVM<-predict(irisSVM, PCAdata)
mcrSVM<-mean(predSVM!=Species); mcrSVM

mcrCV<-rep(NA,K)
for(j in 1:K){
  PCAdataRaw<-PCAiris$x[,j]
  mcrCvSVM<-rep(NA,n)
  for(i in 1:n){
    svm<-svm(PCAdataRaw[-i], Species[-i], type="C-classification", kernel="linear")
    svmPred<-predict(svm, t(PCAdataRaw[i]))
    mcrCvSVM[i]<-mean(svmPred!=Species[i])
  }
  mcrCV[j]<-mean(mcrCvSVM)
}
mcrCV

