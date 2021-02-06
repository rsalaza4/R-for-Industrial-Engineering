### PROBABILITY SAMPLING ###

# Import required libraries
library(splitstackshape)

# Set random seed
set.seed(42)

# Generate a random dataset
df <- data.frame(
  ID = 1:100,
  Measure = abs(round(rnorm(100, mean=50, sd=3), digits=2)))
head(df)

# Get the real mean
real_mean <- round(mean(df$Measure), digits=2)
print(paste("Real mean: ", real_mean))

# SIMPLE RANDOM SAMPLING
random_sample <- sample(df$Measure, 10)
random_sample

# Get the simple random sample mean
random_sample_mean  <- round(mean(random_sample), digits=2)
print(paste("Simple random sample mean: ", random_sample_mean))

# Compare the simple random sample mean with the real mean
print(paste("Absolute difference between simple random sample mean and real mean: ", round(abs(real_mean - random_sample_mean), digits=2)))

# SYSTEMATIC SAMPLING
systematic_sample <- c()

# Get every thenth unit
for(id in df$ID){
  if(id%% 10 == 0){
    systematic_sample <- append(systematic_sample, df$Measure[id])
  }
}

systematic_sample

# Get the systematic sample mean
systematic_sample_mean <- round(mean(systematic_sample), digits=2)
print(paste("Systematic sample mean: ", systematic_sample_mean))

# Compare the systematic sample mean with the real mean
print(paste("Absolute difference between systematic sample mean and real mean: ", round(abs(real_mean - systematic_sample_mean), digits=2)))

# Assign items to a cluster
df$Cluster <- c(rep(c("Cluster 1", "Cluster 2", "Cluster 3", "Cluster 4", "Cluster 5"), each=20))
head(df)
tail(df)

# Get the real clusters means
real_clusters_means <- aggregate(df[, 2], list(df$Cluster), mean)

# Change column names
colnames(real_clusters_means) <- c("Cluster", "Real_Mean")
real_clusters_means

# CLUSTER SAMPLING
# Consider only even number clusters
cluster_sample <- stratified(df, "Cluster", 20, select = list(Cluster = c("Cluster 2", "Cluster 4")))
cluster_sample

# Get the mean for those clusters
clusters_sample_means <- aggregate(cluster_sample[,2], list(cluster_sample$Cluster), mean)

# Change column names
colnames(clusters_sample_means) <- c("Cluster", "Cluster_Sample_Mean")
clusters_sample_means

# STRATIFIED CLUSTER SAMPLING
# Take a 20% sample from all clusters (i.e. 2 samples per cluster)
stratified_sample <- stratified(df, "Cluster", 0.2)
stratified_sample

# Get the mean for those clusters samples
stratified_sample_means <- aggregate(stratified_sample[, 2], list(stratified_sample$Cluster), mean)

# Change column names
colnames(stratified_sample_means) <- c("Cluster", "Stratified_Sample_Mean")
stratified_sample_means

# Add clusters real means column
stratified_sample_means$Real_Mean <- real_clusters_means$Real_Mean

# Compare the stratified clusters sample means with the real clusters means
stratified_sample_means$Abs_Difference <- abs(stratified_sample_means$Stratified_Sample_Mean - stratified_sample_means$Real_Mean)
stratified_sample_means
