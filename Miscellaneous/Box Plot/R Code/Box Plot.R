### BOX PLOT ###

# Import SixSigma package
library(SixSigma)

# Create box plot
boxplot( ~ ,                   # variable y ~ variable x
         data = ,              # data refers to the data frame from which information is retreived
         col = "#CCCCCC",      # col refers to the boxes color
         main = "",            # type in the plot title 
         sub = "",             # type in the plot subtitle        
         xlab = "",            # type in the x-axis label
         ylab = "")            # type in the y-axis label

# EXAMPLE

library(SixSigma)

boxplot(pc.volume ~ pc.filler,
        data = ss.data.pc,
        col = "#CCCCCC",
        main = "Box Plot of Volume by Filler",
        sub = "Printer Cartridge Example",
        xlab = "Filler",
        ylab = "Volume")
