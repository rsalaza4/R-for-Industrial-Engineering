### ARROW DIAGRAM ###

# Import DiagrammeR package
library(DiagrammeR)

# Build arrow diagram
grViz("
digraph {

# Set diagram direction
graph [rankdir = LR]

# Set nodes
1 [shape = circle, label = '1']
2 [shape = circle, label = '2']
3 [shape = circle, label = '3']
4 [shape = circle, label = '4']
5 [shape = circle, label = '5']
6 [shape = circle, label = '6']
7 [shape = circle, label = '7']
8 [shape = circle, label = '8']
9 [shape = circle, label = '9']
10 [shape = circle, label = '10']
11 [shape = circle, label = '11']
12 [shape = circle, label = '12']

# Specify nodes connections
1 -> 2 [label = 'A \n 1', color = 'red']
2 -> 3 [label = 'B \n 2', color = 'red']
3 -> 4 [label = 'C \n 1', color = 'red']
4 -> 5 [label = 'D \n 3']
4 -> 6 [label = 'E \n 3', color = 'red']
4 -> 7 [label = 'F \n 5']
4 -> 8 [label = 'G \n 2']
4 -> 9 [label = 'H \n 1']
5 -> 11 [style = dashed]
6 -> 11 [label = 'I \n 4', color = 'red']
7 -> 11 [style = dashed]
8 -> 10 [label = 'J \n 2']
9 -> 8 [style = dashed]
10 -> 11 [style = dashed] 
11 -> 12 [label = 'K \n 1', color = 'red']

}
")
