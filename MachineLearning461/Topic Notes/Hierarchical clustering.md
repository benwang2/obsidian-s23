Hierarchical clustering is a clustering technique used in unsupervised learning to group similar data points into clusters. The main idea behind hierarchical clustering is to build a tree-like structure.

- Hierarchies might be more natural to represent data
- Different users might care about different levels of granularity
- Main idea: iteratively make clusters of clusters to form a tree

## Top-down (divisive)
In divisive hierarchical clustering, we partition data into 2 groups (using k-means)  then recursively cluster each group

## Bottom-up (agglomerative)
Start with every point being its own cluster, then repeatedly merge the closest two clusters. 

The distance between two clusters is computed as the average distance between all inter-group pairs.
It can also be computed as the distance from centroid to centroid.