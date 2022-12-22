### TIER CHART ###

# Import SixSigma package
library(SixSigma)

# Create tier chart
stripchart( ~ ,                # variable y ~ variable x
            data = ,           # type in the data frame from which information is retreived
            pch  = "-",        # pch refers to the symbols shape
            cex  = 3,          # cex refers to the symbols size
            xlab = "",         # type in the x-axis label
            ylab = "",         # type in the y-axis label
            ylim = c(, ),      # set the y-axis limts
            vertical = TRUE,   # do not modify this line of code
            main = "",         # type in the chart title
            sub  = "")         # type in the chart subtitle
grid()                         # add grid
for (i in 1:){                 # this loop function sets the vertical lines (i = batch number) 
  lines(x = rep(i, 2),
        lwd = 3,               # lwd refers to the line width
        col = "#666666",       # col refers to the lines color
        y = c(max([$==i]),     # this function sets the max limit of the vertical line
              min([$==i])))    # this function sets the min limit of the vertical line
}
abline(h = ,                   # set the target measure
       lwd = 2)                # lwd refers to the line width

# EXAMPLE

library(SixSigma)

stripchart(pc.volume ~ pc.batch,
           data = ss.data.pc,
           pch = "-",
           cex = 3,
           xlab = "Batch",
           ylab = "Volume",
           ylim = c(12, 20),
           vertical = TRUE,
           main = "Tier Chart for Volume",
           sub = "Printer Cartridge Example")
grid()
for (i in 1:6){
  lines(x = rep(i, 2),
        lwd = 3,
        col = "#666666",
        y = c(max(ss.data.pc$pc.volume[ss.data.pc$pc.batch==i]),
              min(ss.data.pc$pc.volume[ss.data.pc$pc.batch==i])))
}
abline(h = 16,
       lwd = 2)
