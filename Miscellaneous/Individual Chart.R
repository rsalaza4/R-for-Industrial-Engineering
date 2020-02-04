### INDIVIDUAL CHART ###

# Import SixSigma package
library(SixSigma)

# Import qcc package
library(qcc)

# Build individual chart
require(qcc)                                         
df <- with(, qcc.groups(,))                            # specify  data frame and (y variable/response, group)
pb.xbar.one <- qcc(pb.groups.one, type="xbar.one")     # do not modify this line of code

# Get chart summary
summary(pb.xbar.one)                                  

# EXAMPLE

library(SixSigma)
library(qcc)

require(qcc)
df <- with(ss.data.pb1, qcc.groups(pb.humidity, pb.group))
pb.xbar.one <- qcc(df, type="xbar.one")
summary(pb.xbar.one)
