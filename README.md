# MechaCar_Statistical_Analysis

## Project Overview

### Resources
- Data Sources:
- Software: 
## Linear Regression to Predict MPG
A Multiple Linear Regression Model has been developed to predict the miles per gallon (MPG) of a given MechaCar using data from 50 MechaCar prototypes. The data source contained 6 metrics for each prototype, including the MPG of each. The data is loaded into RStudio and passed into the `lm()` function to generate the model, appearing as : 
`lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_mpg)`

Summary statistics are then generated from the model:
![mechacar_mpg_lm](https://github.com/Jforbus/MechaCar_Statistical_Analysis/blob/main/Resources/mechacar_mpg_lm.png)

Several key points can be drawn from this summary:
- The R-squared of this model is 0.7149. Meaning this model can correctly predict the MPG of each prototype in the dataset using the other 5 variables with 71% accuracy.
- The p-value of this model is 5.35e-11. This is well below all common significance levels, giving sufficient quantitative evedince to reject the null hypothesis and accept the alternative: The slope of the linear model is not zero.
- When we examine the individual p-values of each independent variable we can determine which variables are significant and which are not. These values are as follow:
    (Intercept)       5.08e-08 ***
    vehicle_length    2.60e-12 ***
    vehicle_weight    0.0776 .  
    spoiler_angle     0.3069    
    ground_clearance  5.21e-08 ***
    AWD               0.1852
    
    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
From this we can determine that the vehicle length, vehicle weight, and ground clearance have some level of significance in the model. The vehicle weight has a relatively low level of significance, potentially providing a random amount of variance. Spoiler angle and Drive type (AWD) have p-values well above the significance level, making these statistically likely to provide random amounts variance. Vehicle length and ground clearance have high degrees of signicance, meaning they have a significant impact on the MPG of each prototype, providing a non-random amount of variance. The Intercept also appears to have a significant effect on the model. This could mean that our significant variables need to be transformed or scaled to better desribe the relationship, or that a key variable driving MPG is missing from the model. 
- This model is potentially Overfit, with only 2 clearly significant variables. While it may accurately predict the MPG values in the provided dataset, the high level of significance of the Intercept with only 2 of 5 independent variables showing clear significance suggests that the model will be problematic for predicting the MPG of future prototypes. There is evidence to suggest that a missing independent variable is necessary to successfully predict the MPG of future prototypes.
