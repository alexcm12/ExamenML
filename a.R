library(cluster)
library(purrr)
setwd("C:/ExamenML")
Datos <- read.csv('EjemploAlgoritmosRecomendacion.csv')
Datos <- na.omit(Datos)

# Dissimilarity matrix
d <- dist(Datos, method = "euclidean")
# Hierarchical clustering using Complete Linkage
hc1 <- hclust(d, method = "complete" )
# Plot the obtained dendrogram
plot(hc1, cex = 0.6, hang = -1)


# Compute with agnes (make sure you have the package cluster)
hc2 <- agnes(Datos, method = "complete")

# Agglomerative coefficient
hc2$ac

#Let’s compare the methods discussed

# vector of methods to compare
m <- c( "average", "single", "complete", "ward")
names(m) <- c( "average", "single", "complete", "ward")

# function to compute coefficient
ac <- function(x) {
  agnes(Datos, method = x)$ac
}
map_dbl(m, ac) 

#Ward’s method gets us the highest agglomerative coefficient. Let us look at its dendogram.
hc3 <- agnes(Datos, method = "ward")
pltree(hc3, cex = 0.6, hang = -1, main = "Dendrogram of agnes")