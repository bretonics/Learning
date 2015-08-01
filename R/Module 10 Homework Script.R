#Andres Breton

# biocLite(c("affy","ArrayExpress","annotate","genefilter", "GO.db"))

#Problem 1
rm(list = ls())
library(affy); library(ArrayExpress)
yeastRaw = ArrayExpress('E-MEXP-1551')

#(a)
yeastExpSet<-expresso(yeastRaw, bgcorrect.method="mas", normalize.method="quantiles", pmcorrect.method="pmonly", summary.method="medianpolish") #preprocess raw data into expression data

#(b)
print(meanTop5<-apply(exprs(yeastExpSet),1,mean)[1:5])

#(c)
yeastExpSet
#-OR-
nrow(exprs(yeastExpSet)); ncol(exprs(yeastExpSet))



#Problem 2
rm(list = ls())
library(affy); library(ArrayExpress)
yeastRaw = ArrayExpress('E-MEXP-1551')

#(a)
annotation(yeastRaw)
biocLite("yeast2.db")

#(b)
library(yeast2.db); library(annotate)
length(GOIDs<-(getOntology(GO1769308<-get("1769308_at", env=yeast2GO), "MF")))

#(c)
library(GO.db)
GOpc<-c(parents<-unlist(sapply(getGOParents(GOIDs), function(x) {x$Parents})), children<-unlist(sapply(getGOChildren(GOIDs), function(x) {x$Children})))
length(unique(parents)) #take only unique ones, no duplicates

#(d)
length(unique(children)) #422


#Problem 3
rm(list = ls())

#(a)
library(genefilter); library("ALL"); data(ALL)
  # patients<-factor(ALL$BT %in% c("B2","B3")) #Factor indicator
  # patients<-exprs(ALL[,patients==TRUE])  
patients<-ALL[,ALL$BT %in% c("B2","B3")]
group<-patients$BT[,drop=T]
  # ncol(patients); length(group)
wilcoxon<-function(x) (wilcox.test(x~group, paired=F, alternative="two.sided", exact=F)$p.value < 0.001) #pass differential expression
welch<-function(x) (t.test(x~group)$p.value < 0.001) #pass difference in mean expression values

passWilcoxon<-genefilter(exprs(patients), filterfun(wilcoxon)) #pass diff exp
passWelch<-genefilter(exprs(patients), filterfun(welch)) #pass t-test
selected<-passWilcoxon & passWelch #pass if passing both filters
  #-OR-
  # ff<-filterfun(wilcoxon,welch)
  # selected<-genefilter(exprs(patients), ff) #select those passing all filters in filterfun

print(ALLpatients<-patients[selected,]) #Data of genes passing filters in B2/B3

#(b)
library(limma)
x<-apply(cbind(passWilcoxon,passWelch),2,as.integer) #Combine filter results
venD<-vennCounts(x,include="both") #Calculate counts for venn diagram
vennDiagram(venD) #Plot VD

#(c)
sum(passWilcoxon) #pass Wilcoxon filter
sum(passWelch) #pass Welch filter
sum(selected) #passed both

#(d)
annotation(ALL)
biocLite("hgu95av2.db")
library(hgu95av2.db); library(annotate); library(GO.db)
GOterm2Tag<-function(term) {
  GTL<-eapply(GOTERM, function(x) {grep(term, x@Term, value=TRUE)})
  Glength<-sapply(GTL,length)
  names(GTL[Glength>0])
}
print(GOoncogene<-GOterm2Tag("oncogene"))

#(e)
oncogenes<-hgu95av2GO2ALLPROBES$"GO:0090402" #probes for GO number
inBoth<-oncogenes %in% row.names(exprs(ALLpatients)) #ALLpatients probes for GO number
ALLoncogenes<-ALLpatients[oncogenes[inBoth],] #pick probes data for GO number
dim(exprs(ALLoncogenes))



#Problem 4
rm(list = ls())
library(limma); library("ALL"); data(ALL)

#(a)
patients<-ALL[,which(ALL$BT %in% c("B1","B2","B3"))]
  # patients<-factor(ALL$BT %in% c("B1","B2","B3")) #Factor indicator 1 for B-cell and 0 for T-cell patients
  # Bcell<-exprs(ALL[,patients==TRUE]) #patients w/ B-cell leukemia in B1, B2, and B3

#(b)
designMatrix<-model.matrix(~ 0 + factor(patients$BT)) #Design matrix for ANOVA w/o intercept
colnames(designMatrix)<-c("B1","B2","B3")
fit<-lmFit(patients, designMatrix) #fit linear model w/ design matrix
fit<-eBayes(fit) #apply Empirical Bayes adjustment
print(topTable(fit, adjust.method="fdr"), digits=4) #null hypothesis of all zero group means
dim(topTable(fit, number=Inf, adjust.method="fdr")) #total number genes 

print(topTable(fit, coef=3, number=5, adjust.method="fdr"), digits=4) #Top five genes with nonzero means in B3 group

#(c)
contrastsMa<-makeContrasts(B1-B2,B2-B3, levels=factor(patients$BT)) #contrasts design matrix
fitEB<-eBayes(contrasts.fit(fit, contrastsMa)) #fit linear model with contrast matrix, apply Empirical Bayes

dim(topTable(fitEB, number=Inf, p.value=0.01, adjust.method="fdr"))

print(topTable(fitEB, number=5, p.value=0.01, adjust.method="fdr"), digits=4)

