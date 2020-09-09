### SCHEDULING ###



# R CODE

# Import lpSolve package
library(lpSolve)

# Set production costs matrix
costs <- matrix(c(6, 6.1, 6.2, 6.3, 0,
                  9, 9.1, 9.2, 9.3, 0,
                  100, 6, 6.1, 6.2, 0,
                  100, 9, 9.1, 9.2, 0,
                  100, 100, 6, 6.1, 0,
                  100, 100, 9, 9.1, 0,
                  100, 100, 100, 6, 0,
                  100, 100, 100, 9, 0), nrow = 8, byrow = TRUE)

# Set customers and production type names
colnames(costs) <- c("Spring", "Summer", "Fall", "Winter", "Surplus")
rownames(costs) <- c("R1", "O1", "R2", "O2", "R3", "03", "R4", "04")

# Set unequality/equality signs for production types
row.signs <- rep("<=", 8)

# Set right hand side coefficients for production types
row.rhs <- c(90, 50, 100, 60, 120, 80, 110, 70)

# Set unequality/equality signs for demand
col.signs <- rep(">=", 5)

# Set right hand side coefficients for demand
col.rhs <- c(100, 190, 210, 160, 20)

# Final value (z)
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution
