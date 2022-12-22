### TRANSPORTATION PROBLEM ###

# Import lpSolve package
library(lpSolve)

# Set transportation costs matrix
costs <- matrix(c(), nrow = , byrow = TRUE)

# Set customers and suppliers' names
colnames(costs) <- c()
rownames(costs) <- c()

# Set unequality/equality signs for suppliers
row.signs <- rep("<=", )

# Set right hand side coefficients for suppliers
row.rhs <- c()

# Set unequality/equality signs for customers
col.signs <- rep(">=", )

# Set right hand side coefficients for customers
col.rhs <- c()

# Final value (z)
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)

# Variables final values
lp.transport(costs,"min", row.signs, row.rhs, col.signs, col.rhs)$solution

# EXAMPLE

library(lpSolve)

costs <- matrix(c(10, 2, 20, 11,
                  12, 7,  9, 20,
                  4, 14, 16, 18), nrow = 3, byrow = TRUE)
colnames(costs) <- c("Customer 1", "Customer 2", "Customer 3", "Customer 4")
rownames(costs) <- c("Supplier 1", "Supplier 2", "Supplier 3")

row.signs <- rep("<=" ,3)
row.rhs <- c(15, 25, 10)

col.signs <- rep(">=", 4)
col.rhs <- c(5, 15, 15, 15)

lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)
lp.transport(costs, "min", row.signs, row.rhs, col.signs, col.rhs)$solution
