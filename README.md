# MechaCar_Statistical_Analysis

## Project Overview

### Resources
- Data Sources:
- Software: 
## Linear Regression to Predict MPG
A Multiple Linear Regression Model has been developed to predict the miles per gallon (MPG) of a given MechaCar using data from 50 MechaCar prototypes. The data source contained 6 metrics for each prototype, including the MPG of each. The data is loaded into RStudio and passed into the `lm()` function to generate the model, appearing as : 
`lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_mpg)'
Summary statistics are then generated from the model:
![mechacar_mpg_lm]()