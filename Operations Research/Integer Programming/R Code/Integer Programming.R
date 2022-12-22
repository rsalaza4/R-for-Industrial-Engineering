### INTEGER PROGRAMMING ###

# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c()

# Set matrix corresponding to coefficients of constraints by rows
f.con <- matrix(c(), nrow = , byrow = TRUE)

# Set unequality/equality signs
f.dir <- c("<=", ">=", "=")

# Set right hand side coefficients
f.rhs <- c()

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:)$solution

# Sensitivities
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1: , compute.sens = TRUE)$sens.coef.from
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1: , compute.sens = TRUE)$sens.coef.to

# Dual Values (first dual of the constraints and then dual of the variables)
# Duals of the constraints and variables are mixed
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1: , compute.sens = TRUE)$duals

# Duals lower and upper limits:
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1: , compute.sens = TRUE)$duals.from
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1: , compute.sens = TRUE)$duals.to

# EXAMPLE (Integer programming with binary variables)

f.obj <- c(8, 11, 6, 4)
f.con <- matrix(c(5, 7, 0, 3,
                  8, 0, 4, 4,
                  2, 10, 6, 4), nrow = 3, byrow = TRUE)
f.dir <- c("<=",
           "<=",
           "<=")
f.rhs <- c(14,
           12,
           15)

lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, all.bin = TRUE)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, all.bin = TRUE)$solution

lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, compute.sens = TRUE, all.bin = TRUE)$sens.coef.from
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, compute.sens = TRUE, all.bin = TRUE)$sens.coef.to

lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, compute.sens = TRUE, all.bin = TRUE)$duals
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, compute.sens = TRUE, all.bin = TRUE)$duals.from
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:4, compute.sens = TRUE, all.bin = TRUE)$duals.to
