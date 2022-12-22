###  ECONOMIC PRODUCTION QUANTITY ###

# Import SCperf package
library(SCperf)

# Set  annual quantity demanded
D <- as.numeric(readline(prompt = "Type in the annual demand: "))
while(D <= 0){
  D <- as.numeric(readline(prompt = "Error: type in a positive annual demand: "))
}

# Set annual production rate
P <- as.numeric(readline(prompt = "Type in the annual production rate: "))
while(P <= 0){
  P <- as.numeric(readline(prompt = "Error: type in a positive production rate: "))
}

# Set cost per production run
K <- as.numeric(readline(prompt = "Type in the cost per production run: "))
while(K <= 0){
  K <- as.numeric(readline(prompt = "Error: type in a positive cost per production run: "))
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

# Get EPQ Results
Q <- EPQ(D, P, K, H)

EPQ <- as.numeric(Q[1])
print(paste("Economic Production Quantity:", ceiling(EPQ)))

production_cycle_length <- as.numeric(Q[3]*12)
print(paste("Production cycle length (months):", round(production_cycle_length, digits = 2)))

number_of_production_runs <- as.numeric(D/Q[1])
print(paste("Number of production runs per year:", ceiling(number_of_production_runs)))

production_run_length <- as.numeric(Q[2]*12)
print(paste("Production run length (months):", round(production_run_length, digits = 2)))

demand_period_length <- as.numeric(Q[2]*12)
print(paste("Demand period length (months):", round(production_cycle_length-production_run_length, digits = 2)))

annual_production_cost <- as.numeric(number_of_production_runs*K)
print(paste("Annual production run cost:", round(annual_production_cost, digits = 2)))

annual_holding_cost <- as.numeric((EPQ/2)*(1-(D/P))*H)
print(paste("Annual holding cost:", round(annual_holding_cost, digits = 2)))

maximum_inventory <- as.numeric_version(Q[4])
print(paste("Maximum inventory per cycle:", maximum_inventory))

total_cost <- as.numeric(Q[5])
print(paste("Total cost:", round(total_cost, digits = 2)))

# Data frame construction

# Period column
period <- as.numeric(c(0, Q[2]*12, Q[3]*12))

while(period[length(period)] < 12){
  period <- append(period, as.numeric(period[length(period)] + Q[2]*12))
  period <- append(period, as.numeric(period[length(period)] + ((Q[3]*12) - (Q[2]*12))))
}

# Inventory column
inventory <- as.numeric(c(0, Q[4], 0))

while(length(inventory) < length(period)){
  inventory <- append(inventory, as.numeric(Q[4]))
  inventory <- append(inventory, 0)
}

# Production rate column (for visualization purposes)
production <- c(0, as.numeric(Q[1]))

while(length(production) < length(period)){
  production <- append(production, NA)
}

# Construct inventory data frame
inventory_distribution <- data.frame(period, inventory, production)

# Import ggplot2 package
library(ggplot2)

# Build inventory graph
ggplot(data = inventory_distribution, 
       aes(x = period)) +
  geom_line(aes(y = inventory,
                col = "Accumulated inventory")) +
  geom_line(aes(y = production, 
                col = "Production rate"), 
            linetype = "dashed") +
  scale_x_continuous(breaks = c(0:12)) +
  labs(title = "Economic Production Quantity",
       subtitle = "Inventory Planning and Managing",
       x = "Month",
       y = "Inventory Level",
       color = NULL) +
  scale_color_manual(labels = c("Accumulated inventory", "Production rate"),
                     values = c("Accumulated inventory"  ="black", "Production rate" = "blue"))
