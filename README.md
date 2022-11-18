# MechaCar_Statistical_Analysis

## Project Overview

### Resources
- Data Sources: MechaCar_mpg.csv, Suspension_Coil.csv
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
    - (Intercept)      -  5.08e-08
    - vehicle_length   -  2.60e-12
    - vehicle_weight   -  0.0776 
    - spoiler_angle    -  0.3069    
    - ground_clearance -  5.21e-08
    - AWD              -  0.1852

    From this we can determine that the vehicle length, vehicle weight, and ground clearance have some level of significance in the model. The vehicle weight has a relatively low level of significance, potentially providing a random amount of variance. Spoiler angle and Drive type (AWD) have p-values well above the significance level, making these statistically likely to provide random amounts variance. Vehicle length and ground clearance have high degrees of signicance, meaning they have a significant impact on the MPG of each prototype, providing a non-random amount of variance. The Intercept also appears to have a significant effect on the model. This could mean that our significant variables need to be transformed or scaled to better desribe the relationship, or that a key variable driving MPG is missing from the model. 
- This model is potentially Overfit, with only 2 clearly significant variables. While it may accurately predict the MPG values in the provided dataset, the high level of significance of the Intercept with only 2 of 5 independent variables showing clear significance suggests that the model will be problematic for predicting the MPG of future prototypes. There is evidence to suggest that a missing independent variable is necessary to successfully predict the MPG of future prototypes.

## Summary Statistics on Suspension Coils
In order to conduct a techinical analysis of the suspension coils in the given dataset `Suspension_Coil.csv`, two dataframes containing summary statistics are generated. The data is loaded into a table in RStudio from which the two summary dataframes are drawn.

First, the summary statistics for all the given data are presented in a dataframe titled `total_summary`.
![total_summary](https://github.com/Jforbus/MechaCar_Statistical_Analysis/blob/main/Resources/total_summary_coil.png)

The design specifications require that there be less than 100 PSI of variance in the suspension coils. When the manufacturing data is analyzed as a whole, this requirement is passed with a variance in the suspension coils of 62.29356 PSI.

The suspension coils are grouped into lots in the given data set : `lot1`,`lot2`,`lot3`.
Next the summary statistics are generated for each lot individually to increase the depth of the analysis.
![lot_summary](https://github.com/Jforbus/MechaCar_Statistical_Analysis/blob/main/Resources/lot_summary.png)

Here we see a serious design specification requirement failure that was hidden in the original high level summary. `lot3` has a variance of 170.2861224 PSI, overrunning the allowed 100 PSI of variance by more than 70 PSI. `lot1` and `lot2` show a variance much lower than seen the the overall summary, .979 and 7.469 respectively, meaning the third lot has skewed the overall data significantly. Analyzed individually `lot1` and `lot2` pass the design requirement, but `lot3`.

The importance of the depth of analysis is presented greatly here in the appearance of all coils passing design requirements in the total summary. Without breaking down the coils by lots the significant failure of `lot3` would have remained hidden by the relatively high quality found in the manufacturing data for the first two lots.  

## T-Tests on Suspension Coils
T-Testing has been conducted on the data in `Suspension_Coil.csv` to compare the means of the PSI for the data. A population mean of 1500 PSI is assumed for the testing.
First the total data set is tested agains the population mean:
`t.test(sus_coil$PSI, mu=1500)`
![tTest_total]()