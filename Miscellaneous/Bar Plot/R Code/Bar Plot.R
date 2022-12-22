### BAR PLOT ###

# Import SixSigma package
library(SixSigma)

# Create bar plot
with(,                         # type in the name of the data frame to be used
     barplot(,                 # type in the column name with the data information to be plotted 
             names.arg = ,     # type in the column name with the name of the frequencies
             las = 1,          # las refers to the x label position (1 = horizontal, 2 = vertical)
             main = "",        # type in the plot title 
             sub = ""))        # type in the plot subtitle 
abline(h = 0,                  # h refers to the height of the x-axis in terms of the y-axis  
       col = "#666666")        # col refers to the plot color

# EXAMPLE

library(SixSigma)

with(ss.data.pc.r,                                     
     barplot(pc.def,
             names.arg = pc.regions,
             las = 1,
             main = "Barplot of defects by region",
             sub = "Printer cartridge example"))
abline(h = 0,
       col = "#666666")
