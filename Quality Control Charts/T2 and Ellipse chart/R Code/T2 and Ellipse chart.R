### T2 CHART AND ELLIPSE CHART ###

# Import qcc package
library(qcc)

# Create matrix corresponding to variable x1 with 20 groups of 4 observations each
x1 <- matrix(c(), byrow = FALSE, ncol = )

# Create matrix corresponding to variable x2 with 20 groups of 4 observations each
x2 <- matrix(c(), byrow = FALSE, ncol = )

# Create list with both matrices
X <- list(x1 = x1, x2 = x2)

# Create T2 chart
t2 <- mqcc(X, type = "T2")

# Get the summary for the chart
summary(t2)

# Create Ellipse chart
ellipseChart(t2)

# Create Ellipse chart with group id
ellipseChart(t2, show.id = TRUE)

# EXAMPLE

library(qcc)

x1 <- matrix(c(72, 56, 55, 44, 97, 83, 47, 88, 57, 26, 
               46, 49, 71, 71, 67, 55, 49, 72, 61, 35, 
               84, 87, 73, 80, 26, 89, 66, 50, 47, 39, 
               27, 62, 63, 58, 69, 63, 51, 80, 74, 38, 
               79, 33, 22, 54, 48, 91, 53, 84, 41, 52, 
               63, 78, 82, 69, 70, 72, 55, 61, 62, 41, 
               49, 42, 60, 74, 58, 62, 58, 69, 46, 48, 
               34, 87, 55, 70, 94, 49, 76, 59, 57, 46), byrow = FALSE, ncol = 4)

x2 <- matrix(c(23, 14, 13, 09, 36, 30, 12, 31, 14, 07, 
               10, 11, 22, 21, 18, 15, 13, 22, 19, 10, 
               30, 31, 22, 28, 10, 35, 18, 11, 10, 11, 
               08, 20, 16, 19, 19, 16, 14, 28, 20, 11, 
               28, 08, 06, 15, 14, 36, 14, 30, 08, 35, 
               19, 27, 31, 17, 18, 20, 16, 18, 16, 13, 
               10, 09, 16, 25, 15, 18, 16, 19, 10, 30, 
               09, 31, 15, 20, 35, 12, 26, 17, 14, 16), byrow = FALSE, ncol = 4)

X <- list(x1 = x1, x2 = x2)

t2 <- mqcc(X, type = "T2")

summary(t2)

ellipseChart(t2)

ellipseChart(t2, show.id = TRUE)
