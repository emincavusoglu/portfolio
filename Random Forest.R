#Install Necessary Packages
install.packages("tidyverse")
install.packages("caret")
install.packages("randomForest")
install.packages("mlbench")
library(mlbench)
library(tidyverse)
library(lattice)
library(caret)
library(randomForest)
# Load the data and remove NAs
data ("PimaIndiansDiabetes2"
      , package = "mlbench" )
PimaIndiansDiabetes2 <- na.omit (PimaIndiansDiabetes2)
# Inspect the data
sample_n (PimaIndiansDiabetes2, 10 )
# Split the data into training and test set
set.seed (123)
training.samples <- PimaIndiansDiabetes2$diabetes %>%
  createDataPartition (p = 0.8 , list = FALSE )
train.data <- PimaIndiansDiabetes2[training.samples, ]
test.data <- PimaIndiansDiabetes2[- training.samples, ]
# Fit the model on the training set
set.seed (123)
model <- train (diabetes~., data = train.data, method = "rf" , trControl
                = trainControl ("cv" , number = 10 ), importance = TRUE )
# Best tuning parameter
model$bestTune
# Final model
model$finalModel
# Make predictions on the test data
predicted.classes <-model %>%
  predict(test.data)
head(predicted.classes)
# Compute model accuracy rate
mean(predicted.classes ==test.data$diabetes)
# Variable importance
importance(model$finalModel)
varImp(model)
