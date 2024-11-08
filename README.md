# Airline Satisfaction Correlation and Visualization
## Project Overview
### This project focuses on understanding the relationship between various service aspects and overall passenger satisfaction in the airline industry. By calculating and visualizing correlation coefficients, I aim to uncover key factors that influence passenger experiences.

## Dataset and Variables

The analysis is based on a comprehensive airline satisfaction dataset, which includes variables covering different service dimensions and demographic features:

Customer Type: Regular or non-regular airline customer
Age: Age of the passenger
Type of Travel: Purpose of the flight (personal or business)
Class: Travel class (business, economy, economy plus)
Flight Distance: Distance of the flight

Satisfaction-related Variables: Ratings from 0 (not rated) to 5, covering aspects like:
Inflight Wi-Fi Service
Ease of Online Booking
Gate Location
Food and Drink
Online Boarding
Seat Comfort
Inflight Entertainment
On-Board Service
Leg Room Service
Baggage Handling
Check-in Service
Cleanliness
Departure Delay in Minutes and Arrival Delay in Minutes: Lengths of delays

## Methodology

Correlation Analysis: I calculated the correlation coefficients for each variable to determine their relationship with overall passenger satisfaction.
Data Visualization: Using ggplot2 in R, I visualized these correlations to make the insights more intuitive and understandable.

## Key Results

The sorted correlation coefficients revealed the following insights:

Top Correlated Factors:
Online Support: Positive correlation of 0.30, indicating that effective online support is a significant driver of satisfaction.
Check-in Service: Moderate positive correlation of 0.24, highlighting the importance of a smooth check-in process.

Other Findings:
Baggage Handling: Weaker positive correlation of 0.15, suggesting room for improvement but not as crucial as other factors.
Gate Location: Very weak positive correlation (0.04), implying minimal impact on overall satisfaction.
On-Board Service: Correlation of 0.03, lower than expected, suggesting the need for further analysis.
Flight Distance: Negative correlation of -0.07, indicating that longer flights may slightly decrease satisfaction.

## Visualization ![correlations.pdf]()


I used ggplot2 to create a bar plot that visually represents the strength of each variable's correlation with passenger satisfaction. This plot helps easily identify which factors are most influential.

## Conclusion

The analysis suggests that while some factors, like Online Support and Check-in Service, are moderately impactful, others have minimal influence on overall satisfaction. This information can guide airlines in prioritizing service improvements where they matter most to passengers.

Recommendations
Enhance Digital Support: Improving online support systems could yield a noticeable increase in passenger satisfaction.
Optimize Check-in Processes: Streamlining the check-in experience may also positively impact customer experiences.
Investigate Unexpected Findings: Further research could explore why some service elements, like on-board service, have lower-than-expected correlations.
Next Steps

Further Analysis: Explore other statistical methods or machine learning models to predict satisfaction levels.
Segment Analysis: Examine how different customer segments (e.g., business vs. economy travelers) prioritize different service aspects.
