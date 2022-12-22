### X-BAR & R-CHART ###

# Import the qcc package
library(qcc)

# Read a csv file and name it as df
df <- read.csv(file.choose(), header = FALSE)

# Assign the column name
colnames(df) <- c("Measurement")

# Let the user know how many data points are in the data frame
print(paste("The total number of measurements in the dataset is: ", length(df[, 1])))

# Specify the sample size
sample_size <- as.integer(readline(prompt = "Type in the sample size n (must divide the total number of data points and be 1 < n <= 10): "))

# Validate the sample size (must divide the total number of data points and be greater than 1 and less or equal than 10)
while((length(df[, 1])%%sample_size != 0) | (sample_size > 10) | (sample_size < 2)){
  sample_size <- as.integer(readline(prompt = paste("Error! Type in an integer number greater than 1 and less than 11 that divides", length(df[, 1]), ": ")))
}

# Get the total number of samples
number_of_samples <- length(df[, 1])/sample_size

# Assign the data points to the corresponding sample
Sample <- rep(1:number_of_samples, each = sample_size)

# Add the new column to the existing data frame
df <- data.frame(df, Sample)

# Group the data points
measure <- with(df, qcc.groups(Measurement, Sample))

# View the grouped data
head(measure)

# Specify the measure unit
measure_unit <- readline(prompt = "Type in the measure unit: ")  

# Create the x-bar chart
xbar <- qcc(measure, type = "xbar", data.name = measure_unit)

# Specify the warning limits (2 sigmas)
(warn.limits.2 = limits.xbar(xbar$center, xbar$std.dev, xbar$sizes, 2))

# Specify the warning limits (1 sigma)
(warn.limits.1 = limits.xbar(xbar$center, xbar$std.dev, xbar$sizes, 1))

# Plot the x-bar chart
plot(xbar, restore.par = FALSE)

# Plot the warning limit lines
abline(h = warn.limits.2, lty = 2, col = "blue")
abline(h = warn.limits.1, lty = 2, col = "lightblue")

# Get the summary for the x-bar chart
summary(xbar)

# Create the R-chart
r_chart <- qcc(measure, type = "R", data.name = measure_unit)

# Get the summary for the R-chart
summary(r_chart)

# Specify the lower control limit
LSL <- as.numeric(readline(prompt = "Type in the lower specification limit: "))

# Specify the upper control limit
USL <- as.numeric(readline(prompt = "Type in the upper specification limit: "))

# Specify the target
Target <- as.numeric(readline(prompt = "Type in the desired target: "))

# Plot the process capability chart
process.capability(xbar, spec.limits = c(LSL, USL), target = Target)

# EXAMPLE

library(qcc)

measures <- rnorm(200, 3, 1)

sample_size <- 5

number_of_samples <- length(measures)/sample_size

sample <- rep(1:number_of_samples, each = sample_size)

df <- data.frame(measures, sample)

measure <- with(df, qcc.groups(measures, sample))

head(measure)

measure_unit <- "lbs"  

xbar <- qcc(measure, type = "xbar", data.name = measure_unit)

(warn.limits.2 = limits.xbar(xbar$center, xbar$std.dev, xbar$sizes, 2))

(warn.limits.1 = limits.xbar(xbar$center, xbar$std.dev, xbar$sizes, 1))

plot(xbar, restore.par = FALSE)

abline(h = warn.limits.2, lty = 2, col = "blue")
abline(h = warn.limits.1, lty = 2, col = "lightblue")

summary(xbar)

r_chart <- qcc(measure, type = "R", data.name = measure_unit)

summary(r_chart)

LSL <- as.numeric(1)

USL <- as.numeric(5)

Target <- as.numeric(3)

process.capability(xbar, spec.limits = c(LSL, USL), target = Target)
