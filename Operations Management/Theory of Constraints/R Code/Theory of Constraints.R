### THEORY OF CONSTRAINTS ###

# Build process flow's machine capacities data frame (in sequential order)
df <- data.frame(machine = c(),
                 capacity = c())

# Add "bottleneck" column to data frame
df$bottleneck <- rep("No", length(df$capacity))

# Identify the process bottleneck
df$bottleneck[which.min(df$capacity)] <- "Yes"

# Import ggplot2 package
library(ggplot2)

# Build machines' capacities bar plot
ggplot(data = df, aes(x = machine, 
                      y = capacity,
                      fill = bottleneck)) +
  geom_bar(stat = 'identity',
           colour = "black") +
  scale_x_discrete(limits = df$machine) +
  scale_fill_manual(name = c("Bottleneck"), 
                    values = c("light green", "red"),
                    labels = c("No", "Yes")) +
  geom_hline(yintercept = 0) +
  geom_hline(yintercept = min(df$capacity), linetype = "dashed") +
  geom_text(aes(x = which.min(df$capacity), y = min(df$capacity)/2, label = "Bottleneck")) +
  labs(title = "Workstations Capacity Analysis",
       subtitle = "Product Name",
       x = "Machine",
       y = "Capacity (units/hour)",
       caption = "Company Name")

# First Iteration

# Increase the machine's capacity where the bottleneck is
df$capacity[which.min(df$capacity)] <- as.numeric(readline(prompt = "Type in the new capacity: "))

# Reset "bottleneck" column on data frame
df$bottleneck <- rep("No", length(df$capacity))

# Identify the process bottleneck
df$bottleneck[which.min(df$capacity)] <- "Yes"

# Build  machines' new capacities bar plot
ggplot(data = df, aes(x = machine, 
                      y = capacity,
                      fill = bottleneck)) +
  geom_bar(stat = 'identity',
           colour = "black") +
  scale_x_discrete(limits = df$machine) +
  scale_fill_manual(name = c("Bottleneck"), 
                    values = c("light green", "red"),
                    labels = c("No", "Yes")) +
  geom_hline(yintercept = 0) +
  geom_hline(yintercept = min(df$capacity), linetype = "dashed") +
  geom_text(aes(x = which.min(df$capacity), y = min(df$capacity)/2, label = "Bottleneck")) +
  labs(title = "Workstations Capacity Analysis",
       subtitle = "Product Name",
       x = "Machine",
       y = "Capacity (units/hour)",
       caption = "Company Name")

# Continue iterations...

# EXAMPLE

df <- data.frame(machine = c("A", "B", "C", "D", "E"),
                 capacity = c(2, 5, 4, 3, 4))

df$bottleneck <- rep("No", length(df$capacity))

df$bottleneck[which.min(df$capacity)] <- "Yes"

library(ggplot2)

ggplot(data = df, aes(x = machine, 
                      y = capacity,
                      fill = bottleneck)) +
  geom_bar(stat = 'identity',
           colour = "black") +
  scale_x_discrete(limits = df$machine) +
  scale_fill_manual(name = c("Bottleneck"), 
                    values = c("light green", "red"),
                    labels = c("No", "Yes")) +
  geom_hline(yintercept = 0) +
  geom_hline(yintercept = min(df$capacity), linetype = "dashed") +
  geom_text(aes(x = which.min(df$capacity), y = min(df$capacity)/2, label = "Bottleneck")) +
  labs(title = "Workstations Capacity Analysis",
       subtitle = "Product Name",
       x = "Machine",
       y = "Capacity (units/hour)",
       caption = "Company Name")

# First Iteration

df$capacity[which.min(df$capacity)] <- 4

df$bottleneck <- rep("No", length(df$capacity))

df$bottleneck[which.min(df$capacity)] <- "Yes"

ggplot(data = df, aes(x = machine, 
                      y = capacity,
                      fill = bottleneck)) +
  geom_bar(stat = 'identity',
           colour = "black") +
  scale_x_discrete(limits = df$machine) +
  scale_fill_manual(name = c("Bottleneck"), 
                    values = c("light green", "red"),
                    labels = c("No", "Yes")) +
  geom_hline(yintercept = 0) +
  geom_hline(yintercept = min(df$capacity), linetype = "dashed") +
  geom_text(aes(x = which.min(df$capacity), y = min(df$capacity)/2, label = "Bottleneck")) +
  labs(title = "Workstations Capacity Analysis",
       subtitle = "Product Name",
       x = "Machine",
       y = "Capacity (units/hour)",
       caption = "Company Name")

# Second Iteration

df$capacity[which.min(df$capacity)] <- 6

df$bottleneck <- rep("No", length(df$capacity))

df$bottleneck[which.min(df$capacity)] <- "Yes"

ggplot(data = df, aes(x = machine, 
                      y = capacity,
                      fill = bottleneck)) +
  geom_bar(stat = 'identity',
           colour = "black") +
  scale_x_discrete(limits = df$machine) +
  scale_fill_manual(name = c("Bottleneck"), 
                    values = c("light green", "red"),
                    labels = c("No", "Yes")) +
  geom_hline(yintercept = 0) +
  geom_hline(yintercept = min(df$capacity), linetype = "dashed") +
  geom_text(aes(x = which.min(df$capacity), y = min(df$capacity)/2, label = "Bottleneck")) +
  labs(title = "Workstations Capacity Analysis",
       subtitle = "Product Name",
       x = "Machine",
       y = "Capacity (units/hour)",
       caption = "Company Name")
