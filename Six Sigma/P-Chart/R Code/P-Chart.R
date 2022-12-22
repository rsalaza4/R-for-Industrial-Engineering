### P CHART ###

# Import SixSigma package
library(SixSigma)

# Import qcc package
library(qcc)

with(,                          # type in the name of the data frame from where the information is retrieved               
     plot(qcc(,                 # type in the name of the column refering to the defects (numerator)
              ,                 # type in the name of the column refering to the totals (denominator)
              type = "p")))     # type = "p" refers to the type of chart

# EXAMPLE

library(SixSigma)
library(qcc)

with(ss.data.pb3,
     plot(qcc(stockouts, 
              orders, 
              type = "p")))