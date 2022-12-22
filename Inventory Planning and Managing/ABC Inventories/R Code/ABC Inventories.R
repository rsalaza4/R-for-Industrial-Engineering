### ABC INVENTORIES ###

# Set items' SKUs
SKU <- c(1:50)

# Set items' demands
demand <- ceiling(runif(50, 0, 100))

# Set items' prices
price <- ceiling(runif(50, 1, 100))

# Get items' sales
sales <- demand * price

# Construct inventory data frame
inventory <- data.frame(SKU, sales)

# Sort sales column in descending order
inventory <- inventory[order(-inventory$sales), ]

# Get the total sales
total_sales <- sum(inventory$sales)

# Create an empty vector for sales percentages
percentage <- c()

# Get the sales percentage for each item
for (i in inventory$sales){
  percentage <- append(percentage, i/total_sales * 100)
}

# Import dplyr package
library(dplyr)

# Add the percentage column to inventory data frame
inventory <- mutate(inventory, percentage)

# Get the cumulative sum of the products sales' percentages
cumulative <- cumsum(inventory$percentage)

# Add the cumulative column to inventory data frame
inventory <- mutate(inventory, cumulative)

# Create an empty vector for items classification
classification <- c()

# Classify the items by A, B and C
for (i in inventory$cumulative){
  if (i < 70) {
    classification <- append(classification, "A")
  } else if (i >= 70 & i < 90) {
    classification <- append(classification, "B")
  } else {
    classification <- append(classification, "C")
  }
}

# Add the classification column to inventory data frame
inventory <- mutate(inventory, classification)

# Import ggplot2 package
library(ggplot2)

# Build inventory classification graph
ggplot(data = inventory, aes(x = classification)) +
  geom_bar(aes(fill = classification)) + 
  labs(title = "Inventory ABC Distribution",
       subtitle = "Inventory Planning and Managing",
       x = "Items Classification",
       y = "Count")

# Print results
summary <- count(inventory, classification)
summary$percentage <- summary$n / sum(summary$n) * 100
summary
