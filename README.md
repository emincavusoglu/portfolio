# Bank Loan Decision Tree Analysis
## Project Overview
### This project aims to develop a decision tree model to predict the likelihood of loan default based on various attributes of loan applicants. The analysis provides insights into which factors most significantly influence loan approval decisions.

## Dataset 
The analysis utilizes the BankLoan2 dataset, which includes 700 observations of applicants with the following key variables:

Default: Target variable indicating loan default status (0: No, 1: Yes).
Address: Duration at current address.
Age: Age of the applicant.
CredDebt: Amount of credit debt.
DebtInc: Ratio of debt to income.
Employ: Duration of employment.
OtherDebt: Amount of other debts.

## Methodology

Data Preprocessing: Cleaned and transformed the dataset for analysis, addressing missing values and encoding categorical variables as necessary.
Decision Tree Modeling: Built a classification decision tree using the rpart package in R, applying the following formula:
fit <- rpart(Default ~ ., data = BankLoan2, method = "class")
Model Evaluation: Analyzed model performance using complexity parameters (CP) and evaluated variable importance.

## Model Outputs

Root Node Error: The root node error indicates that 183 out of 700 observations were misclassified, leading to an error rate of approximately 26.14%.

Variable Importance: The following variables were identified as significant predictors of loan default:

DebtInc: 26
CredDebt: 16
Employ: 15
OtherDebt: 14
Income: 11
Age: 8
Address: 7
Education: 2

## Decision Tree Visualization ![Decision_Tree](https://github.com/emincavusoglu/portfolio/blob/Bank-loan-decision-tree/Decision%20Tree.png)
This visual representation of the decision tree demonstrates the classification logic, showing how different attributes lead to the decision regarding loan default.

## Conclusion 
The decision tree model successfully predicts loan defaults with a manageable error rate. Key variables such as debt-to-income ratio and employment duration significantly influence the decision-making process. This model can aid financial institutions in making informed lending decisions and enhance their loan approval strategies.
