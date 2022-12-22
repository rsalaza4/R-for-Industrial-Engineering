### TWO-STAGE PROCESS MAPPING ###

# Import grid package
library(grid)

# Import SixSigma package
library(SixSigma)

# Build Box 1
grid.roundrect(width = 0.25,                      # width refers to the boxes' width
               height = unit(2.6, "inches"),      # height refers to the boxes' height
               x = 0.25)                          # x refers to the x position of the box
grid.text("INPUTS\n\n\n\n\n",                     # type in text to be displayed
          x = 0.25,                               # x refers to the x position of the text
          y = .6,                                 # y refers to the y position of the text  
          just = "top")                           # just refers to the text justification

# Build Box 2
grid.roundrect(width = 0.25,                      # width refers to the boxes' width
               height = unit(2.6, "inches"),      # height refers to the boxes' height
               x = 0.75)                          # x refers to the x position of the box
grid.text("OUTPUTS\n\n\n\n\n\n\n",                # type in text to be displayed
          x = 0.75,                               # x refers to the x position of the text
          y = .6,                                 # y refers to the y position of the text
          just = "top")                           # just refers to the text justification

# Create connecting Lines
grid.lines(x = c(0.375, 0.625),                   # x = c(a,b) refers to the line x position
           y = c(0.5, 0.5),                       # y = c(a,b) refers to the line y position
           arrow = arrow())                       # arrow = arrow() indicates the line type

# EXAMPLE

library(grid)
library(SixSigma)

grid.roundrect(width = 0.25,
               height = unit(2.6, "inches"),
               x = 0.25)
grid.text("INPUTS\n\nIngredients\nCook\nOven\nPlates",
          x = 0.25,
          y = .6,
          just = "top")
grid.roundrect(width = 0.25,
               height = unit(2.6, "inches"),
               x = 0.75)
grid.text("OUTPUTS\n\nTemperature\nTaste\nTenderness\nWeight\nRadius\nTime",
          x = 0.75,
          y = .6,
          just = "top")
grid.lines(x = c(0.375, 0.625),
           y = c(0.5, 0.5),
           arrow = arrow())
