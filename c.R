setwd("C:/ExamenML")
Datos <- read.csv('EjemploAlgoritmosRecomendacion.csv', header = TRUE, sep = ",", dec = ".", row.names = 1)
library (factoextra)
library (cluster)

#Metodo del codo
fviz_nbclust (Datos, kmeans, method = "wss")

set.seed(12345)
km <- kmeans(Datos, 4, iter.max = 200, nstart = 10)
km

#Visualizacion clusters
fviz_cluster(km, data=Datos,
             repel = TRUE,                #tamaño etiquetas 
             palette="lancet",
             show.clust.cent = TRUE,
             ggtheme = theme_minimal(),
             main = "Clusters)
