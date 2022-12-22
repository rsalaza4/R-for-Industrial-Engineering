### INTERRELATIONSHIP DIAGRAM ###

# Import DiagrammeR package
library(DiagrammeR)

# Build interrelationship diagram
grViz("
digraph {

# Set diagram direction
graph [rankdir = BT]

# Set diagram title
Title [shape = plaintext, fontname = TimesNewRoman, fontsize = 16, 
      label = 'Interrelationship Diagram Title']

# Set main effect node
Effect [shape = rectangle, fontname = TimesNewRoman, fontsize = 12, style = 'filled',
        fillcolor = 'grey', color = 'black', label = 'Why does this happend?']

# Set primary causes nodes 
P1 [shape = rectangle, fontname = TimesNewRoman, fontsize = 10, style = 'filled',
    fillcolor = 'lightgrey', color = 'black', label = 'Primary Cause 1']
P2 [shape = rectangle, fontname = TimesNewRoman, fontsize = 10, style = 'filled',
    fillcolor = 'lightgrey', color = 'black', label = 'Primary Cause 2']
P3 [shape = rectangle, fontname = TimesNewRoman, fontsize = 10, style = 'filled',
    fillcolor = 'lightgrey', color = 'black', label = 'Primary Cause 3']
P4 [shape = rectangle, fontname = TimesNewRoman, fontsize = 10, style = 'filled',
    fillcolor = 'lightgrey', color = 'black', label = 'Primary Cause 4']

# Set secondary causes nodes  
S1 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'Gainsboro', color = 'black', label = 'Secondary Cause 1']
S2 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'Gainsboro', color = 'black', label = 'Secondary Cause 2']
S3 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'Gainsboro', color = 'black', label = 'Secondary Cause 3']
S4 [shape = rectangle, fontname = TimesNewRoman, fontsize = 8, style = 'filled',
    fillcolor = 'Gainsboro', color = 'black', label = 'Secondary Cause 4']

# Set tertiary causes nodes 
T1 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
    fillcolor = 'White', color = 'black', label = 'Tertiary Cause 1']
T2 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
    fillcolor = 'White', color = 'black', label = 'Tertiary Cause 2']
T3 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
    fillcolor = 'White', color = 'black', label = 'Tertiary Cause 3']
T4 [shape = rectangle, fontname = TimesNewRoman, fontsize = 7, style = 'filled',
    fillcolor = 'White', color = 'black', label = 'Tertiary Cause 4']

# Specify nodes connections  
Effect -> Title [color = none, minlen = 1]
 
P1 -> Effect [arrowhead = vee]
P2 -> Effect [arrowhead = vee]
P3 -> Effect [arrowhead = vee]
P4 -> Effect [arrowhead = vee]

S1 -> P1 [arrowhead = vee]
S2 -> P2 [arrowhead = vee]
S3 -> P3 [arrowhead = vee]
S4 -> P4 [arrowhead = vee]

T1 -> S1 [arrowhead = vee]
T2 -> S2 [arrowhead = vee]
T3 -> S3 [arrowhead = vee]
T4 -> S4 [arrowhead = vee]

T1 -> S2 [arrowhead = vee]
T3 -> S4 [arrowhead = vee]
S2 -> P1 [arrowhead = vee]
S3 -> P2 [arrowhead = vee]

}
")
