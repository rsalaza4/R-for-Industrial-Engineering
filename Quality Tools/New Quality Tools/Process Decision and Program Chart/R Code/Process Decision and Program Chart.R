### PROCESS DECISION AND PROGRAM CHART (PDPC) ###

# Import DiagrammeR package
library(DiagrammeR)

# Build process decision and program chart
grViz("
digraph {

# Set diagram direction
graph [rankdir = TB]

# Set Level 1: Objective to be achieved
L1 [shape = rectangle, fontname = TimesNewRoman, fontsize = 12, style = 'filled',
fillcolor = 'PaleTurquoise', color = 'PaleTurquoise', label = 'Objective to be achieved']

# Set Level 2: Options available
L21 [shape = rectangle, fontname = TimesNewRoman, fontsize = 10, style = 'filled',
    fillcolor = 'salmon', color = 'salmon', label = 'Option 1']
L22 [shape = rectangle, fontname = TimesNewRoman, fontsize = 10, style = 'filled',
    fillcolor = 'salmon', color = 'salmon', label = 'Option 2']
L23 [shape = rectangle, fontname = TimesNewRoman, fontsize = 10, style = 'filled',
    fillcolor = 'salmon', color = 'salmon', label = 'Option 3']

# Set Level 3: What if 
L31 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'CornflowerBlue', color = 'CornflowerBlue', label = 'What if 1']
L32 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'CornflowerBlue', color = 'CornflowerBlue', label = 'What if 2']
L33 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'CornflowerBlue', color = 'CornflowerBlue', label = 'What if 3']
      
# Set Level 4: Possible countermeasures 
L41 [shape = oval, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'Gold', color = 'Gold', label = 'Countermeasure 1']
L42 [shape = oval, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'Gold', color = 'Gold', label = 'Countermeasure 2']
L43 [shape = oval, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'Gold', color = 'Gold', label = 'Countermeasure 3']
L44 [shape = oval, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'Gold', color = 'Gold', label = 'Countermeasure 4']
    
# Set Level 5: Selection of countermeasures 
L51 [shape = plaintext, fontname = TimesNewRoman, fontsize = 13, label = 'O']
L52 [shape = plaintext, fontname = TimesNewRoman, fontsize = 13, label = 'O']
L53 [shape = plaintext, fontname = TimesNewRoman, fontsize = 13, label = 'X']
L54 [shape = plaintext, fontname = TimesNewRoman, fontsize = 13, label = 'O']
      
# Specify nodes connections
L1 -> L21 [arrowhead = none]
L1 -> L22 [arrowhead = none]
L1 -> L23 [arrowhead = none]

L22 -> L31 [arrowhead = none]
L22 -> L32 [arrowhead = none]
L22 -> L33 [arrowhead = none]

L31 -> L41 [arrowhead = none]
L32 -> L42 [arrowhead = none]
L32 -> L43 [arrowhead = none]
L33 -> L44 [arrowhead = none]

L41 -> L51 [arrowhead = none, color = 'white']
L42 -> L52 [arrowhead = none, color = 'white']
L43 -> L53 [arrowhead = none, color = 'white']
L44 -> L54 [arrowhead = none, color = 'white']

}
")
