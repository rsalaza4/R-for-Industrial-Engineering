### CAUSE-AND-EFFECT DIAGRAM (SixSigma) ###

# Import the SixSigma package
library(SixSigma)

# Specify the effect to be analyzed
b.effect <- ""

# Create a vector with the names of the causes classification groups
b.groups <- c("Measurement", "Material", "Machine", "Monther Nature", "Man Power", "Method")

# Create a vector that contains the causes
b.causes <- c(vector(mode = "list",length = length(b.groups)))

# Create lists corresponding to the causes for each corresponding group
b.causes[1] <- list(c("", "", ""))
b.causes[2] <- list(c("", "", ""))
b.causes[3] <- list(c("", "", ""))
b.causes[4] <- list(c("", "", ""))
b.causes[5] <- list(c("", "", ""))
b.causes[6] <- list(c("", "", ""))

# Create the cause-and-effect diagram
ss.ceDiag(b.effect,
          b.groups,
          b.causes,
          main = "Cause-and-Effect Diagram (SixSigma package)",
          sub = "")

# EXAMPLE

library(SixSigma)

b.effect <- "Delay"

b.groups <- c("Personnel", "Weather", "Suppliers", "Planning")

b.causes <- c(vector(mode = "list", length = length(b.groups)))

b.causes[1] <- list(c("Training", "Inadequate"))
b.causes[2] <- list(c("Rain", "Temperature", "Wind"))
b.causes[3] <- list(c("Materials", "Delays", "Rework"))
b.causes[4] <- list(c("Customer", "Permissions", "Errors"))

ss.ceDiag(b.effect,
          b.groups,
          b.causes,
          main = "Cause-and-Effect Diagram (SixSigma package)",
          sub = "Construction Example")