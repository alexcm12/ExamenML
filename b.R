setwd("C:/ExamenML")
Datos <- read.csv('EjemploAlgoritmosRecomendacion.csv', header = TRUE, sep = ",", dec = ".", row.names = 1)

#install.packages("FactoMineR", dependencies = TRUE)
library(FactoMineR)

#Datos$X <- NULL

acp_datos <- PCA(Datos, scale = FALSE)

plot(acp_datos, choix="ind")

plot(acp_datos, choix="var")

#Clustering

Datos_hcpc <- HCPC(acp_datos, nb.clust = 0, graph = FALSE)


#install.packages("factoextra", dependencies = TRUE)
library(factoextra)

#Dendograma
fviz_dend(Datos_hcpc,
          cex=0.6,                #tamaño etiquetas 
          palette="lancet",
          rect=TRUE, rect_fill=TRUE,
          rect_border= "lancet",
          labels_track_height = 2)#Espacio etiquetas

#Visualizacion clusters
fviz_cluster(Datos_hcpc,
             repel = TRUE,                #tamaño etiquetas 
             palette="lancet",
             show.clust.cent = TRUE,
             ggtheme = theme_minimal(),
             main = "Clusters de individuos")

#Graficacion de dendograma sobre el plano del ACP
plot(Datos_hcpc, choice = "3D.map")

#Variables mas significativas de cada cluster
Datos_hcpc$desc.var$quanti

