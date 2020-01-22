### DESIGN OF EXPERIMENTS - 2^k FACTORIAL DESIGN ###

# Import SixSigma package
library(SixSigma)

# Design the experiment (2^3)
ExperimentDesign <- expand.grid(A = gl(2, 1, labels = c("-", "+")),
                           B = gl(2, 1, labels = c("-", "+")),
                           C = gl(2, 1, labels = c("-", "+")))
ExperimentDesign

# Randomize the experiment
ExperimentDesign$ord <- sample(1:8, 8)
ExperimentDesign[order(ExperimentDesign$ord), ]

# Create replicates
ss.data.doe1 <- data.frame(repl = rep(1:2, each = 8),
                           rbind(ExperimentDesign))
ss.data.doe1

# Add responses
ss.data.doe1$response <- c()
ss.data.doe1

# Get the average score for each experiment configuration
aggregate(response ~ A + B + C,
          FUN = mean, data = ss.data.doe1)

# Get restuls
doe.model <- lm(response ~ A + B + C +
                  A * B + A * C + B * C +
                  A * B * C,
                data = ss.data.doe1)
summary(doe.model)

# Simplify the model by excluding nonsignificant effects
doe.model.2 <- lm(response ~  + ,
                  data = ss.data.doe1)
summary(doe.model.2)

# Obtain model's coefficients
coef(doe.model.2)

# Obtain estimations for all experimental conditions (including the replications)
predict(doe.model.2)

# Compute confidence interval for each factor
confint(doe.model.2)

# Visualize graphically the main effects

# Factor A
plot(c(-1, 1), ylim = range(ss.data.doe1$response),
     coef(doe.model)[1] + c(-1, 1) * coef(doe.model)[2],
     type = "b", pch = 16)
abline(h = coef(doe.model)[1])

# Factor B
plot(c(-1, 1), ylim = range(ss.data.doe1$response),
     coef(doe.model)[1] + c(-1, 1) * coef(doe.model)[3],
     type = "b", pch = 16)
abline(h = coef(doe.model)[1])

# Factor C
plot(c(-1, 1), ylim = range(ss.data.doe1$response),
     coef(doe.model)[1] + c(-1, 1) * coef(doe.model)[4],
     type = "b", pch = 16)
abline(h = coef(doe.model)[1])

# Visualize the main effects in separate plots
prinEF <- data.frame(Factor = rep(c("", ""),each = 2),
                      Level = rep(c(-1, 1), 2),
                     Response = c(aggregate(response ~ , FUN = mean, data = ss.data.doe1)[, 2],
                                aggregate(response ~ , FUN = mean, data = ss.data.doe1)[, 2]))
library(ggplot2)
main_effects <- ggplot(prinEF,
             aes(x = Level, y = Response)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = c(-1, 1)) +
  facet_grid(. ~ Factor)
main_effects

# Plot the effects of the interactions
intEf <- aggregate(response ~  + ,
                   FUN = mean, data = ss.data.doe1)
effects_interaction <- ggplot(intEf, aes(x = , y = response, color = )) +
  geom_point() + 
  geom_line(aes(group = ))
effects_interaction

# Residuals plots standard chart
par(mfrow=c(2, 2))
plot(doe.model.2)
box("outer")

# Check normality of the residuals with a normality test
shapiro.test(residuals(doe.model.2))

# EXAMPLE

library(SixSigma)

ExperimentDesign <- expand.grid(A = gl(2, 1, labels = c("-", "+")),
                                B = gl(2, 1, labels = c("-", "+")),
                                C = gl(2, 1, labels = c("-", "+")))
ExperimentDesign

ExperimentDesign$ord <- sample(1:8, 8)
ExperimentDesign[order(ExperimentDesign$ord), ]

ss.data.doe1 <- data.frame(repl = rep(1:2, each = 8),
                           rbind(ExperimentDesign))
ss.data.doe1


ss.data.doe1$response <- c(5.33, 6.99, 4.23, 6.61,
                           2.26, 5.75, 3.26, 6.24,
                            5.7, 7.71, 5.13, 6.76,
                           2.79, 4.57, 2.48, 6.18)
ss.data.doe1


aggregate(response ~ A + B + C,
          FUN = mean, data = ss.data.doe1)


doe.model <- lm(response ~ A + B + C + A * B + A * C + B * C + A * B * C,
                data = ss.data.doe1)
summary(doe.model)


doe.model.2 <- lm(response ~ A + C,
                  data = ss.data.doe1)
summary(doe.model.2)

coef(doe.model.2)
predict(doe.model.2)
confint(doe.model.2)


plot(c(-1, 1), ylim = range(ss.data.doe1$response),
     coef(doe.model)[1] + c(-1, 1) * coef(doe.model)[2],
     type = "b", pch = 16)
abline(h = coef(doe.model)[1])

plot(c(-1, 1), ylim = range(ss.data.doe1$response),
     coef(doe.model)[1] + c(-1, 1) * coef(doe.model)[3],
     type = "b", pch = 16)
abline(h = coef(doe.model)[1])

plot(c(-1, 1), ylim = range(ss.data.doe1$response),
     coef(doe.model)[1] + c(-1, 1) * coef(doe.model)[4],
     type = "b", pch = 16)
abline(h = coef(doe.model)[1])

prinEF <- data.frame(Factor = rep(c("A", "C"),each = 2),
                     Level = rep(c(-1, 1), 2),
                     Response = c(aggregate(response ~ A, FUN = mean, data = ss.data.doe1)[, 2],
                                  aggregate(response ~ C, FUN = mean, data = ss.data.doe1)[, 2]))
library(ggplot2)
main_effects <- ggplot(prinEF,
                       aes(x = Level, y = Response)) +
  geom_point() +
  geom_line() +
  scale_x_continuous(breaks = c(-1, 1)) +
  facet_grid(. ~ Factor)
main_effects

intEf <- aggregate(response ~ A + C,
                   FUN = mean, data = ss.data.doe1)
effects_interaction <- ggplot(intEf, aes(x = A, y = response, color = C)) +
  geom_point() + 
  geom_line(aes(group = C))
effects_interaction

par(mfrow=c(2, 2))
plot(doe.model.2)
box("outer")

shapiro.test(residuals(doe.model.2))
