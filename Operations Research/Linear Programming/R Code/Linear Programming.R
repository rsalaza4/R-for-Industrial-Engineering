### LINEAR PROGRAMMING ###

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
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

# Sensitivities
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)$sens.coef.from
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)$sens.coef.to

# Dual Values (first dual of the constraints and then dual of the variables)
# Duals of the constraints and variables are mixed
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)$duals

# Duals lower and upper limits
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)$duals.from
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)$duals.to

# EXAMPLE

f.obj <- c(5, 7)
f.con <- matrix(c(1, 0,
                  2, 3,
                  1, 1), nrow = 3, byrow = TRUE)
f.dir <- c("<=",
           "<=",
           "<=")
f.rhs <- c(16,
           19,
           8)

lp("max", f.obj, f.con, f.dir, f.rhs)
lp("max", f.obj, f.con, f.dir, f.rhs)$solution

lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)$sens.coef.from
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)$sens.coef.to

lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)$duals
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)$duals.from
lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)$duals.to
