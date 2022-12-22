### CONFIDENCE INTERVALS ###

# Import SixSigma package
library(SixSigma)

# Import qcc package
library(qcc)

# Get confidence intervals
ss.ci(,                         # type in the column of the data to be analyzed (must be numeric)
      data = ,                  # type the name of the data frame from where the information is retrieved 
      digits = 3)               # type the digits to be displayed

# EXAMPLE

library(SixSigma)
library(qcc)

ss.ci(len,                     
      data = ss.data.strings,   
      digits = 3)                
