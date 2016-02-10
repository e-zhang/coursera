library(AppliedPredictiveModeling)
library(ggplot2)
data(concrete)
library(caret)
library(Hmisc)
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[ inTrain,]
testing = mixtures[-inTrain,]

par(mfrow=c(3,3))
for( i in 1:ncol(training)){
    c <- cut2(training[,i])
    p <- qplot(seq_along(training$CompressiveStrength), 
               training$CompressiveStrength, 
               color=c,
               main=colnames(training)[[i]])
    print(p)
}

