#Importing the Dataset
library(readxl)
Happiness_1 <- read_excel("Desktop/Happiness_1.xlsx")
View(Happiness_1) 
# Installing and loading necessary packages
install.packages("class")
library(class)
# Prepare your data for imputation
X <- Happiness_1[, !(names(Happiness_1) %in% c("Country Name", "Country - RegionId"))]  # Drop non-numeric columns for imputation
# Normalize the data using z-score normalization
normalized_data <- scale(X)
# Perform KNN imputation on the normalized data
imputed_data <- kNN(normalized_data, k = 5)
# Convert back to DataFrame
imputed_data <- as.data.frame(imputed_data)
# Extract only the original variables
original_vars <- which(names(imputed_data) %in% names(X))
imputed_data <- imputed_data[, original_vars]
# Replace original columns with imputed values
Happiness_1[, !(names(Happiness_1) %in% c("Country Name", "Country - RegionId"))] <- imputed_data
# Save the imputed dataset
write.csv(Happiness_1, file = "~/Desktop/imputed_Happiness_1_normalized.csv", row.names = FALSE)
print("\nImputed dataset saved to the desktop as 'imputed_Happiness_1_normalized.csv'.")