### AFFINITY DIAGRAM ###

# Import DiagrammeR package
library(DiagrammeR)

grViz("
digraph {

graph [compound = true, 
      nodesep = .5, 
      ranksep = .25,
      color = black,
      style = filled,
      fillcolor = AliceBlue]

Affinity_Diagram [shape = plaintext,
                  fontname = TimesNewRoman,
                  fontsize = 15]
                    
Affinity_Diagram -> Category_A [arrowhead = none, color = none]
Affinity_Diagram -> Category_B [arrowhead = none, color = none]
Affinity_Diagram -> Category_C [arrowhead = none, color = none]
Affinity_Diagram -> Category_D [arrowhead = none, color = none]
  
subgraph cluster1 {
        
Category_A [style = filled, fillcolor = Salmon, shape = rectangle, fontsize = 11];
1.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
1.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
1.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
  
Category_A -> 1.1 [arrowhead = none, color = none]
1.1 -> 1.2 [arrowhead = none, color = none]
1.2 -> 1.3 [arrowhead = none, color = none]
}

subgraph cluster2 {
Category_B [style = filled, fillcolor = Yellow, shape = rectangle, fontsize = 11];
2.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
2.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
2.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
  
Category_B -> 2.1 [arrowhead = none, color = none]
2.1 -> 2.2 [arrowhead = none, color = none]
2.2 -> 2.3 [arrowhead = none, color = none]
}

subgraph cluster3 {
Category_C [style = filled, fillcolor = PaleGreen, shape = rectangle, fontsize = 11];
3.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
3.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
3.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
  
Category_C -> 3.1 [arrowhead = none, color = none]
3.1 -> 3.2 [arrowhead = none, color = none]
3.2 -> 3.3 [arrowhead = none, color = none]
}

subgraph cluster4 {
Category_D [style = filled, fillcolor = Turquoise, shape = rectangle, fontsize = 11];
4.1 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
4.2 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
4.3 [style = filled, fillcolor = white, shape = rectangle, fontsize = 10];
  
Category_D -> 4.1 [arrowhead = none, color = none]
4.1 -> 4.2 [arrowhead = none, color = none]
4.2 -> 4.3 [arrowhead = none, color = none]
}

}
")
