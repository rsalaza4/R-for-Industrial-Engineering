### ANOVA TABLE ###

# Import sixSigma package
library(SixSigma)

# ANOVA table for 2 factors
anova(lm( ~  +  + * ),                      # insert y variable (response) ~ A + B + A*B
      data = )                              # data refers to the data frame from which information is retreived

# ANOVA table for 3 factors
anova(lm( ~  +  +  + * + * + * + * * ),     # insert y variable (response) ~ A + B + C + A*B + A*C + B*C + A*B*C
      data = )

# EXAMPLE

library(SixSigma)

voltmeter <- factor(rep(1:2, each = 9))
battery <- factor(rep(rep(1:3, each = 3), 2))
run <- factor(rep(1:3,6))
voltage <- c(1.4727, 1.4206, 1.4754, 1.5083, 
             1.5739, 1.4341, 1.5517, 1.5483,
             1.4614, 1.3337, 1.6078, 1.4767,
             1.4066, 1.5951, 1.8419, 1.7087,
             1.8259, 1.5444)
batteries <- data.frame(voltmeter, battery, run, voltage)

anova(lm(voltage ~ battery + voltmeter + battery * voltmeter),
      data = batteries)