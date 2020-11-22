### GRAPHICAL METHOD ###

# Define constraints
cons.1 <- function(x) 6 - x  
cons.2 <- function(x) 5 - 0.5*x
# cons.3 x1 = 4 (plotted using geom_vline)
# cons.4 x1 = 0 (defined by setting x1 axis limits)
# cons.5 x2 = 0 (defined by setting x2 axis limits)

# Import ggplot2 package
library(ggplot2)

# Build plot
p <- ggplot(data = data.frame(x = 0), aes(x = x)) +
  
  # Add axes
  geom_vline(xintercept = 0) +
  geom_hline(yintercept = 0) +
  
  # Add constraints lines
  stat_function(colour = "Red", fun = cons.1) +
  stat_function(colour = "Blue", fun = cons.2) +
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

# Define objective function
z1 <- function(x) -0.8*x + 2 # (the + 2 constant is just for displacement visualization purposes)

# Visualize objective function displacement
p <- p + stat_function(colour = "Black", fun = z1, lty=2)

# Print plot
print(p) 

# Redefine objective function
z2 <- function(x) -0.8*x + 4 # (the + 4 constant is just for displacement visualization purposes)

# Visualize objective function displacement again
p <- p + stat_function(colour = "Black", fun = z2, lty=2)

# Print plot
print(p) 

# Visualize objective function displacement again
z.solution <- function(x) -0.8*x + 5.6   # (the + 5.6 constant is just for displacement visualization purposes)\

# Visualize objective function displacement - solution
p <- p + stat_function(colour = "Black", fun = z.solution, lty=2)

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
