# MechaCar_Statistical_Analysis

## Project Overview
Using R and RStudio to conduct statistical analysis of vehicle performance and manufacturing data.

### Resources
- Data Sources: MechaCar_mpg.csv, Suspension_Coil.csv
- Software: R 4.2.2, RStudio 2022.07.2

## Linear Regression to Predict MPG
A Multiple Linear Regression Model has been developed to predict the miles per gallon (MPG) of a given MechaCar using data from 50 MechaCar prototypes. The data source contained 6 metrics for each prototype, including the MPG of each. The data is loaded into RStudio and passed into the `lm()` function to generate the model, appearing as : 
`lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_mpg)`

Summary statistics are then generated from the model:
![mechacar_mpg_lm](https://github.com/Jforbus/MechaCar_Statistical_Analysis/blob/main/Resources/mechacar_mpg_lm.png)

Several key points can be drawn from this summary:
- The R-squared of this model is 0.7149. Meaning this model can correctly predict the MPG of each prototype in the dataset using the other 5 variables with 71% accuracy.
- The p-value of this model is 5.35e-11. This is well below all common significance levels, giving sufficient quantitative evidince to reject the null hypothesis and accept the alternative: The slope of the linear model is not zero.
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

The suspension coils are grouped into lots in the given data set : `Lot1`,`Lot2`,`Lot3`.
Next the summary statistics are generated for each Lot individually to increase the depth of the analysis.
![lot_summary](https://github.com/Jforbus/MechaCar_Statistical_Analysis/blob/main/Resources/lot_summary.png)

Here we see a serious design specification requirement failure that was hidden in the original high level summary. `Lot3` has a variance of 170.2861224 PSI, overrunning the allowed 100 PSI of variance by more than 70 PSI. `Lot1` and `Lot2` show a variance much lower than seen in the overall summary, .979 and 7.469 respectively, meaning the third Lot has skewed the overall data significantly. Analyzed individually `Lot1` and `Lot2` pass the design requirement, but `Lot3` fails by a significant margin.

The importance of the depth of analysis is presented greatly here in the appearance of all coils passing design requirements in the total summary. Without breaking down the coils by Lots the significant failure of `Lot3` would have remained hidden by the relatively high quality found in the manufacturing data for the first two Lots.  

## T-Tests on Suspension Coils
T-Testing has been conducted on the data in `Suspension_Coil.csv` to compare the means of the PSI data. A population mean of 1500 PSI is assumed for the testing.
First the total data set is tested agains the population mean:
`t.test(sus_coil$PSI, mu=1500)`
![tTest_total](https://github.com/Jforbus/MechaCar_Statistical_Analysis/blob/main/Resources/tTest_total.png)

The mean for the overall data set is 1498.78. The results of this t-Test show that that there is no statistical difference the population mean and the mean of the data set. The p-value of .06 is above an assumed significance of .05, meaning the test fails to reject the null hypothesis and the variance appearing in the means can be attributed to randomness. 

Next, the means of each Lot in the data are tested against the population mean of 1500 PSI.

Lot 1:
![tTest_Lot1](https://github.com/Jforbus/MechaCar_Statistical_Analysis/blob/main/Resources/tTest_Lot1.png)

Lot 2:
![tTest_Lot2](https://github.com/Jforbus/MechaCar_Statistical_Analysis/blob/main/Resources/tTest_Lot2.png)

Lot 3:
![tTest_Lot3](https://github.com/Jforbus/MechaCar_Statistical_Analysis/blob/main/Resources/tTest_Lot3.png)

The first two lots show similar results. With means of 1500 and 1500.2 respectively there is no statistical difference seen between the population mean and the means of these data sets. The p-value of `Lot1` is 1 suggesting there is no literal difference in the means, the p-value of `Lot2` is .6 well above the significance level of .05. For both of these Lots the null hypothesis is accepted: there is no statistical difference in the means.

For the third Lot the results are very different. The mean for this Lot is 1496.14, and the p-value is .042. This p-value falls below the significance level of .05, rejecting the null hypothesis: there is a statistical difference in the means that may not be attributed to randomness. This t-Test shows there is a potentially meaningful difference between the PSI data for `Lot3` and the population data.

## StudyDesign: MechaCar vs. Competition

Statistical analysis of MechCar's performance compared to its competitors is being conducted. In order to guage MechaCar's efficiency of performance compared to its competitors, MechaCar's Highway fuel efficiency will be compared to that of its competitors. The Highway fuel efficiency of the MechaCar vehicles as well as the Highway fuel efficiency of all competitor vehicles, measured in miles driven per unit of fuel, will need to be gathered in order to run this test. Once the data is gathered, cleaned, and organized, a one sample t-Test will be conducted to compare the mean Highway fuel efficiency of MechaCar's vehicles against the mean Highway fuel efficiency of the competitor vehicles. The hypothesis being that there is a statistically significant difference between the Highway fuel efficiency of MechaCar's vehicles and its competitors, with MechaCar's Highway fuel efficiency being greater on average than that of its competitors. A significance level of 0.05 has been selected for this test.     



