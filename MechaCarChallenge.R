library(dplyr)

--------------------------------------------------------------------------------------------------------------

## DELIVERABLE 1 ##

# Import CSV #

mecha_car_mpg <- read.csv(file='MechaCar_mpg.csv',check.names = F, stringsAsFactors = F)

# Perform linear regression #

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mecha_car_mpg)

# Using the summary() function, determine the p-value and the r-squared value for the linear regression model #

summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, mecha_car_mpg))

# P-value: 5.35e-11
# R-squared value: 0.6825

--------------------------------------------------------------------------------------------------------------

## DELIVERABLE 2 ##

# Import CSV #

Suspension_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Create a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation #

total_summary <- Suspension_Coil %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

total_summary

# Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation #

lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI),Median = median(PSI), Variance = var(PSI), SD = sd(PSI) , .groups = 'keep') 

lot_summary

--------------------------------------------------------------------------------------------------------------
  
## DELIVERABLE 3 ##
  
# Determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch #

t.test(Suspension_Coil$PSI,mu=mean(Suspension_Coil$PSI))

# Determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch #

t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == "Lot1"),mu=mean(Suspension_Coil$PSI))
t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == "Lot2"),mu=mean(Suspension_Coil$PSI))
t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == "Lot3"),mu=mean(Suspension_Coil$PSI))