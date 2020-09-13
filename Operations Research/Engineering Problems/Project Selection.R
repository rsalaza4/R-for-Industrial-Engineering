### PROJECT SELECTION ###

# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c(2, 3, 1, 5, 4)

# Set matrix corresponding to coefficients of constraints by rows
f.con <- matrix(c(3,  0,  1, 10,  2,      # capital limit year #1 
                  0,  5,  2,  4,  0,      # capital limit year #2 
                  0,  1,  1,  2,  5,      # capital limit year #3 
                  0,  0,  2,  0,  1,      # capital limit year #4 
                  0,  0,  0,  1,  1,      # projects D and E mutually exclusive
                  1,  1,  1,  1,  1,      # maximum of 4 projects accepted
                  0, -1,  0,  1,  0,      # project D depends on project B
                  1,  0,  -1, 0,  0),     # project A and project C go together
                nrow = 8, byrow = TRUE)

# Set unequality signs
f.dir <- c(rep("<=", 7), "=")

# Set right hand side coefficients
f.rhs <- c(12, 8, 8, 4, 1, 4, 0, 0)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:5, all.bin = TRUE)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:5, all.bin = TRUE)$solution
