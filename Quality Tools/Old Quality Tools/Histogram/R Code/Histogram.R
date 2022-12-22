### HISTOGRAM ###

# Import the SixSigma package
library(SixSigma)

# Read a csv file and name it as df
df <- data.frame(read.csv(file.choose(), header = FALSE))

# Assign a header to the column
colnames(df) <- "Measure"

# Build the histogram
hist(df$Measure,           # do not modify this line of code 
     breaks = ,            # breaks refers to the number of bins, (type "FD" for a fixed number)
     main   = "",          # type in the histogram title
     sub    = "",          # type in the histogram subtitle
     xlab   = "",          # type in the x-axis title
     col    = "#DDDDDD",   # type in the bins color
     border = "")          # type in the bins border color
grid()                     # add grid to the chart
box()                      # place everything within a box

# EXAMPLE

library(SixSigma)

hist(ss.data.pc$pc.volume,
     breaks = "FD",
     main = "Printer Cartridge Volume",
     sub = "Subtitle",
     xlab = "Volume",
     col = "#DDDDDD",
     border = "black")
grid()
box()     
