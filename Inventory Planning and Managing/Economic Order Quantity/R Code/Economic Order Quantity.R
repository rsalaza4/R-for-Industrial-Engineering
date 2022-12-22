### ECONOMIC ORDER QUANTITY ###

# Import SCperf package
library(SCperf)

# Set annual quantity demanded
D <- as.numeric(readline(prompt = "Type in the annual demand: "))
while(D <= 0){
  D <- as.numeric(readline(prompt = "Error: type in a positive annual demand: "))
}

# Set ordering cost (fixed cost)
S <- as.numeric(readline(prompt = "Type in the ordering cost: "))
while(S <= 0){
  S <- as.numeric(readline(prompt = "Error: type in a positive ordering cost: "))
}

# Set holding cost (variable cost)
print("Do you know the holding cost?")
answer <- as.numeric(readline(prompt = "Type 1 for Yes or 0 for No: "))
while(answer != 0 & answer != 1){
  answer <- as.numeric(readline(prompt = "Error: type 1 for Yes or 0 for No: "))
}

if(answer == 1){
  H <- as.numeric(readline(prompt = "Type in the holding cost: "))
  while(H <= 0){
    H <- as.numeric(readline(prompt = "Error: type in a positive holding cost: "))
  }
} else {
  # Set unit cost (variable cost)
  C <- as.numeric(readline(prompt = "Type in the unit cost: "))
  while(C <= 0){
    C <- as.numeric(readline(prompt = "Error: type in a positive unit cost: "))
  }
  # Set carrying cost (interest rate)
  i <- as.numeric(readline(prompt = "Type in the carrying cost rate: "))
  while(i < 0 | i > 1){
    i <- as.numeric(readline(prompt = "Error: type in a positive carrying cost rate between 0 and 1: "))
  }
  H <- i*C
}

# Set shortage penalty cost per unit (varibale cost)
b <- as.numeric(readline(prompt = "Type in the shortage penalty cost per unit: "))
while(b < 0){
  b <- as.numeric(readline(prompt = "Error: type in a positive shortage penalty cost: "))
}

# Set safety stock
ss <- as.numeric(readline(prompt = "Type in the safety stock: "))
while(ss < 0){
  ss <- as.numeric(readline(prompt = "Error: type in a positive safety stock: "))
}
  
# Get EOQ Results
Q <-EOQ(D, S, H, b)

EOQ <- as.numeric(Q[1])
print(paste("Economic Order Quantity:", ceiling(EOQ)))

number_of_orders <- as.numeric(D/Q[1])
print(paste("Number of orders per year:", ceiling(number_of_orders)))

cycle_time <- as.numeric(Q[2]*12)
print(paste("Time between cycles (months):", round(cycle_time, digits = 2)))

annual_ordering_cost <- as.numeric(D/Q[1]*S)
print(paste("Annual ordering cost:", round(annual_ordering_cost, digits = 2)))

annual_holding_cost <- as.numeric(Q[1]/2*H)
print(paste("Annual holding cost:", round(annual_holding_cost, digits = 2)))

total_cost <- as.numeric((D/Q[1]*S)+(Q[1]/2*H))
print(paste("Total cost:", round(total_cost, digits = 2)))

# Data frame construction

# Period column
period <- as.numeric(c(0, Q[2]*12))

while(period[length(period)] < 12){
  initial <- period[length(period)]
  period <- append(period, initial)
  final <- period[length(period)] + (cycle_time)
  period <- append(period, final)
}

# Inventory column
initial_inventory <- as.numeric(c(Q[1]))
inventory <- initial_inventory

while(length(inventory) != length(period)){
  available_inventory <- 0
  inventory <- append(inventory, available_inventory)
  if(available_inventory == 0){
    if(length(inventory) != length(period)){
      available_inventory <- as.numeric(c(Q[1]))
      inventory <- append(inventory, available_inventory)
    }
  }
}

# Safety stock column
safety_stock <- c(rep(ss, length(period)))
  
# Add safety stock to available inventory
inventory <- inventory + safety_stock
  
# Construct inventory data frame
inventory_distribution <- data.frame(period, inventory, safety_stock)

if(safety_stock[1] != 0){
  
# Import ggplot2 package
library(ggplot2)
  
  # Build inventory graph considering safety stock
  ggplot(data = inventory_distribution, 
         aes(x = period)) +
    geom_line(aes(y = inventory,
                  col = "Available inventory")) +
    geom_line(aes(y = safety_stock,
                  col = "Safety stock")) +
    scale_x_continuous(breaks = c(0:12)) +
    ylim(c(0,max(inventory_distribution$inventory))) +
    labs(title = "Economic Order Quantity",
         subtitle = "Inventory Planning and Managing",
         x = "Month",
         y = "Inventory Level",
         caption = "Safety stock considered",
         color = NULL) +
    scale_color_manual(labels = c("Available inventory", "Safety stock"),
                       values = c("Available inventory" = "black", "Safety stock" = "red"))
  
} else {
  
  # Construct inventory data frame without considering safety stock
  inventory_distribution <- data.frame(period, inventory)
  
  # Import ggplot2 package
  library(ggplot2)
  
  # Build inventory graph without considering safety stock
  ggplot(data = inventory_distribution, 
         aes(x = period)) +
    geom_line(aes(y = inventory)) +
    scale_x_continuous(breaks = c(0:12)) +
    ylim(c(0,max(inventory_distribution$inventory))) +
    labs(title = "Economic Order Quantity",
         subtitle = "Inventory Planning and Managing",
         x = "Month",
         y = "Inventory Level",
         caption = "No safety stock considered")
  
}