### STAFF SCHEDULING PROBLEM ###

# PROBLEM DESCRIPTION

# A company requires different number of employees on different days of the week: 
# 10 on Monday, 12 on Tuesday, 20 on Wednesday, 17 on Thursday, 15 on Friday, 12 on Saturday and 5 on Sunday. 
# Each employee must work five consecutive days and then receive two days off.

# QUESTIONS

# - What scheduling plan will minimize the number of required staff?
# - Which is the optimum number of staff to hire?

# R CODE

# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c(1, 1, 1, 1, 1, 1, 1)

# Set matrix corresponding to coefficients of constraints by rows
f.con <- matrix(c(1, 0, 0, 1, 1, 1, 1,
                  1, 1, 0, 0, 1, 1, 1,
                  1, 1, 1, 0, 0, 1, 1,
                  1, 1, 1, 1, 0, 0, 1,
                  1, 1, 1, 1, 1, 0, 0,
                  0, 1, 1, 1, 1, 1, 0,
                  0, 0, 1, 1, 1, 1, 1), nrow = 7, byrow = TRUE)

# Set unequality signs
f.dir <- c(rep(">=", 7))

# Set right hand side coefficients
f.rhs <- c(10, 12, 20, 17, 15, 12, 5)

# Final value (z)
lp("min", f.obj, f.con, f.dir, f.rhs, int.vec = 1:7)

# Variables final values
lp("min", f.obj, f.con, f.dir, f.rhs, int.vec = 1:7)$solution
