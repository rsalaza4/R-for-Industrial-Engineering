### SCHEDULING PROBLEM ###

# PROBLEM DESCRIPTION

# A factory produces a particular product based on quarterly demands. 
# The demand starts slow during the first quarter of the year, peaks in the middle and tapers off towards the end of the year. 
# Because of the high popularity of its product, the factory may use overtime to satisfy the demand. 
# The table below provides the production capacities and the demands for each yearly quarter.

# |--------------------------------------------------------------------------|
# | Quarter | Regular Capacity (units) | Overtime Capacity (units) | Demand  |
# |--------------------------------------------------------------------------|
# |    1    |            90            |             50            |   100   |
# |    2    |           100            |             60            |   190   |
# |    3    |           120            |             80            |   210   |
# |    4    |           110            |             70            |   160   |
# |--------------------------------------------------------------------------|

# The unit product cost in any period is $6 during regular time and $9 during overtime. 
# Holding cost per unit per quarter is $0.10.

# QUESTIONS

# - What production scheduling plan will minimize cost for the company?
# - Which is the optimum production cost?

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
