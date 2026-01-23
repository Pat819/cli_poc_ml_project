# Quick data exploration for Titanic dataset
library(tidyverse)

# Load data
train <- read_csv("data/train.csv")
test <- read_csv("data/test.csv")

# Examine structure
cat("=== TRAIN DATA ===\n")
cat("Dimensions:", nrow(train), "rows x", ncol(train), "columns\n")
cat("\nFirst few rows:\n")
print(head(train))

cat("\n\nData types and missing values:\n")
print(train %>% summarise(across(everything(), ~sum(is.na(.)))))

cat("\n\n=== CATEGORICAL DISTRIBUTIONS ===\n")
cat("\nSurvival by Class:\n")
print(table(train$Pclass, train$Survived, useNA="ifany"))

cat("\nSurvival by Sex:\n")
print(table(train$Sex, train$Survived, useNA="ifany"))

cat("\nSurvival by Embarked:\n")
print(table(train$Embarked, train$Survived, useNA="ifany"))

cat("\n\n=== NUMERIC SUMMARIES ===\n")
cat("\nAge distribution:\n")
print(summary(train$Age))

cat("\nFare distribution:\n")
print(summary(train$Fare))

cat("\n\n=== KEY PATTERNS ===\n")
# Class-sex survival
cat("\nSurvival proportions by Class and Sex:\n")
train %>%
  group_by(Pclass, Sex) %>%
  summarise(n = n(), survived = sum(Survived), prop = mean(Survived), .groups='drop') %>%
  print()

# Family connections
cat("\nFamily size patterns:\n")
train %>%
  mutate(family_size = SibSp + Parch + 1) %>%
  group_by(family_size) %>%
  summarise(n = n(), survived = mean(Survived), .groups='drop') %>%
  print()

# Cabin patterns
cat("\nCabin data availability by class:\n")
train %>%
  mutate(has_cabin = !is.na(Cabin)) %>%
  group_by(Pclass) %>%
  summarise(total = n(), has_cabin = sum(has_cabin), pct_cabin = round(100*mean(has_cabin),1)) %>%
  print()

cat("\nDone!\n")
