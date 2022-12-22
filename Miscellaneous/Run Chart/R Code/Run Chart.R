### RUN CHART ###

# Import SixSigma package
library(SixSigma)

# Create run chart
plot($,                 # type in the data frame column to be plotted
     type = "b",        # specify the chart type ("b" or "c")
     ylim = c(, ),      # set the y-axis limits
     axes = FALSE,      # set axes =  FALSE
     main = "",         # type in the chart title
     sub = "",          # type in the chart subtitle
     xlab = "",         # type in the x-axis label
     ylab = "")         # type in the y-axis label
axis(1,                 # add x-axis
     at = :,            # divide it in n points
     cex.axis = 0.6)    # cex.axis refers to the x-axis breaks size
axis(2)                 # add y-axis
box()                   # add a box
grid()                  # add grids
abline(h = ,            # type in the target value
       lwd = 2)         # lwd refers to the line width

# EXAMPLE

library(SixSigma)

plot(ss.data.pc$pc.volume,
     type = "b",
     ylim = c(12, 20),
     axes = FALSE,
     main = "Run Chart for the Volume",
     sub = "Printer Cartridge Example",
     xlab = "Run",
     ylab = "Volume")
axis(1,
     at = 1:24,
     cex.axis = 0.6)
axis(2)
box()
grid()
abline(h = 16,
       lwd = 2)
