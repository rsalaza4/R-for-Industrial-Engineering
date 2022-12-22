### X-BAR CHART ###

# Import SixSigma package
library(SixSigma)

# Import qcc package
library(qcc)

require(qcc)                                         
pb.groups.xbar <- with(, qcc.groups(,))            # type in the data frame and (y variable/response, group)
pb.xbar <- qcc(pb.groups.xbar, type="xbar")        # do not modify this line of code
summary(pb.xbar)                                   # do not modify this line of code

# EXAMPLE

library(SixSigma)
library(qcc)

require(qcc)
pb.groups.xbar <- with(ss.data.pb2, qcc.groups(pb.humidity, pb.group))
pb.xbar <- qcc(pb.groups.xbar, type="xbar")
summary(pb.xbar)