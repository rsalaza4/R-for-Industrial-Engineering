### ABC INVENTORIES ###

# Set products' SKUs
SKU <- c(1:50)

# Set products' demands
demand <- ceiling(runif(50, 0, 100))

# Set products' price
price <- ceiling(runif(50, 1, 100))

# Get produtcs' sales
sales <- demand * price

# Construct inventory data frame
df <- data.frame(SKU, sales)

# Sort sales column in descending order
df <-df[order(-df$sales), ]

# Get the total sales
total_sales <- sum(df$sales)

# Create an empty vector for sales percentages
percentage <- c()

# Get the sales' percentage from each product
for (i in df$sales){
  percentage <- append(percentage, i/total_sales * 100)
}

# Import dplyr package
library(dplyr)

# Add the percentage column to inventory data frame
df <- mutate(df, percentage)

# Get the cumulative sum of the products sales' percentages
cumulative <- cumsum(df$percentage)

# Add the cumulative column to inventory data frame
df <- mutate(df, cumulative)

# Create an empty vector for product classification
classification <- c()

# Classify the products by A, B or C
for (i in df$cumulative){
  if (i < 70) {
    classification <- append(classification, "A")
  } else if (i >= 70 & i < 90) {
    classification <- append(classification, "B")
  } else {
    classification <- append(classification, "C")
  }
}

# Add the classification column to inventory data frame
df <- mutate(df, classification)

# Import ggplot2 packahe
library(ggplot2)

# Build inventory classification graph
ggplot(data = df, aes(x = classification)) +
  geom_bar(aes(fill = classification)) + 
  labs(title = "Inventory ABC Distribution",
       subtitle = "Inventory Planning and Managing",
       x = "Products Classification",
       y = "Count")

# Print results
count(df, classification)
