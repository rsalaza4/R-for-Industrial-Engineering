### OVERALL EQUIPMENT EFFECTIVENESS ###

# Create data frame
df <- data.frame(factor = c("Availability",
                            "Availability",
                            "Availability",
                            "Performance",
                            "Performance",
                            "Performance",
                            "Quality",
                            "Quality",
                            "Quality"),
                 concept = c("Total Available Time",
                             "Run Time",
                             "Time Losses",
                             "Production Capacity",
                             "Actual Production",
                             "Speed Losses",
                             "Product Output",
                             "Actual Good Products",
                             "Scrap Losses"),
                 group = c("A", "B", "B", "C", "D", "D", "E", "F", "F"),
                 percentage = c(100, rep(0, 8)),
                 status = c(1, 1, 0, 1, 1, 0, 1, 1, 0))

# Set the total available time
available_time <- as.numeric(readline(prompt = "Type in all the available time: "))
while(available_time <= 0){
  available_time <- as.numeric(readline(prompt = "Error! The total available time must be greater than 0: "))
}

# Set the actual run time
run_time <- as.numeric(readline(prompt = "Type in the actual run time: "))
while(run_time <= 0){
  run_time <- as.numeric(readline(prompt = "Error! The run time must be greater than 0: "))
}

# Calculate the run time percentage value
df$percentage[2] <- (run_time/available_time)*100

# Calculate the time losses percentage value
df$percentage[3] <- df$percentage[1] - df$percentage[2]

# Calculate the production capacity percentage value
df$percentage[4] <- df$percentage[2]

# Set the equipment maximum production capacity per unit time
maximum_production_per_unit_time <- as.numeric(readline(prompt = "Type in the equipment maximum production capacity per unit time: "))
while(maximum_production_per_unit_time <= 0){
  maximum_production_per_unit_time <- as.numeric(readline(prompt = "Error! The maximum production capacity per unit time must be greater than 0: "))
}

# Calculate the theoretical maximum production of the run
theoretical_maximum_production <- maximum_production_per_unit_time*run_time

# Set the number of items produced
actual_production <- as.numeric(readline(prompt = "Type in the number of items produced: "))
while(actual_production <= 0){
  actual_production <- as.numeric(readline(prompt = "Error! The number of items produced must be greater than 0: "))
}

# Calculate the actual production percentage value
df$percentage[5] <- actual_production/theoretical_maximum_production*df$percentage[4]

# Calculate the speed losses percentage value
df$percentage[6] <- df$percentage[4] - df$percentage[5]

# Calculate the product output percentage value
df$percentage[7] <- df$percentage[5]

# Set the total number of scrap units
scrap <- as.numeric(readline(prompt = paste("From the", actual_production, "units produced, how many were scrap? ")))
while(scrap < 0){
  scrap <- as.numeric(readline(prompt = "Error! The number of scrap units must be greater than or equal to 0: "))
}

# Calculate the actual good products percentage value
df$percentage[8] <- (1 - (scrap/actual_production))*df$percentage[7]

# Calculate the scrap losses percentage value
df$percentage[9] <- (scrap/actual_production)*df$percentage[7]

# Calculate the OEE
OEE <- (run_time/available_time)*(actual_production/theoretical_maximum_production)*(1-(scrap/actual_production))*100 

# Import ggplot2 package
library(ggplot2)

# Build OEE plot
ggplot(data = df, aes(x = group, 
                      y = percentage, 
                      fill = factor(status, levels = c(0, 1)))) + 
  geom_bar(stat = 'identity',
           colour = "black") +
  scale_x_discrete(limits = c("F", "E", "D", "C", "B", "A")) + 
  scale_fill_manual(name = c("Status"), 
                    values = c("red", "green"),
                    labels = c("Loss", "Profit"))  +
  labs(title = "Overall Equipment Effectivenss",
       subtitle = "Machine Name",
       x = "",
       y = "Percentage",
       caption = "Company Name") +
  geom_text(aes(x = 6, y = 0, label = "Total Available Time"), hjust = 0) +
  geom_text(aes(x = 5, y = 0, label = "Run Time"), hjust = 0) +
  geom_text(aes(x = 5, y = df$percentage[2], label = "Time \n Losses"), hjust = 0) +
  geom_text(aes(x = 4, y = 0, label = "Production Capacity"), hjust = 0) +
  geom_text(aes(x = 3, y = 0, label = "Actual Production"), hjust = 0) +
  geom_text(aes(x = 3, y = df$percentage[5], label = "Speed \n Losses"), hjust = 0) +
  geom_text(aes(x = 2, y = 0, label = "Product Output"), hjust = 0) + 
  geom_text(aes(x = 1, y = 0, label = "Actual Good Products"), hjust = 0) +
  geom_text(aes(x = 1, y = df$percentage[8], label = "Defective \n Units"), hjust = 0) +
  geom_text(aes(x = 1, y = 95, label = paste("OEE = ", OEE, "%"))) +
  geom_hline(yintercept = 40, size = 1, linetype = "dotted") +
  geom_text(aes(x = 0.5, y = 40, label = "Low")) +
  geom_hline(yintercept = 60, size = 1, linetype = "dotted") +
  geom_text(aes(x = 0.5, y = 60, label = "Typical")) +
  geom_hline(yintercept = 85, size = 1, linetype = "dotted") +
  geom_text(aes(x = 0.5, y = 85, label = "World Class")) +
  geom_hline(yintercept = 100, size = 1, linetype = "dotted") +
  geom_text(aes(x = 0.5, y = 100, label = "Perfect")) +
  coord_flip()

# EXAMPLE

df <- data.frame(factor = c("Availability",
                              "Availability",
                              "Availability",
                              "Performance",
                              "Performance",
                              "Performance",
                              "Quality",
                              "Quality",
                              "Quality"),
                 concept = c("Total Available Time",
                            "Run Time",
                            "Time Losses",
                            "Production Capacity",
                            "Actual Production",
                            "Speed Losses",
                            "Product Output",
                            "Actual Good Products",
                            "Scrap Losses"),
                 group = c("A", "B", "B", "C", "D", "D", "E", "F", "F"),
                 percentage = c(100, rep(0, 8)),
                 status = c(1, 1, 0, 1, 1, 0, 1, 1, 0))

available_time <- 100
run_time <- 85

df$percentage[2] <- (run_time/available_time)*100
df$percentage[3] <- df$percentage[1] - df$percentage[2]
df$percentage[4] <- df$percentage[2]

maximum_production_per_unit_time <- 10
theoretical_maximum_production <- maximum_production_per_unit_time*run_time
actual_production <- 700

df$percentage[5] <- actual_production/theoretical_maximum_production*df$percentage[4]
df$percentage[6] <- df$percentage[4] - df$percentage[5]
df$percentage[7] <- df$percentage[5]
  
scrap <- 50

df$percentage[8] <- (1 - (scrap/actual_production))*df$percentage[7]
df$percentage[9] <- (scrap/actual_production)*df$percentage[7]

OEE <- (run_time/available_time)*(actual_production/theoretical_maximum_production)*(1-(scrap/actual_production))*100 

library(ggplot2)

ggplot(data = df, aes(x = group, 
               y = percentage, 
               fill = factor(status, levels = c(0, 1)))) + 
  geom_bar(stat = 'identity',
           colour = "black") +
  scale_x_discrete(limits = c("F", "E", "D", "C", "B", "A")) + 
  scale_fill_manual(name = c("Status"), 
                    values = c("red", "green"),
                    labels = c("Loss", "Profit"))  +
  labs(title = "Overall Equipment Effectivenss",
       subtitle = "Machine Name",
       x = "",
       y = "Percentage",
       caption = "Company Name") +
  geom_text(aes(x = 6, y = 0, label = "Total Available Time"), hjust = 0) +
  geom_text(aes(x = 5, y = 0, label = "Run Time"), hjust = 0) +
  geom_text(aes(x = 5, y = df$percentage[2], label = "Time \n Losses"), hjust = 0) +
  geom_text(aes(x = 4, y = 0, label = "Production Capacity"), hjust = 0) +
  geom_text(aes(x = 3, y = 0, label = "Actual Production"), hjust = 0) +
  geom_text(aes(x = 3, y = df$percentage[5], label = "Speed \n Losses"), hjust = 0) +
  geom_text(aes(x = 2, y = 0, label = "Product Output"), hjust = 0) + 
  geom_text(aes(x = 1, y = 0, label = "Actual Good Products"), hjust = 0) +
  geom_text(aes(x = 1, y = df$percentage[8], label = "Defective \n Units"), hjust = 0) +
  geom_text(aes(x = 1, y = 95, label = paste("OEE = ", OEE, "%"))) +
  geom_hline(yintercept = 40, size = 1, linetype = "dotted") +
  geom_text(aes(x = 0.5, y = 40, label = "Low")) +
  geom_hline(yintercept = 60, size = 1, linetype = "dotted") +
  geom_text(aes(x = 0.5, y = 60, label = "Typical")) +
  geom_hline(yintercept = 85, size = 1, linetype = "dotted") +
  geom_text(aes(x = 0.5, y = 85, label = "World Class")) +
  geom_hline(yintercept = 100, size = 1, linetype = "dotted") +
  geom_text(aes(x = 0.5, y = 100, label = "Perfect")) +
  coord_flip()
