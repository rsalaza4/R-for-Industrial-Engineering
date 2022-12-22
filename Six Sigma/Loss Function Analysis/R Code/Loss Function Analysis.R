### LOSS FUNCTION ANALYSIS ###

# Set the target value
target <- as.numeric(readline(prompt = "Type in the target value: "))
while(target <= 0){
  target <- as.numeric(readline(prompt = "Error! The target value must be greater than 0: "))
}

# Set the tolerance value
tolerance <- as.numeric(readline(prompt = "Type in the tolerance value: "))
while(tolerance <= 0){
  tolerance <- as.numeric(readline(prompt = "Error! The tolerance value must be greater than 0: "))
}

# Set the cost estimation per unit
L0 <- as.numeric(readline(prompt = "Type in the cost estimation per unit: "))
while(L0 <= 0){
  L0 <- as.numeric(readline(prompt = "Error! The cost estimation must be greater than 0: "))
}

# Define the total number of parts/products/pieces produced
N <- as.numeric(readline(prompt = "Type in the total number of parts/products/pieces produced: "))
while(N <= 0){
  N <- as.numeric(readline(prompt = "Error! The total number of parts/products/pieces produced must be greater than 0: "))
}

# Set the sample size to be measured
n <- as.numeric(readline(prompt = "Type in the sample size to be measured: "))
while(n <= 0){
  n <- as.numeric(readline(prompt = "Error! The sample size must be greater than 0: "))
}

# Build dummy data set
sample <- data.frame(length = rnorm(n, mean = target, sd = tolerance/3))

# Obtain the k value
k <- L0/tolerance

# Obtain the mean squared deviation
MSD <- sum((sample$length - target)^2)/length(sample$length)

# Obtain the average loss per unit in the sample
L <- k*MSD

# Obtain the total loss of the process
TL <- L*N

# Import ggplot2 package
library(ggplot2)

# Build Loss Function Analysis plot
loss_function <- function(x) k*(x-target)^2
lfa_plot <- ggplot(data = data.frame(x = 0), mapping = aes(x = x))
lfa_plot + stat_function(fun = loss_function, size = 1.3) + 
  xlim(target - tolerance, target + tolerance) + 
  labs(title = "Loss Function Analysis",
       subtitle = "For Product Length",
       x = "Observed Value", 
       y = "Cost of Poor Quality",
       caption = "Six Sigma Project Name") +
  theme(plot.title = element_text(size = 18)) +
  theme(plot.caption = element_text(hjust = 0.5, color = "dark grey")) +
  geom_hline(yintercept = 0, size = 1.25) +
  geom_vline(xintercept = target, linetype = "dotted", size = 1) +
  geom_vline(xintercept = target - tolerance, linetype = "dashed") +
  geom_vline(xintercept = target + tolerance, linetype = "dashed") +
  geom_text(aes(x = target - 0.005, y = 0.05, label = "Target")) +
  geom_text(aes(x = target - tolerance + 0.005, y = 0.005, label = "LSL")) +
  geom_text(aes(x = target + tolerance - 0.005, y = 0.005, label = "USL"))

# Build summary data frame
summary <- data.frame(colnames(sample), target, tolerance, L0, round(mean(sample$length), 3), k, round(MSD, 5), round(L, 7), round(TL, 3))
colnames(summary) <- c("CTQ", "Target", "Tolerance", "Cost", "Mean_Squared_Error", "k", "MSD", "Average_Loss", "Total_Loss")

# Print summary data frame
print(summary)


# EXAMPLE

set.seed(42)

target <- 15
tolerance <- 0.05
L0 <- 1
N <- 100000
n <- 50

sample <- data.frame(length = rnorm(n, mean = target, sd = tolerance/3))
k <- L0/tolerance
MSD <- sum((sample$length - target)^2)/length(sample$length)
L <- k*MSD
TL <- L*N

library(ggplot2)

loss_function <- function(x) k*(x-target)^2
lfa_plot <- ggplot(data = data.frame(x = 0), mapping = aes(x = x))
lfa_plot + stat_function(fun = loss_function, size = 1.3) + 
  xlim(target - tolerance, target + tolerance) + 
  labs(title = "Loss Function Analysis",
       subtitle = "For Product Length",
       x = "Observed Value", 
       y = "Cost of Poor Quality",
       caption = "Six Sigma Project Name") +
  theme(plot.title = element_text(size = 18)) +
  theme(plot.caption = element_text(hjust = 0.5, color = "dark grey")) +
  geom_hline(yintercept = 0, size = 1.25) +
  geom_vline(xintercept = target, linetype = "dotted", size = 1) +
  geom_vline(xintercept = target - tolerance, linetype = "dashed") +
  geom_vline(xintercept = target + tolerance, linetype = "dashed") +
  geom_text(aes(x = target - 0.005, y = 0.05, label = "Target")) +
  geom_text(aes(x = target - tolerance + 0.005, y = 0.005, label = "LSL")) +
  geom_text(aes(x = target + tolerance - 0.005, y = 0.005, label = "USL"))

summary <- data.frame(colnames(sample), target, tolerance, L0, round(mean(sample$length), 3), k, round(MSD, 5), round(L, 7), round(TL, 3))
colnames(summary) <- c("CTQ", "Target", "Tolerance", "Cost", "Mean_Squared_Error", "k", "MSD", "Average_Loss", "Total_Loss")
print(summary)
