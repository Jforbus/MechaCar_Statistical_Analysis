# import package
library(dplyr)

# load data from csv
mecha_mpg <- read.csv("Resources/MechaCar_mpg.csv",check.names = F,stringsAsFactors = F)

# generate multiple linear regression model
model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mecha_mpg)

# gather summary statistics
summary(model)
