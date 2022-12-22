### P-CHART ###

# Import the qcc package
library(qcc)

# Read a csv file and name it as df
df <- read.csv(file.choose(), header = FALSE)

# Assign the columns names
colnames(df) <- c("Defects", "Sample_size")

# Create the p-chart
p_chart <- with(df, qcc(df$Defects, df$Sample_size, type = "p", data.name = "defects"))

# Get the summary for the chart
summary(p_chart)

# EXAMPLE

library(qcc)

defects <- as.integer(rnorm(50, 3, 1))

sample_size <- as.integer(rnorm(50, 20, 3))

df <- data.frame(defects, sample_size)

p_chart <- with(df, qcc(df$defects, df$sample_size, type = "p", data.name = "defects"))

summary(p_chart)