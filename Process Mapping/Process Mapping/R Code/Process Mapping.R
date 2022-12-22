### PROCESS MAP ###

# Import grid package
library(grid)

# Import SixSigma package
library(SixSigma)

# Declare process inputs
inputs <- c("","","","","")

# Declare process outputs
outputs <- c("","","","","")

# Declare the project steps
steps <- c("","","","","")

# Declare the names of the inputs of each step in lists
io <- list()
io[[1]] <- list("","","")
io[[2]] <- list("","","")
io[[3]] <- list("","","")
io[[4]] <- list("","","")
io[[5]] <- list("","","")

# Declare the parameters of each step and classify them appropriately

# LEGEND:

# C = Controllable
# Cr = Critical
# N = Noise
# P - Procedure

param <- list()
param[[1]] <- list(c("","C"),
                   c("","Cr"),
                   c("","N"),
                   c("","P"))
param[[2]] <- list(c("","C"),
                   c("","Cr"),
                   c("","N"),
                   c("","P"))
param[[3]] <- list(c("","C"),
                   c("","Cr"),
                   c("","N"),
                   c("","P"))
param[[4]] <- list(c("","C"),
                   c("","Cr"),
                   c("","N"),
                   c("","P"))
param[[5]] <- list(c("","C"),
                   c("","Cr"),
                   c("","N"),
                   c("","P"))

# Declare the features of each step
feat <- list()
feat[[1]] <- list("","","")
feat[[2]] <- list("","","")
feat[[3]] <- list("","","")
feat[[4]] <- list("","","")
feat[[5]] <- list("","","")

# Draw Process Map with the SixSigma package
ss.pMap(steps,inputs,outputs,io,param,feat,sub = "")

# EXAMPLE

library(grid)
library(SixSigma)

inputs <- c("Ingredients", "Cook", "Oven", "Plates")

outputs <- c("Temperature", "Taste", "Tenderness", "Weight", "Radius", "Time")

steps <- c("DOUGH","TOPPINGS","BAKE","DELIVER")

io <- list()
io[[1]] <- list("X's")
io[[2]] <- list("Dough", "Ingredients", "Cooker")
io[[3]] <- list("Raw Pizza", "Cooker", "Oven Plate")
io[[4]] <- list("Baked Pizza", "Plate")

param <- list()
param[[1]] <- list(c("Cook", "C"),
                   c("Flour brand", "C"),
                   c("Prop water", "P"))
param[[2]] <- list(c("Cook", "C"),
                   c("Ing. Brand", "Cr"),
                   c("Amount", "P"))
param[[3]] <- list(c("Cook", "C"),
                   c("Queue", "N"),
                   c("Baketime", "Cr"))
param[[4]] <- list(c("Waiter", "C"),
                   c("Queue", "N"))

feat <- list()
feat[[1]] <- list("Density", "Toughness", "Thickness")
feat[[2]] <- list("Diameter", "Weight", "Thickness")
feat[[3]] <- list("Temperature", "Tenderness", "Taste")
feat[[4]] <- list("Temperature", "Taste", "Tenderness", "Weight", "Radius", "Time")

ss.pMap(steps,inputs,outputs,io,param,feat,sub = "Pizza Process Project")
