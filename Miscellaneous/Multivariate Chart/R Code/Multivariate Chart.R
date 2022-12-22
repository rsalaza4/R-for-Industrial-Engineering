### MULTIVARIATE CHART ###

# Import SixSigma library
library(SixSigma)

# Import lattice library
require(lattice)

# Compute overall mean
o.mean <- mean(ss.data.pc.big$volume)

# Build multivariate chart
mvChart <- xyplot(volume ~ filler |                                  # type in response ~ categorical variable 1 
                  col * operator,                                    # type in categorical variable 2 * categorical variable 3 
                  main = "",                                         # type in the chart title
                  xlab = "",                                         # type in the x-axis label
                  ylab = "",                                         # type in the y-axis label
                  data = ,                                           # type in the data frame name  
                  groups = ,                                         # specify the groups column from the data frame
                  panel = function (x, y, ldots,                     # create a function with x, y, ldots...  
                                    groups, subscripts){             # groups and subscripts as arguments
                    # horizontal lines
                    panel.grid(h = -1,                               # do not modify this line of code
                               v = 0,                                # do not modify this line of code
                               col = "#CCCCCC")                      # set the horizontal lines color
                    # points and lines for measurements
                    panel.stripplot(x, y,                            # do not modify this line of code
                                    groups = groups,                 # do not modify this line of code
                                    subscripts = subscripts,         # do not modify this line of code
                                    type = "b")                      # do not modify this line of code
                    # this line is for the mean of all the batches
                    # for each color, operator and filler
                    panel.linejoin(x, y,                             # do not modify this line of code
                                   groups = groups,                  # do not modify this line of code
                                   subscripts = subscripts,          # do not modify this line of code
                                   horizontal = FALSE,               # do not modify this line of code
                                   col = "#000000",                  # do not modify this line of code
                                   type = "a",                       # do not modify this line of code
                                   lwd = 4)                          # do not modify this line of code
                    # A square for the overall mean
                    panel.points(mean(as.numeric(x)), o.mean,        # do not modify this line of code
                                 cex = 2,                            # cex refers to the point size
                                 pch = 15,                           # pch refers to the symbol shape
                                 col = "#CCCCCC")                    # set the point color
                    # this is for the mean inside each subplot
                    panel.points(mean(as.numeric(x)), mean(y),       # do not modify this line of code
                                 cex = 1.5,                          # cex refers to the point size
                                 pch = 2)                            # pch refers to the symbol shape
                  },
                  # this is for the legend above the chart
                  auto.key = list(title = "batch",                   # type in the title of the legend above the chart
                                  lines = TRUE,                      # set lines = TRUE
                                  points = TRUE,                     # set points =  TRUE
                                  columns = 4))                      # specify the total number of factors of the batch column

# Print chart
print(mvChart)

# EXAMPLE

library(SixSigma)
require(lattice)

o.mean <- mean(ss.data.pc.big$volume)
mvChart <- xyplot(volume ~ filler |  col * operator,
                  main = "Multi-var chart for Volume by color and operator",
                  xlab = "Filler",
                  ylab = "Volume",
                  data = ss.data.pc.big,
                  groups = batch,
                  panel = function (x, y, ldots,
                                    groups, subscripts){
                    # horizontal lines
                    panel.grid(h = -1,
                               v = 0,
                               col = "#CCCCCC")
                    # points and lines for measurements
                    panel.stripplot(x, y,
                                    groups = groups,
                                    subscripts = subscripts,
                                    type = "b")
                    # this line is for the mean of all the batches
                    # for each color, operator and filler
                    panel.linejoin(x, y,
                                   groups = groups,
                                   subscripts = subscripts,
                                   horizontal = FALSE,
                                   col = "#000000",
                                   type = "a",
                                   lwd = 4)
                    # A square for the overall mean
                    panel.points(mean(as.numeric(x)), o.mean,
                                 cex = 2,
                                 pch = 15,
                                 col = "#CCCCCC")
                    # this is for the mean inside each subplot
                    panel.points(mean(as.numeric(x)), mean(y),
                                 cex = 1.5,
                                 pch = 2)
                  },
                  # this is for the legend above the chart
                  auto.key = list(title = "batch",
                                  lines = TRUE,
                                  points = TRUE,
                                  columns = 4))
print(mvChart)
