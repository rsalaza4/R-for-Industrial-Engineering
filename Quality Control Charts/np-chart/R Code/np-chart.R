### NP-CHART ###

# Import the qcc package
library(qcc)

# Read the csv file and name it as df
df <- read.csv(file.choose(), header = FALSE)

# Assign the column name
colnames(df) <- c("Defects")

# Specify the sample size
sample_size <- as.integer(readline(prompt = "Type in the sample size n: "))

# Create the sample size column
df$Sample_size <- (rep(sample_size, length(df$Defects)))

# Creat the np-chart
np_chart <- with(df, qcc(df$Defects, df$Sample_size, type = "np", data.name = "defects"))

# Get the summary for the chart
summary(np_chart)

# EXAMPLE

library(qcc)

defects <- as.integer(rnorm(50, 3, 1))

sample_size <- as.integer(rep(20, 50))

df <- data.frame(defects, sample_size)

np_chart <- with(df, qcc(df$defects, df$sample_size, type = "np", data.name = "defects"))

summary(np_chart)