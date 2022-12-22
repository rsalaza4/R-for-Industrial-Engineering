### SCATTER PLOT ###

# Import the SixSigma package
library(SixSigma)

# Read the csv file and name it as df
df <- data.frame(read.csv(file.choose(), header = FALSE))

# Assign a header to the columns
colnames(df) <- c("x", "y")

# Build the scatter plot
plot(y ~ x,             # do not modify this line of code 
      data = df,        # do not modify this line of code 
      main = "",        # type in the plot title
      sub  = "",        # type in the plot subtitle
      xlab = "",        # type in the x-axis title
      ylab = "",        # type in the y-axis title
      xlim = c(,),      # set the x-axis limits
      ylim = c(,),      # set the y-axis limits
      col  = "black",   # type in the plot color
      pch  = 16,        # set the points shape
      asp  = 0)         # asp refers to the same scale applied in both axes (0 for no or 1 for yes)
grid()                  # add grid to the chart

# EXAMPLE

library(SixSigma)

plot(pc.volume ~ pc.density,    
     data = ss.data.pc,         
     main = "Scatter Plot",            
     sub  = "Subtitle",         
     xlab = "Volume of Ink",    
     ylab = "Density",          
     xlim = c(0,2),             
     ylim = c(13,19),           
     col  = "#666666",          
     pch  = 16,                 
     asp  = 0)
grid()      
