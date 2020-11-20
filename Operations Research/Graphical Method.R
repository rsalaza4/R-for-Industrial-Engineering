### GRAPHICAL METHOD ###

# Import ggplot2 package
library(ggplot2)

# Define constraints
fun.1 <- function(x) 6 - x  
fun.2 <- function(x) 5 - 0.5*x
# x1 = 4 will be defined below

# Build plot
p <- ggplot(data = data.frame(x = 0), aes(x = x)) +
  
  # Add axes
  geom_vline(xintercept = 0) +
  geom_hline(yintercept = 0) +
  
  # Add constraints lines
  stat_function(colour = "Red", fun = fun.1) +
  stat_function(colour = "Blue", fun = fun.2) +
  geom_vline(xintercept = 4, colour = "Green") +
  
  # Specify axes breaks and limits
  scale_x_continuous(breaks = seq(0, 10, 1), lim = c(0, 10)) +
  scale_y_continuous(breaks = seq(0, 10, 1), lim = c(0, 10)) +
  
  # Define labels
  labs(title = "Optimization Problem",
       subtitle = "Graphical Method",
       x = "x1",
       y = "x2") +
  
  # Add black and white theme
  theme_bw()

# Print plot
print(p)

# Define feasible region polygon
feasible_region = data.frame(x = c(0, 4, 4, 2, 0), y = c(0, 0, 2, 4, 5))

# Add feasible region to current plot
p <- p + geom_polygon(data = feasible_region, mapping = aes(x = x, y = y), fill = "#dddddd") +
  geom_point(data = feasible_region, aes(x = x, y = y), color = "Black")

# Print plot
print(p)

# Verify solution with simplex method

# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c(4, 5)

# Set matrix corresponding to coefficients of constraints by rows
f.con <- matrix(c(1, 2,
                  6, 6,
                  1, 0), nrow = 3, byrow = TRUE)

# Set unequality/equality signs
f.dir <- c("<=", "<=", "<=")

# Set right hand side coefficients
f.rhs <- c(10, 36, 4)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs)

# Variables final values
solution <- lp("max", f.obj, f.con, f.dir, f.rhs)$solution

# Highlight optimum solution in plot
p <- p + geom_point(aes(x = solution[1], y = solution[2]), color = "red", size = 4)

# Print plot
print(p)
