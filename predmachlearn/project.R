library(caret)

# download the data from the url
# download.file("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv", "pml-training.csv", method="curl")

raw_data <- read.csv("pml-training.csv")

convert_to_numeric <- function(colname) {
    col <- raw_data[,colname]
    numeric_col <- as.numeric(as.character(col))
    
    # not numeric
    if(all(is.na(numeric_col))) col
    else numeric_col
}

# remove irrelevant data
raw_data <- raw_data[, -grep("timestamp", colnames(raw_data))]
raw_data <- raw_data[, -grep("window", colnames(raw_data))]
raw_data$user_name <- NULL

# convert all columns that can be numeric to numeric columns
numeric_data <- data.frame(lapply(colnames(raw_data), convert_to_numeric))
colnames(numeric_data) <- colnames(raw_data)

# remove all columns where more than 50% of the data is na
clean_data <- numeric_data[, colSums(is.na(numeric_data)) < 0.5*nrow(numeric_data)]

#colSums(is.na(numeric_data))

inTrain <- createDataPartition(y=clean_data$classe, p=0.7, list=F)
training <- clean_data[inTrain,]
validation <- clean_data[-inTrain,]

set.seed(333)

modRF <- train(classe ~ ., data=training, method="rf")
modLDA <- train(classe ~ ., data=training, method="lda")
modGBM <- train(classe ~., data=training, method="gbm", verbose=F)

