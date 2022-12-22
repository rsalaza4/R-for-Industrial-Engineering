### RUN CHART ###

# Import the SixSigma package
library(SixSigma)

# Read a csv file and name it as df
df <- data.frame(read.csv(file.choose(), header = FALSE))

# Assign a header to the column
colnames(df) <- "Measure"

# Build the run chart
plot(df$Measure,        # do not modify this line of code 
     type = "b",        # type refers to chart layout ("b" or "c")
     pch  = ,           # pch refers to the symbol shape on the plot 
     ylim = c(,),       # ylim refers to the y-axis limts 
     axes = FALSE,      # axis determine is default axes are set to the chart
     main = "",         # type in the plot title
     sub  = "",         # type in the plot subtitle
     xlab = "",         # type in the x-axis title
     ylab = "")         # type in the y-axis title
axis(1,                 # axis 1 refers to the x-axis
     at = :,            # set the x-axis limits
     cex.axis = 0.7     # set the x-axis font size
axis(2)                 # axis 2 refers to the y-axis
box()                   # place everything within a box
grid()                  # add grid to the chart
abline(h = ,            # set the measure target (horizontal straight bar)
       lwd = 2)         # set the mean line width

# EXAMPLE

library(SixSigma)

plot(ss.data.pc$pc.volume,
     type = "b",
     pch = 16,
     ylim = c(12, 20),
     axes = FALSE,
     main = "Run Chart for the Volume",
     sub = "Printer Cartridge Example",
     xlab = "Run",
     ylab = "Volume")
axis(1,
     at = 1:24,
     cex.axis = 0.7)
axis(2)
box()
grid()
abline(h = 16,
       lwd = 2)
