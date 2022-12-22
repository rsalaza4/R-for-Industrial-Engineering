### IPO DIAGRAM ###

# Import grid package
library(grid)

# Import SixSigma package
library(SixSigma)

# Build boxes
# Inputs Box
grid.roundrect(width = 0.2,                     # set box width
               height = unit(3, "inches"),      # set box height
               x = 0.2)                         # set x position of the box
grid.text("INPUTS\n\n\n\n\n",                   # type in text to be displayed
          x = 0.2,                              # set x position of the text
          y = 0.65,                             # set y position of the text  
          just = "top",                         # set text justification
          gp = gpar(fontsize = 10))             # set font size

# Process Box 
grid.roundrect(width = 0.2,                       
               height = unit(3, "inches"),      
               x = 0.5)                          
grid.text("PROCESS\n\n\n\n\n\n\n",                
          x = 0.5,                              
          y = 0.65,                                 
          just = "top",
          gp = gpar(fontsize = 10))

# Outputs Box
grid.roundrect(width = 0.2,                       
               height = unit(3, "inches"),
               x = 0.8)                          
grid.text("OUTPUTS\n\n\n\n\n\n\n",             
          x = 0.8,                               
          y = 0.65,                                 
          just = "top",
          gp = gpar(fontsize = 10))

# Create connecting lines
# From 'Inputs' box to 'Process' box
grid.lines(x = c(0.3, 0.4),                   # x = c(a, b) refers to the line x position
           y = c(0.5, 0.5),                   # y = c(a, b) refers to the line y position
           arrow = arrow())                   # arrow = arrow() indicates the line type

# From 'Process' box to 'Outputs' box
grid.lines(x = c(0.6, 0.7),                   
           y = c(0.5, 0.5),                       
           arrow = arrow())         

# EXAMPLE

grid.roundrect(width = 0.2,                     
               height = unit(3, "inches"),      
               x = 0.2)                         
grid.text("INPUTS\n\nGrade 1\nGrade 2\nGrade 3",                  
          x = 0.2,                              
          y = 0.65,                               
          just = "top",
          gp = gpar(fontsize = 10))

grid.roundrect(width = 0.2,                       
               height = unit(3, "inches"),      
               x = 0.5)                          
grid.text("PROCESS\n\nSum all grades\n\nDivide sum by\nnumber of grades",         
          x = 0.5,                              
          y = 0.65,                                 
          just = "top",
          gp = gpar(fontsize = 10)) 

grid.roundrect(width = 0.2,                       
               height = unit(3, "inches"),
               x = 0.8)                          
grid.text("OUTPUTS\n\nStudent Grade\nAverage",             
          x = 0.8,                               
          y = 0.65,                                 
          just = "top",
          gp = gpar(fontsize = 10))               

grid.lines(x = c(0.3, 0.4),                   
           y = c(0.5, 0.5),                   
           arrow = arrow())                 

grid.lines(x = c(0.6, 0.7),                   
           y = c(0.5, 0.5),                       
           arrow = arrow()) 
