### NEWSVENDOR PROBLEM ###

# Import SCperf package
library(SCperf)

# Set mean demand
D <- as.numeric(readline(prompt = "Type in the mean demand: "))
while(D <= 0){
  D <- as.numeric(readline(prompt = "Error: type in a positive mean demand: "))
}

# Set standard deviation of the demand (in units)
sd <- as.numeric(readline(prompt = "Type in the standard deviation of the demand (in units): "))
while(sd < 0){
  sd <- as.numeric(readline(prompt = "Error: type in a positive standard deviation of the demand (in units): "))
}

# Set selling price
p <- as.numeric(readline(prompt = "Type in the selling price: "))
while(p <= 0){
  p <- as.numeric(readline(prompt = "Error: type in a positive selling price: "))
}

# Set unit cost
c <- as.numeric(readline(prompt = "Type in the unit cost: "))
while(c > p){
  c <- as.numeric(readline(prompt = "Error: the unit cost must be lower than the seeling price: "))
}

# Set salvage value
s <- as.numeric(readline(prompt = "Type in the unit salvage value: "))
while(c < s){
  s <- as.numeric(readline(prompt = "Error: type in salvage value lower than the unit cost: "))
}

# Get Newsboy Model Results 
Newsboy <- Newsboy(D, sd, p, c, s)

Q <- as.numeric(Newsboy[1])
print(paste("Optimal order-up-to quantity:", ceiling(Q)))

SS <- as.numeric(Newsboy[2])
print(paste("Safety stock:", ceiling(SS)))

ExpC <- as.numeric(Newsboy[3])
print(paste("Expected cost:", round(ExpC, 2)))

ExpP <- as.numeric(Newsboy[4])
print(paste("Expected profit:", round(ExpP, 2)))

# Build Normal Distribution Plot
x <- seq(D-(3.5*sd), D+(3.5*sd), by = .1)
y <- dnorm(x, mean = D, sd = sd)
plot(x, y, 
     type = "l",
     lwd = 2,
     xlab = "Demand",
     ylab = "Probability Density", 
     main = "Newsvendor Model - Demand Distribution ",
     sub = "Inventory Planning and Managing",
     xlim = c(D-(3.5*sd), D+(3.5*sd)))
abline(h = 0)

# Shade first half of the plot
x <- seq(D-(3.5*sd), D, by = .1)
y <- dnorm(x, mean = D, sd = sd)
polygon(c(D-(3.5*sd), x, D), c(0, y, 0), col = "light gray")

# Shade safety stock part of the plot
x <- seq(D, Newsboy[1], by = .1)
y <- dnorm(x, mean = D, sd = sd)
polygon(c(D, x, Newsboy[1]), c(0, y, 0), col = "light blue")

# Add text to the plot
ss <- as.numeric(pnorm(Newsboy[1], mean = D ,sd = sd) - 0.5)
text(Newsboy[1], 0, ceiling(Newsboy[1]), adj = c(0.5, 0.5))
text(Newsboy[1] - Newsboy[2], 0, paste(round(ss*100, 1), "%"), adj = c(-0.25, -10))
text(Newsboy[1] - Newsboy[2], 0, "50 %", adj = c(1.2, -10))
