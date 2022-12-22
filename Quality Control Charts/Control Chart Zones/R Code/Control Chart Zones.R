### CONTROL CHART ZONES ###

# Set seed
set.seed(42)

# Set number of points
N <- 10

# Set measures mean
mean <- 5

# Set measures standard deviation
sd <- 1

# Create random points
measures = rnorm(N, mean = mean, sd = sd)

# Build control chart
plot(measures,
     pch = 16,
     type = "b",
     xlim = c(0.25, N + 0.5),
     ylim = c(mean(measures) - (3*sd(measures)) - 1.5, mean(measures) + (3*sd(measures)) + 1.5),
     xlab = "Time",
     ylab = "Measurement",
     main = "Control Chart Zones")

# Add control limits
abline(h = mean(measures), lwd = 2, col = "green")
abline(h = mean(measures) + (1*sd(measures)), lwd = 2, col = "#ff9999", lty = 3)
abline(h = mean(measures) + (2*sd(measures)), lwd = 2, col = "#ff3232", lty = 3)
abline(h = mean(measures) + (3*sd(measures)), lwd = 2, col = "red", lty = 2)
abline(h = mean(measures) - (1*sd(measures)), lwd = 2, col = "#ff9999", lty = 3)
abline(h = mean(measures) - (2*sd(measures)), lwd = 2, col = "#ff3232", lty = 3)
abline(h = mean(measures) - (3*sd(measures)), lwd = 2, col = "red", lty = 2)

# Add text labels
text(0, mean(measures), "Mean", pos=4)
text(0, mean(measures) + (1*sd(measures)), (expression(paste("+1", sigma))), pos = 4)
text(0, mean(measures) + (2*sd(measures)), (expression(paste("+2", sigma))), pos = 4)
text(0, mean(measures) + (3*sd(measures)), (expression(paste("+3", sigma))), pos = 4)
text(0, mean(measures) - (1*sd(measures)), (expression(paste("-1", sigma))), pos = 4)
text(0, mean(measures) - (2*sd(measures)), (expression(paste("-2", sigma))), pos = 4)
text(0, mean(measures) - (3*sd(measures)), (expression(paste("-3", sigma))), pos = 4)
text(0, mean(measures) - (3*sd(measures)) - 0.5, "LCL", pos = 4)
text(0, mean(measures) + (3*sd(measures)) + 0.5, "UCL", pos = 4)
text(N + 0.5, mean(measures) + (sd(measures)/2), "Zone C", pos = 2)
text(N + 0.5, mean(measures) + (1*sd(measures)) + (sd(measures)/2), "Zone B", pos = 2)
text(N + 0.5, mean(measures) + (2*sd(measures)) + (sd(measures)/2), "Zone A", pos = 2)
text(N + 0.5, mean(measures) - (sd(measures)/2), "Zone C", pos = 2)
text(N + 0.5, mean(measures) - (1*sd(measures)) - (sd(measures)/2), "Zone B", pos = 2)
text(N + 0.5, mean(measures) - (2*sd(measures)) - (sd(measures)/2), "Zone A", pos = 2)
text(N/2, mean(measures) + (3*sd(measures)) + (sd(measures)/2), "Out of control limit", pos = 3, col = "red")
text(N/2, mean(measures) - (3*sd(measures)) - (sd(measures)/2), "Out of control limit", pos = 1, col = "red")
