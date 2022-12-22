### GROUP CHART ###

# Import SixSigma package
library(SixSigma)

# Create group chart
stripchart( ~ ,                   # type in y-variable ~ x-variable
           vertical = TRUE,       # sert vertical = TRUE
           data = ,               # type in the data frame name
           pch = "",              # do not modify this line of code
           xlab = "",             # type in the x-axis label
           ylab = "",             # type in the y-axis label
           ylim = c(, ),          # set the y-axis limts
           main = "",             # type in the chart title
           sub = "")              # type in the chart subtitle
par("usr") <- c(, , , , )         # specify chart boundaries
rect(par("usr") [1],              # xmin boundary
     par("usr") [2],              # xmax boundary
     par("usr") [3],              # ymin boundary
     par("usr") [4],              # ymax boundary
     col = "#CCCCCC")             # set the chart background color
box(col = "#CCCCCC")              # set the chart box color
grid(col = "#EEEEEE")             # set the chart grids color
points( ~ ,                       # type in y-variable ~ x-variable
       data = ,                   # type in the data frame name
       pch = 19)                  # pch refers to the symbols shape
with(,                            # type in the data frame name
     text(label = ,               # specify the data frame corresponding to the labels
          x = ,                   # type in the x-variable
          y = ,                   # type in the x-variable
          pos = 4))               # specify the labels positions
lines(aggregate( ~ ,              # type in y-variable ~ x-variable
                data = ,          # type in the data frame name
                max),             # specify for the maximum values
      lwd = 2)                    # set line width
lines(aggregate( ~ ,              # type in y-variable ~ x-variable
                data = ,          # type in the data frame name
                min),             # specify for the maximum values
      lwd = 2)                    # set line width

# EXAMPLE

library(SixSigma)

stripchart(pc.volume ~ pc.batch,
           vertical = TRUE,
           data = ss.data.pc,
           pch = "",
           xlab = "Batch",
           ylab = "Volume",
           ylim = c(12, 20),
           main = "Group (Operator) Chart of Volume",
           sub = "Printer Cartridge Example")
rect(par("usr") [1],
     par("usr") [2],
     par("usr") [3],
     par("usr") [4],
     col = "#CCCCCC")
box(col = "#CCCCCC")
grid(col = "#EEEEEE")
points(pc.volume ~ pc.batch,
       data = ss.data.pc,
       pch = 19)
with(ss.data.pc,
     text(label = pc.op,
          x = pc.batch,
          y = pc.volume,
          pos = 4))
lines(aggregate(pc.volume ~ pc.batch,
                data = ss.data.pc,
                max),
      lwd = 2)
lines(aggregate(pc.volume ~ pc.batch,
                data = ss.data.pc,
                min),
      lwd = 2)
