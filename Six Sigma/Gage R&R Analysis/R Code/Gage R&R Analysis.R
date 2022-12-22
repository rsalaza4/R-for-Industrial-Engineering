### GAGE R&R ANALYSIS ###

# Import SixSigma package
library(SixSigma)

# Define the factors for appraisals
<- factor(rep(1:, each = ))

# Define the factors for parts
<- factor(rep(1:, ))

# Define the factors for replicates
run <- factor(rep(1:, )) 

# Define the measured variable
<- c()

# Build data frame
<- data.frame() 

# Perform GAGE R&R ANALYSIS 
my.rr <- ss.rr(var  = ,             # type in measured variable
               part = ,             # type in factors for parts
               appr = ,             # type in factor for appraisals (operators, machines...)
               data = ,             # type in the data frame from which information is retreived
               main = "",           # type in the plot title
               sub  = "")           # type in the plot subtitle 

# EXAMPLE

library(SixSigma)

voltmeter <- factor(rep(1:2, each = 9))
battery <- factor(rep(rep(1:3, each = 3), 2))
run <- factor(rep(1:3, 6))
voltage <- c(1.4727, 1.4206, 1.4754, 1.5083, 1.5739, 1.4341,
             1.5517, 1.5483, 1.4614, 1.3337, 1.6078, 1.4767,
             1.4066, 1.5951, 1.8419, 1.7087, 1.8259, 1.5444)
batteries <- data.frame(voltmeter, battery, run, voltage)
batteries

my.rr <- ss.rr(var = voltage,
               part = battery,
               appr = voltmeter,
               data = batteries,
               main = "Six Sigma Gage R&R Measure",
               sub = "Batteries Project MSA")