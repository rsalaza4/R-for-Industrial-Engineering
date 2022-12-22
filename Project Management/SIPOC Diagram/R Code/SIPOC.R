### SIPOC DIAGRAM ###

# Import DiagrammeR package
library(DiagrammeR)

# Build SIPOC diagram
grViz("
digraph {

# Set diagram layout options
graph [compound = true, 
      nodesep = .5, 
      ranksep = .25,
      color = black,
      style = filled,
      fillcolor = WhiteSmoke]

# Set diagram title
Title [shape = plaintext,
      fontname = TimesNewRoman,
      fontsize = 16,
      label = 'SIPOC Diagram']
                   
# Build Supplier box                    
subgraph cluster1 {
S [style = filled, fillcolor = grey, shape = rectangle, fontsize = 11, label = 'Suppliers'];
1.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
1.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
1.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
  
S -> 1.1 [arrowhead = none, color = none]
1.1 -> 1.2 [arrowhead = none, color = none]
1.2 -> 1.3 [arrowhead = none, color = none]
}

# Build Input box
subgraph cluster2 {
I [style = filled, fillcolor = grey, shape = rectangle, fontsize = 11, label = 'Inputs'];
2.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
2.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
2.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
  
I -> 2.1 [arrowhead = none, color = none]
2.1 -> 2.2 [arrowhead = none, color = none]
2.2 -> 2.3 [arrowhead = none, color = none]
}

# Build Process box
subgraph cluster3 {
P [style = filled, fillcolor = grey, shape = rectangle, fontsize = 11, label = 'Process'];
3.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
3.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
3.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
  
P -> 3.1 [arrowhead = none, color = none]
3.1 -> 3.2 [arrowhead = none, color = none]
3.2 -> 3.3 [arrowhead = none, color = none]
}

# Build Outcome box
subgraph cluster4 {
O [style = filled, fillcolor = grey, shape = rectangle, fontsize = 11, label = 'Outputs'];
4.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
4.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
4.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
  
O -> 4.1 [arrowhead = none, color = none]
4.1 -> 4.2 [arrowhead = none, color = none]
4.2 -> 4.3 [arrowhead = none, color = none]
}

# Build Customer box
subgraph cluster5 {
C [style = filled, fillcolor = grey, shape = rectangle, fontsize = 11, label = 'Customers'];
5.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
5.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
5.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
  
C -> 5.1 [arrowhead = none, color = none]
5.1 -> 5.2 [arrowhead = none, color = none]
5.2 -> 5.3 [arrowhead = none, color = none]
}

# Set connections between title and clusters
Title -> S [arrowhead = none, color = none]
Title -> I [arrowhead = none, color = none]
Title -> P [arrowhead = none, color = none]
Title -> O [arrowhead = none, color = none]
Title -> C [arrowhead = none, color = none]

}
")
