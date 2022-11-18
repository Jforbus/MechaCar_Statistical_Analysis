## Linear regression for MPG ##

# import package
library(dplyr)

# load data from csv
mecha_mpg <- read.csv("Resources/MechaCar_mpg.csv",check.names = F,stringsAsFactors = F)

# generate multiple linear regression model
model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_mpg)

# gather summary statistics
summary(model)


## Technical Analysis of Suspension Coils ##

# load data from csv
sus_coil <- read.csv("Resources/Suspension_Coil.csv",check.names = F,stringsAsFactors = F)

# create overall summary dataframe
total_summary <- summarize(sus_coil, Mean=mean(PSI), Median=median(PSI), 
                           Variance=var(PSI), SD=sd(PSI))

# create summary by lot dataframe
lot_summary <- sus_coil %>% group_by(Manufacturing_Lot) %>%
  summarize(Mean=mean(PSI), Median=median(PSI), 
            Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

