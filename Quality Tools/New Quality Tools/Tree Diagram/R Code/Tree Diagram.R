### TREE DIAGRAM ###

# Import DiagrammeR package
library(DiagrammeR)

# Build tree diagram
grViz("
digraph {

# Set diagram direction
graph [rankdir = LR]

# Set goal node
Goal [shape = rectangle, fontname = TimesNewRoman, fontsize = 12, style = 'filled',
        fillcolor = 'grey', color = 'black', label = 'Goal to \n accomplish']

# Set prtimary means nodes 
P1 [shape = rectangle, fontname = TimesNewRoman, fontsize = 10, style = 'filled',
    fillcolor = 'lightgrey', color = 'black', label = 'Primary Mean 1']
P2 [shape = rectangle, fontname = TimesNewRoman, fontsize = 10, style = 'filled',
    fillcolor = 'lightgrey', color = 'black', label = 'Primary Mean 2']

# Set secondary means nodes  
S11 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
      fillcolor = 'Gainsboro', color = 'black', label = 'Secondary Mean 1.1']
S12 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
      fillcolor = 'Gainsboro', color = 'black', label = 'Secondary Mean 1.2']
S21 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
      fillcolor = 'Gainsboro', color = 'black', label = 'Secondary Mean 2.1']
S22 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
      fillcolor = 'Gainsboro', color = 'black', label = 'Secondary Mean 2.2']

# Set tertiary means nodes 
T111 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
       fillcolor = 'White', color = 'black', label = 'Tertiary Mean 1.1.1']
T112 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
        fillcolor = 'White', color = 'black', label = 'Tertiary Mean 1.1.2']
T121 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
        fillcolor = 'White', color = 'black', label = 'Tertiary Mean 1.2.1']
T122 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
        fillcolor = 'White', color = 'black', label = 'Tertiary Mean 1.2.2']
T211 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
       fillcolor = 'White', color = 'black', label = 'Tertiary Mean 2.1.1']
T212 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
        fillcolor = 'White', color = 'black', label = 'Tertiary Mean 2.1.2']
T221 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
        fillcolor = 'White', color = 'black', label = 'Tertiary Mean 2.2.1']
T222 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
        fillcolor = 'White', color = 'black', label = 'Tertiary Mean 2.2.2']

# Specify nodes connections
Goal -> P1 [arrowhead = vee]
Goal -> P2 [arrowhead = vee]

P1 -> S11 [arrowhead = vee]
P1 -> S12 [arrowhead = vee]

P2 -> S21 [arrowhead = vee]
P2 -> S22 [arrowhead = vee]

S11 -> T111 [arrowhead = vee]
S11 -> T112 [arrowhead = vee]
S12 -> T121 [arrowhead = vee]
S12 -> T122 [arrowhead = vee]
S21 -> T211 [arrowhead = vee]
S21 -> T212 [arrowhead = vee]
S22 -> T221 [arrowhead = vee]
S22 -> T222 [arrowhead = vee]

}
")
