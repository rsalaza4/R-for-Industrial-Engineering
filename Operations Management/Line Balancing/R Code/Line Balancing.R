### LINE BALANCING ###

# Build process flow data frame (in sequential order)
df <- data.frame(operation = c(),
                 time = c(),
                 workstation = c())

# Set the number of hours per shift
shift_hours <- as.numeric(readline(prompt = "Type in the number of hours per shift: "))
while(shift_hours <= 0){
  shift_hours <- as.numeric(readline(prompt = "Error! The number of hours per shift must be greater than 0: "))
}

# Set the number of working days per month
working_days_in_month <- as.numeric(readline(prompt = "Type in the number of working days per month: "))
while(working_days_in_month <= 0){
  working_days_in_month <- as.numeric(readline(prompt = "Error! The number of working days per month must be greater than 0: "))
}

# Calculate the total available time
total_available_time <- shift_hours*working_days_in_month*3600  

# Set the monthly demand
demand <- as.numeric(readline(prompt = "Type in the monthly demand: "))
while(demand <= 0){
  demand <- as.numeric(readline(prompt = "Error! The monthly demand must be greater than 0: "))
}

# Calculate the takt time (i.e. rate at which units must be produced to fulfill demand)
takt_time <- total_available_time/demand

# Calculate the cycle time
cycle_time <- sum(df$time)

# Import ggplot package
library(ggplot2)

# Build current process flow bar plot
ggplot(data = df, aes(x = workstation, 
                      y = time,
                      fill = operation)) +
  geom_bar(stat = 'identity',
           colour = "black") +
  geom_hline(yintercept = takt_time, linetype = 'dashed') +
  scale_fill_discrete(breaks = df$operation) +
  scale_x_discrete(limits = df$workstation) +
  geom_text(aes(y = takt_time + 0.5, label = "Takt time")) +
  theme(legend.position = "bottom") +
  labs(title = "Current Workstations Distribution",
       subtitle = "Product Name",
       x = "Workstation",
       y = "Time (seconds)",
       caption = "Company Name")

# Calculate the line throughput time
individual_throughputs_times <- aggregate(df$time, by = list(Workstation = df$workstation), FUN=sum)
line_throughput_time <- max(individual_throughputs_times$x)
print(paste("Line throughput time:", line_throughput_time, "seconds per unit"))

# Validate that the line throughput time is lower than the takt time
if(line_throughput_time < takt_time){
  print("The line throughput time is lower than the takt time")
} else {
  print("Warning! The line throughput time is greater than the takt time!")
}

# Calculate the ideal number of workstations  
ideal_workstations <- ceiling((cycle_time*1.1)/takt_time)
print(paste("Ideal number of workstations required:", ideal_workstations))

# Determine if line balancing is necessary
if(ideal_workstations < length(unique(df$workstation))){
  print(paste("Line balancing is necessary! Reduce the number of workstations by ", length(unique(df$workstation)) - ideal_workstations))
} else {
  print("There is no need for line balancing")
}

# Perform line balancing

# Merge workstations
df_new <- data.frame(operation = df$operation,
                     time = df$time,
                     workstation = c())

# Validate that the number of workstations is the ideal one
if(length(unique(df_new$workstation)) == ideal_workstations){
  print("The number workstations is correct")
} else {
  print(paste("Error! Please assign only", ideal_workstations, "workstations"))
}

# Build optimized process flow bar plot
ggplot(data = df_new, aes(x = workstation, 
                          y = time,
                          fill = operation)) +
  geom_bar(stat = 'identity',
           colour = "black") +
  geom_hline(yintercept = takt_time, linetype = 'dashed') +
  scale_fill_discrete(breaks = df_new$operation) +
  scale_x_discrete(limits = df_new$workstation) +
  geom_text(aes(y = takt_time + 0.5, label = "Takt time")) +
  theme(legend.position = "bottom") +
  labs(title = "Optimized Workstations Distribution",
       subtitle = "Product Name",
       x = "Workstation",
       y = "Time (seconds)",
       caption = "Company Name")

# Calculate the new line throughput time
individual_throughputs_times_new <- aggregate(df_new$time, by = list(Workstation = df_new$workstation), FUN=sum)
line_throughput_time_new <- max(individual_throughputs_times_new$x)
print(paste("New line throughput time:", line_throughput_time_new, "seconds per unit"))

# Validate that the new line throughput time is lower than the takt time
if(line_throughput_time_new < takt_time){
  print("The line throughput time is lower than the takt time")
} else {
  print("Warning! The line throughput time is greater than the takt time!")
}

# Calculate the line efficiency before balancing
line_efficiency_before_balancing <- round(sum(df$time)/(max(df$workstation)*takt_time)*100, 2)
print(paste("Line efficiency before balancing:", line_efficiency_before_balancing, "%"))

# Calculate the line efficiency after balancing
line_efficiency_after_balancing <- round(sum(df_new$time)/(max(df_new$workstation)*takt_time)*100, 2)
print(paste("Line efficiency after balancing:", line_efficiency_after_balancing, "%"))

# Calculate the line efficiency improvement
line_efficiency_improvement <- line_efficiency_after_balancing - line_efficiency_before_balancing
print(paste("Line efficiency improvement", line_efficiency_improvement, "%"))

# EXAMPLE

df <- data.frame(operation = c("Tracing", "Cutting", "Adhering"),
                 time = c(5, 6, 13),
                 workstation = c(1, 2, 3))

shift_hours <- 7.5
working_days_in_month <- 20
total_available_time <- shift_hours*working_days_in_month*3600  
demand <- 36000

takt_time <- total_available_time/demand
cycle_time <- sum(df$time)

library(ggplot2)

ggplot(data = df, aes(x = workstation, 
                      y = time,
                      fill = operation)) +
  geom_bar(stat = 'identity',
           colour = "black") +
  geom_hline(yintercept = takt_time, linetype = 'dashed') +
  scale_fill_discrete(breaks = df$operation) +
  scale_x_discrete(limits = df$workstation) +
  geom_text(aes(y = takt_time + 0.5, label = "Takt time")) +
  theme(legend.position = "bottom") +
  labs(title = "Current Workstations Distribution",
       subtitle = "Product Name",
       x = "Workstation",
       y = "Time (seconds)",
       caption = "Company Name")

individual_throughputs_times <- aggregate(df$time, by = list(Workstation = df$workstation), FUN=sum)
line_throughput_time <- max(individual_throughputs_times$x)
print(paste("Line throughput time:", line_throughput_time, "seconds per unit"))

if(line_throughput_time < takt_time){
  print("The line throughput time is lower than the takt time")
} else {
  print("Warning! The line throughput time is greater than the takt time!")
}

ideal_workstations <- ceiling((cycle_time*1.1)/takt_time)
print(paste("Ideal number of workstations required:", ideal_workstations))

if(ideal_workstations < length(unique(df$workstation))){
  print(paste("Line balancing is necessary! Reduce the number of workstations by ", length(unique(df$workstation)) - ideal_workstations))
} else {
  print("There is no need for line balancing")
}

# Perform line balancing

df_new <- data.frame(operation = df$operation,
                 time = df$time,
                 workstation = c(1, 1, 2))

if(length(unique(df_new$workstation)) == ideal_workstations){
  print("The number workstations is correct")
} else {
  print(paste("Error! Please assign only", ideal_workstations, "workstations"))
}

ggplot(data = df_new, aes(x = workstation, 
                      y = time,
                      fill = operation)) +
  geom_bar(stat = 'identity',
           colour = "black") +
  geom_hline(yintercept = takt_time, linetype = 'dashed') +
  scale_fill_discrete(breaks = df_new$operation) +
  scale_x_discrete(limits = df_new$workstation) +
  geom_text(aes(y = takt_time + 0.5, label = "Takt time")) +
  theme(legend.position = "bottom") +
  labs(title = "Optimized Workstations Distribution",
       subtitle = "Product Name",
       x = "Workstation",
       y = "Time (seconds)",
       caption = "Company Name")

individual_throughputs_times_new <- aggregate(df_new$time, by = list(Workstation = df_new$workstation), FUN=sum)
line_throughput_time_new <- max(individual_throughputs_times_new$x)
print(paste("New line throughput time:", line_throughput_time_new, "seconds per unit"))

if(line_throughput_time_new < takt_time){
  print("The line throughput time is lower than the takt time")
} else {
  print("Warning! The line throughput time is greater than the takt time!")
}

line_efficiency_before_balancing <- round(sum(df$time)/(max(df$workstation)*takt_time)*100, 2)
print(paste("Line efficiency before balancing:", line_efficiency_before_balancing, "%"))

line_efficiency_after_balancing <- round(sum(df_new$time)/(max(df_new$workstation)*takt_time)*100, 2)
print(paste("Line efficiency after balancing:", line_efficiency_after_balancing, "%"))

line_efficiency_improvement <- line_efficiency_after_balancing - line_efficiency_before_balancing
print(paste("Line efficiency improvement", line_efficiency_improvement, "%"))

# Wrong example of line balancing

df_wrong <- data.frame(operation = c("Tracing", "Cutting", "Adhering"),
                     time = c(5, 6, 13),
                     workstation = c(1, 2, 2))

ggplot(data = df_wrong, aes(x = workstation, 
                          y = time,
                          fill = operation)) +
  geom_bar(stat = 'identity',
           colour = "black") +
  geom_hline(yintercept = takt_time, linetype = 'dashed') +
  scale_fill_discrete(breaks = df_wrong$operation) +
  scale_x_discrete(limits = df_wrong$workstation) +
  geom_text(aes(y = takt_time + 0.5, label = "Takt time")) +
  theme(legend.position = "bottom") +
  labs(title = "Wrong Workstations Distribution",
       subtitle = "Product Name",
       x = "Workstation",
       y = "Time",
       caption = "Company Name")

individual_throughputs_times_wrong <- aggregate(df_wrong$time, by = list(Workstation = df_wrong$workstation), FUN=sum)
line_throughput_time_wrong <- max(individual_throughputs_times_wrong$x)
print(paste("Line throughput time:", line_throughput_time_wrong, "seconds per unit"))

if(line_throughput_time_wrong < takt_time){
  print("The line throughput time is lower than the takt time")
} else {
  print("Warning! The line throughput time is greater than the takt time!")
}
