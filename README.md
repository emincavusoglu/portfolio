# Diabetes Prediction Using Random Forest
## Project Overview
### This project involves building a Random Forest classification model to diagnose diabetes based on several health-related predictors from a public diabetes dataset. The goal is to develop a model that can accurately classify patients as diabetic ("pos") or non-diabetic ("neg"), using features such as glucose levels, body mass index, and age.

## Dataset
The dataset used in this project includes the following variables:

pregnant: Number of times the patient has been pregnant
glucose: Plasma glucose concentration after a 2-hour oral glucose tolerance test
pressure: Diastolic blood pressure (mm Hg)
triceps: Triceps skinfold thickness (mm)
insulin: 2-hour serum insulin (mu U/ml)
mass: Body mass index (weight in kg/(height in m)^2)
pedigree: Diabetes pedigree function (a function that scores the likelihood of diabetes based on family history)
age: Age of the patient (years)
diabetes: Class variable indicating if the patient has diabetes (pos or neg)

## Methodology
Model Selection: A Random Forest algorithm was chosen for this binary classification problem due to its robustness and ability to handle a mix of feature types without extensive preprocessing.

Model Training: The model was trained with 500 trees, and the optimal number of variables tried at each split (mtry) was found to be 8.

Performance Evaluation: The model's performance was evaluated using an Out-Of-Bag (OOB) error estimate, confusion matrix, and accuracy on a test dataset.

## Key Results
OOB Error Rate: The overall Out-Of-Bag error rate was 22.29%, indicating the model's error rate when predicting the training set samples not included in the bootstrap sample.
Confusion Matrix:
Class error for "neg": 13.81%
Class error for "pos": 39.42%
Model Accuracy: The model achieved an accuracy rate of 73.08% on the test data, indicating reasonable predictive performance but highlighting potential areas for improvement.

## Variable Importance

The feature importance analysis showed that the top predictors for diabetes were:

glucose: The most significant predictor, with the highest impact on model accuracy.
age: The second most important feature, indicating that older age is associated with a higher likelihood of diabetes.
mass: The third most significant variable, reflecting the influence of BMI on diabetes risk.

## Conclusion

The Random Forest model provides a decent baseline for predicting diabetes but could benefit from further optimization or feature engineering to improve accuracy, particularly in identifying positive diabetes cases more effectively.

Next Steps
Model Improvements: Experiment with hyperparameter tuning, alternative models, or feature selection techniques to reduce the error rate, especially for the "pos" class.
Feature Engineering: Investigate transformations or interactions between features that could enhance the model's predictive power.
Business Implications: This analysis could inform early intervention strategies by healthcare providers to manage and monitor patients at risk of diabetes.
