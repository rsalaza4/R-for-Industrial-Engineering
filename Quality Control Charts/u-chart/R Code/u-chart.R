### U-CHART ###

# Import the qcc package
library(qcc)

# Read a csv file and name it as df
df <- read.csv(file.choose(),header = FALSE)

# Assign the columna namea
colnames(df) <- c("Defects", "Sample_size")

# Create the U-chart
u_chart <- with(df, qcc(df$Defects, df$Sample_size, type = "u", data.name = "defects"))

# Get the summary for the chart
summary(u_chart)

# EXAMPLE

library(qcc)

defects <- as.integer(rnorm(50, 3, 1))

sample_size <- as.integer(rnorm(50, 20, 3))

df <- data.frame(defects, sample_size)

u_chart <- with(df, qcc(df$defects, df$sample_size, type = "u", data.name = "defects"))

summary(u_chart)
