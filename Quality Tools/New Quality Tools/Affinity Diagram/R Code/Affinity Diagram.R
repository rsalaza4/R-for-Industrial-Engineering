### AFFINITY DIAGRAM ###

# Import DiagrammeR package
library(DiagrammeR)

# Build affinity diagram
grViz("
digraph {

# Set diagram layout options
graph [compound = true, 
      nodesep = .5, 
      ranksep = .25,
      color = black,
      style = filled,
      fillcolor = AliceBlue]

# Set diagram title
Title [shape = plaintext,
      fontname = TimesNewRoman,
      fontsize = 16,
      label = 'Affinity Diagram Title']
                   
# Build cluster 1                    
subgraph cluster1 {
Category_A [style = filled, fillcolor = Salmon, shape = rectangle, fontsize = 11, label = 'Category A'];
1.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
1.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
1.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
  
Category_A -> 1.1 [arrowhead = none, color = none]
1.1 -> 1.2 [arrowhead = none, color = none]
1.2 -> 1.3 [arrowhead = none, color = none]
}

# Build cluster 2
subgraph cluster2 {
Category_B [style = filled, fillcolor = Yellow, shape = rectangle, fontsize = 11, label = 'Category B'];
2.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
2.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
2.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
  
Category_B -> 2.1 [arrowhead = none, color = none]
2.1 -> 2.2 [arrowhead = none, color = none]
2.2 -> 2.3 [arrowhead = none, color = none]
}

# Build cluster 3
subgraph cluster3 {
Category_C [style = filled, fillcolor = PaleGreen, shape = rectangle, fontsize = 11, label = 'Category C'];
3.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
3.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
3.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
  
Category_C -> 3.1 [arrowhead = none, color = none]
3.1 -> 3.2 [arrowhead = none, color = none]
3.2 -> 3.3 [arrowhead = none, color = none]
}

# Build cluster 4
subgraph cluster4 {
Category_D [style = filled, fillcolor = Turquoise, shape = rectangle, fontsize = 11, label = 'Category D'];
4.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
4.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
4.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10, label = ''];
  
Category_D -> 4.1 [arrowhead = none, color = none]
4.1 -> 4.2 [arrowhead = none, color = none]
4.2 -> 4.3 [arrowhead = none, color = none]
}

# Set connections between title and clusters
Title -> Category_A [arrowhead = none, color = none]
Title -> Category_B [arrowhead = none, color = none]
Title -> Category_C [arrowhead = none, color = none]
Title -> Category_D [arrowhead = none, color = none]

}
")
