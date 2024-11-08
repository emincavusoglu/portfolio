#Load the dataset
library(readxl)
airline_customer_satisfaction <- read_excel("Documents/Ders/Artificial Intellegence with R/airline_customer_satisfaction.xlsx")
View(airline_customer_satisfaction)      
#Understanding the structure and the variables of dataset
summary(airline_customer_satisfaction)
str(airline_customer_satisfaction)
#Changing the satifaction variable to numeric data
airline_customer_satisfaction$satisfaction <- ifelse(airline_customer_satisfaction$satisfaction == "satisfied", 1, 0)
#Changing the 0 values with the NA
satisfaction_variables <- c("Seat comfort", "Departure/Arrival time convenient", "Food and drink", "Gate location", "Inflight wifi service", "Inflight entertainment", "Online support", "Ease of Online booking", "On-board service", "Leg room service","Baggage handling", "Checkin service", "Cleanliness", "Online boarding")
for (var in satisfaction_variables) {
  airline_customer_satisfaction[[var]] <- with(airline_customer_satisfaction, ifelse(get(var) == 0, NA, get(var)))
}
#Calculating the correlation matrix
correlation_matrix <- cor(airline_customer_satisfaction[, c(1, 6:19)])
#Finding the variables that have correlation with the satisfaction
satisfaction_correlation <- correlation_matrix[, 1]
#Understanding which variables are more correlated to satisfaction
print(sort(satisfaction_correlation, decreasing = TRUE))
# Load the necessary libraries
library(ggplot2)
library(reshape2)
# Extract correlations of 'satisfaction' with all other variables
satisfaction_correlations <- cor(airline_customer_satisfaction[, c("satisfaction", satisfaction_variables)], use = "complete.obs")["satisfaction", -1]
# Convert to data frame for ggplot
correlation_df <- data.frame(Variable = names(satisfaction_correlations), Correlation = satisfaction_correlations)
# Plot
ggplot(correlation_df, aes(x = reorder(Variable, Correlation), y = Correlation)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal() +
  coord_flip() +  # Flips the axes so it's easier to read the variable names
  labs(title = "Correlation between Satisfaction and Other Variables",
       x = "Variable",
       y = "Correlation Coefficient") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") # Adds a reference line at y=0