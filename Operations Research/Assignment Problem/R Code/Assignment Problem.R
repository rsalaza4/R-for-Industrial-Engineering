### ASSIGNMENT PROBLEM ###

# Import lpSolve package
library(lpSolve)

# Set assignment costs matrix
costs <- matrix(c(), nrow = , byrow = TRUE)

# Print assignment costs matrix
costs

# Final value (z)
lp.assign(costs)

# Variables final values
lp.assign(costs)$solution

# EXAMPLE

library(lpSolve)

costs <- matrix(c(15, 10, 9,
                   9, 15, 10,
                  10, 12, 8), nrow = 3 , byrow = TRUE)
costs

lp.assign(costs)
lp.assign(costs)$solution
