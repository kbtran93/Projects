#Loading libraries
library(tidyverse)
library(randomForest)

#Reading in CSV files
train <-
  read.csv(
    "C:\\R working folder\\Projects\\Kaggle Competition Titanic\\datasets\\train.csv",
    header = TRUE,
    stringsAsFactors =  FALSE
  )
test <-
  read.csv(
    "C:\\R working folder\\Projects\\Kaggle Competition Titanic\\datasets\\test.csv",
    header = TRUE,
    stringsAsFactors = FALSE
  )
train$Survived <- as.factor(train$Survived)
test$Survived <- as.factor(test$Survived)
colSums(is.na(train))
colSums(is.na(test))

# Cleaning data
train_cl <- train %>%
  mutate(Age = replace_na(Age, mean(Age, na.rm = TRUE)))
test_cl <- test %>%
  mutate(Age = replace_na(Age, mean(Age, na.rm = TRUE)),
         Fare = replace_na(Fare,
                           mean(Fare, na.rm = TRUE)))

# Model and prediction
set.seed(200)
model <-
  randomForest(
    Survived ~ Pclass + Sex + Age + SibSp + Parch + Fare + Embarked + Pclass:Sex + Age:Sex,
    data = train_cl,
    ntree = 20000
  )
test_cl$Survived <-
  predict(model, newdata = test_cl, type = 'class')

#Save predictions to an output file
write.csv(test_cl[, c("PassengerId", "Survived")],
          file = "D:\\predictions.csv",
          row.names = FALSE,
          quote = FALSE)
