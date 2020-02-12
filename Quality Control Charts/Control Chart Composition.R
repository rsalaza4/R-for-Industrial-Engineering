### CONTROL CHART COMPOSITION ###

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
     ylim = c(mean - (3*sd) - 1, mean + (3*sd) + 1),
     xlab = "Time",
     ylab = "Measurement",
     main = "Control Chart Composition")

# Add control limits
abline(h = mean, lwd = 2, col = "green")
abline(h = mean + (1*sd), lwd = 2, col = "#ff9999", lty = 3)
abline(h = mean + (2*sd), lwd = 2, col = "#ff3232", lty = 3)
abline(h = mean + (3*sd), lwd = 2, col = "red", lty = 2)
abline(h = mean - (1*sd), lwd = 2, col = "#ff9999", lty = 3)
abline(h = mean - (2*sd), lwd = 2, col = "#ff3232", lty = 3)
abline(h = mean - (3*sd), lwd = 2, col = "red", lty = 2)

# Add text labels
text(0.25, mean, "Mean", pos=4)
text(0.25, mean + (1*sd), (expression(paste("+1", sigma))), pos=4)
text(0.25, mean + (2*sd), (expression(paste("+2", sigma))), pos=4)
text(0.25, mean + (3*sd), (expression(paste("+3", sigma))), pos=4)
text(0.25, mean - (1*sd), (expression(paste("-1", sigma))), pos=4)
text(0.25, mean - (2*sd), (expression(paste("-2", sigma))), pos=4)
text(0.25, mean - (3*sd), (expression(paste("-3", sigma))), pos=4)
text(0.25, mean - (3*sd) - 0.5, "LCL", pos=4)
text(0.25, mean + (3*sd) + 0.5, "UCL", pos=4)
text(9.5, mean + (sd/2), "Zone C", pos=4)
text(9.5, mean + (1*sd) + (sd/2), "Zone B", pos=4)
text(9.5, mean + (2*sd) + (sd/2), "Zone A", pos=4)
text(9.5, mean - (sd/2), "Zone C", pos=4)
text(9.5, mean - (1*sd) - (sd/2), "Zone B", pos=4)
text(9.5, mean - (2*sd) - (sd/2), "Zone A", pos=4)
