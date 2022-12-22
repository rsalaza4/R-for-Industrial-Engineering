### PROCESS PERFORMANCE ###

# Import SixSigma package
library(SixSigma)

# Set the total number of units
total_units <- as.numeric(readline(prompt = "Type in the total number of units: "))

# Set the total number of defects
defects <- as.numeric(readline(prompt = "Type in the total number of defects: "))

# Set the total number of reworks
reworks <- as.numeric(readline(prompt = "Type in the total number of reowrks: "))

# Get process performance measures
ss.ca.yield(defects, reworks, total_units)

# EXAMPLE

# Consider 3 different processes with same number of untis

library(SixSigma)

total_units <- 1915
defects <- c(3, 5, 12)
reworks <- c(1, 2, 4)
ss.ca.yield(defects, reworks, total_units)