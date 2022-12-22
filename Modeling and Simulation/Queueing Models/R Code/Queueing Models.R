### QUEUEING MODELS ###

# Import queueing package
library(queueing)

# lambda = arrival rate
# mu = service rate
# c = number of servers
# k = system capacity
# n = number of customers in the system from which you want to obtain its probabilities. Put n = 0 for an idle probability.
# method = method of computation of the probabilities of k (system capacity) customers down: 
#   With method = 0, the exact results are calculated using the formal definition
#   With method = 1, aproximate results are calculated using Stirling aproximation of factorials and logarithms

# Set queue model input parameters (select one)
input_mm1 <- NewInput.MM1(lambda = , mu = , n = )
input_mm1k <- NewInput.MM1K(lambda = , mu = , k = )
input_mm1kk <- NewInput.MM1KK(lambda = , mu = , k = , method = )
input_mmc <- NewInput.MMC(lambda = , mu = , c = , method = )
input_mmcc <- NewInput.MMCC(lambda = , mu = , c = , method = )
input_mmck <- NewInput.MMCK(lambda = , mu = , c = , k = )
input_mmckk <- NewInput.MMCKK(lambda = , mu = , c = , k = )
input_mmckm <- NewInput.MMCKM(lambda = , mu = , c = , k = , method = )
input_mminf <- NewInput.MMInf(lambda = , mu = , n = )
input_mm1infkk <- NewInput.MMInfKK(lambda = , mu = , k = )

# Create queue class object (select one)
output_mm1 <- QueueingModel(input_mm1)
output_mm1k <- QueueingModel(input_mm1k)
output_mm1kk <- QueueingModel(input_mm1kk)
output_mmc <- QueueingModel(input_mmc)
output_mmcc <- QueueingModel(input_mmcc)
output_mmck <- QueueingModel(input_mmck)
output_mmckk <- QueueingModel(input_mmckk)
output_mmckm <- QueueingModel(input_mmckm)
output_mminf <- QueueingModel(input_mminf)
output_mminfkk <- QueueingModel(input_mminfkk)

# Get queue model report (select one)
Report(output_mm1)
Report(output_mm1k)
Report(output_mm1kk)
Report(output_mmc)
Report(output_mmcc)
Report(output_mmck)
Report(output_mmckk)
Report(output_mmckm)
Report(output_mminf)
Report(output_mminfkk)

# Get queue model summary (select one)
summary(output_mm1)
summary(output_mm1k)
summary(output_mm1kk)
summary(output_mmc)
summary(output_mmcc)
summary(output_mmck)
summary(output_mmckk)
summary(output_mmckm)
summary(output_mminf)
summary(output_mminfkk)

# Poisson Distribution Plot for Arrival Process
curve(dpois(x, input_mm$lambda),
      from = 0, 
      to = 20, 
      type = "b", 
      lwd = 2,
      xlab = "Number of customers",
      ylab = "Probability",
      main = "Poisson Distribution for Arrival Process",
      ylim = c(0, 0.25),
      n = 21)

# Exponential Distribution Plot for Interarrival Time
curve(dexp(x, rate = 1/input_mm$lambda),
      from = 0, 
      to = 10,
      type = "l", 
      lwd = 2,
      xlab = "Interarrival Time",
      ylab = "Probaility",
      main = "Exponential Distribution for Interarrival Time",
      ylim = c(0, 1))
abline(h = 0)

# Exponential Distribution Plot for Service Process
curve(dexp(x, rate = input_mm$mu),
      from = 0, 
      to = 5, 
      type = "l", 
      lwd = 2,
      xlab = "Service Waiting Time",
      ylab = "Probaility",
      main = "Exponential Distribution for Service Process",
      ylim = c(0, 1))
abline(h = 0)

# M/M/1 EXAMPLE 

library(queueing)

input_mm1 <- NewInput.MM1(lambda = 3, mu = 4, n = 0)

output_mm1 <- QueueingModel(input_mm1)

Report(output_mm1)

summary(output_mm1)

curve(dpois(x, input_mm1$lambda),
      from = 0, 
      to = 20, 
      type = "b", 
      lwd = 2,
      xlab = "Number of customers",
      ylab = "Probability",
      main = "Poisson Distribution for Arrival Process",
      ylim = c(0, 0.25),
      n = 21)

curve(dexp(x, rate = 1/input_mm1$lambda),
      from = 0, 
      to = 10,
      type = "l", 
      lwd = 2,
      xlab = "Interarrival Time",
      ylab = "Probaility",
      main = "Exponential Distribution for Interarrival Time",
      ylim = c(0, 1))
abline(h = 0)

curve(dexp(x, rate = input_mm1$mu),
      from = 0, 
      to = 5, 
      type = "l", 
      lwd = 2,
      xlab = "Service Waiting Time",
      ylab = "Probaility",
      main = "Exponential Distribution for Service Process",
      ylim = c(0, 1))
abline(h = 0)
