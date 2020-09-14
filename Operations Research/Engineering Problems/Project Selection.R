### PROJECT SELECTION PROBLEM ###

# PROBLEM DESCRIPTION

# A company is interested in investing in multiple projects for the next four years.
# However, the company has limited budget for each year as shown on the table below:

# |--------------------------------------------------------|
# |            |   Capital Requirement (millions)  |       |
# |   Project  | Year 1 | Year 2 | Year 3 | Year 4 |  NPV  |
# |--------------------------------------------------------|
# |      1     |     $3 |     $0 |     $0 |     $0 |    $2 |
# |      2     |     $0 |     $5 |     $1 |     $0 |    $2 |
# |      3     |     $1 |     $2 |     $1 |     $2 |    $2 |
# |      4     |    $10 |     $4 |     $2 |     $0 |    $2 |
# |      5     |     $2 |     $0 |     $5 |     $1 |    $2 |
# |--------------------------------------------------------|
# | Cap. limit |    $12 |     $8 |    $8 |      $4 |       |
# |--------------------------------------------------------|

# In addition to the capital constraints, there are 4 additional constraints to be taken into consideration:

# - Projects 4 and 5 are mutually exclusive
# - Maximum 4 projects can be selected
# - Project 4 depends on project 2
# - Projects 1 and 3 must go together

# QUESTIONS

# - What combination of projects will maximize the net present value?
# - Which is the maximum expected net present value that can be achieved?

# R CODE

# Import lpSolve package
library(lpSolve)

# Set coefficients of the objective function
f.obj <- c(2, 3, 1, 5, 4)

# Set matrix corresponding to coefficients of constraints by rows
f.con <- matrix(c(3,  0,  1, 10,  2,      # capital limit year #1 
                  0,  5,  2,  4,  0,      # capital limit year #2 
                  0,  1,  1,  2,  5,      # capital limit year #3 
                  0,  0,  2,  0,  1,      # capital limit year #4 
                  0,  0,  0,  1,  1,      # projects 4 and 5 mutually exclusive
                  1,  1,  1,  1,  1,      # maximum of 4 projects accepted
                  0, -1,  0,  1,  0,      # project 4 depends on project 2
                  1,  0, -1,  0,  0),     # project 1 and project 3 go together
                nrow = 8, byrow = TRUE)

# Set unequality signs
f.dir <- c(rep("<=", 7), "=")

# Set right hand side coefficients
f.rhs <- c(12, 8, 8, 4, 1, 4, 0, 0)

# Final value (z)
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:5, all.bin = TRUE)

# Variables final values
lp("max", f.obj, f.con, f.dir, f.rhs, int.vec = 1:5, all.bin = TRUE)$solution
