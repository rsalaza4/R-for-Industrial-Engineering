### DATA TREES ###

# Import data.tree package
library(data.tree)

# Create and define tree root
algorithms <- Node$new("Machine Learning Algorithms")

# Create and define root childs

  # Classification algorithms
  classification <- algorithms$AddChild("Classification")
    linear_svc <- classification$AddChild("Linear SVC")
    sgd_classifier <- classification$AddChild("SGD Classifier")
    naive_bayes <- classification$AddChild("Naive Bayes")
    knn <- classification$AddChild("K-Nearest Neighbors")
  
  # Regression algorithms
  regression <- algorithms$AddChild("Regression")
    sgd_regressor <- regression$AddChild("SGD Regressor")
    lasso <- regression$AddChild("Lasso")
    ridge <- regression$AddChild("Ridge Regressor")
  
  # Clustering algorithms  
  clustering <- algorithms$AddChild("Clustering")
    kmeans <- clustering$AddChild("K-Means")
    gmm <- clustering$AddChild("GMM") 
  
  # Dimemnsionality reduction algorithms  
  dimensionality_reduction <- algorithms$AddChild("Dimensionality Reduction")
    pca <- dimensionality_reduction$AddChild("Randomized PCA")
    isomap <- dimensionality_reduction$AddChild("Isomap")
    kernel <- dimensionality_reduction$AddChild("Kernel approximation") 

# Print algorithms data tree    
print(algorithms)

# Plot algorithms data tree
plot(algorithms)

# Import igraph library
library(igraph)

# Plot algorithms data tree as igraph
plot(as.igraph(algorithms, directed=TRUE, direction="climb"))
