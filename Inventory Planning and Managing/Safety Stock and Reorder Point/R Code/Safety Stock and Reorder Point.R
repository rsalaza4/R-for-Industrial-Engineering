### SAFETY STOCK AND REORDER POINT ###

# Import SCperf package
library(SCperf)

# Set daily mean demand
md <- as.numeric(readline(prompt = "Type in the daily mean demand: "))
while(md <= 0){
  md <- as.numeric(readline(prompt = "Error: type in a positive daily mean demand: "))
}

# Set standard deviation of the demand
sd <- as.numeric(readline(prompt = "Type in the standard deviation of the demand: "))
while(sd < 0){
  sd <- as.numeric(readline(prompt = "Error: type in a positive standard deviation of the demand: "))
}

# Set service level
SL <- as.numeric(readline(prompt = "Type in the service level rate (between 0 and 1): "))
while(SL <= 0 | SL >= 1){
  SL <- as.numeric(readline(prompt = "Error: type in a positive service level rate (between 0 and 1): "))
}

# Set lead time (in days)
L <- as.numeric(readline(prompt = "Type in the lead time (in days): "))
while(L <= 0){
  L <- as.numeric(readline(prompt = "Error: type in a positive lead time (in days): "))
}

# Get safety stock
ss <- ceiling(SS(SL, sd, L))
print(paste("Safety stock: ", ss))

# Get reorder point
rop <- ceiling(ROP(SL,md,sd,L))
print(paste("Reorder point: ", rop))

# Data frame construction

# Set initial inventory
init <- as.numeric(readline(prompt = "Type in the initial inventory: "))
while(init <= 0){
  init <- as.numeric(readline(prompt = "Error: type in a positive initial inventory: "))
}

# Inventory column
inventory <- init

# Set available inventory
available_inventory <- inventory

# Demand consupmtion
while(available_inventory >= 0){
  available_inventory <- available_inventory - ceiling(rnorm(1, md, sd))
  inventory <- append(inventory, available_inventory)
}

# Add safety stock to available inventory
inventory <- inventory + ss

# Day column
day <- c(1:length(inventory))

# Construct data frame
inventory_management <- data.frame(day, inventory)

# Determine the ROP day
i <- 1
while(inventory_management$inventory[i] > rop){
  i <- i + 1
}

# Import ggplot2 package
library(ggplot2)

# Build inventory graph
ggplot(data = inventory_management, 
       aes(x = day)) +
  geom_line(aes(y = inventory,
                col = "Available inventory")) +
  geom_line(aes(y = ss,
                col = "Safety stock"),
            linetype = "dashed") +
  geom_line(aes(y = 0,
                col = "Out of stock"),
            linetype = "dashed") +
  geom_segment(aes(x = i, xend = i, y = 0, yend = inventory_management$inventory[i]), 
               col = "grey") +
  geom_segment(aes(x = 0, xend = i, y = inventory_management$inventory[i], yend = inventory_management$inventory[i]), 
               col = "grey") +
  geom_point(x = i, y = inventory_management$inventory[i], size = 5, col = "red") +
  annotate("text", x = i, y = inventory_management$inventory[i], label = "Reorder point") +
  geom_point(x = i + L, y = inventory_management$inventory[i + L], size = 5, col = "green") +
  annotate("text", x = i + L, y = inventory_management$inventory[i + L], label = "Arrival") +
  labs(title = "Safety Stock and Reorder Point",
       subtitle = "Inventory Planning and Managing",
       x = "Day",
       y = "Inventory Level",
       caption = "Variability in lead time not assumed",
       color = NULL) +
  xlim(c(0, i + L)) +
  ylim(c(0, max(inventory_management$inventory))) +
  scale_color_manual(labels = c("Available inventory","Out of stock", "Safety stock"),
                     values = c("Available inventory"="black", "Safety stock"="orange", "Out of stock"="red"))

# Get the day of reorder point
print(paste("Place new inventory order on day: ", i))

# Get arrival day of inventory order
print(paste("The inventory order will arrive on day: ", i + L))
