library(igraph)
library(MASS)

# Importando a lista de adjacência criada previamente e gerando o grafo com base na lista
listabandas <- read.csv(file="edgelist_final1.csv", header=FALSE)
rede_bipartida <- graph.data.frame(listabandas,directed=FALSE)

# Salvando a matriz de adjacência em um arquivo a parte 
matriz_sem_edicao <-as_adjacency_matrix(rede_bipartida, type = c("both"),attr = NULL, edges = FALSE, names = FALSE, sparse = igraph_opt("sparsematrices"))
write.matrix(matriz_sem_edicao,file="ADJ_SEM_EDICAO.csv", sep = ",")

# Importando a matriz de adjacência do novo grafo e criando-o
matriz_bandas <- read.csv(file="adj_bandaxbanda_edit1.csv", header=TRUE)
bandas <- as.matrix(matriz_bandas) 
rede_bandas <- graph_from_adjacency_matrix(bandas, mode = c("undirected"), weighted =  TRUE,diag = FALSE)

# Calculando betweenness de vértice e aresta
btw <- estimate_betweenness(rede_bandas, vids = V(rede_bandas), directed = FALSE, cutoff=6, weights = FALSE, nobigint = TRUE)
write.matrix(btw,file="btw.csv", sep = ",")

# Calculando a transitividade 
clustercoef<-transitivity(rede_bandas, type = c("weighted"), vids =V(rede_bandas), isolates = c("zero"))
write.matrix(clustercoef,file="clustercoef.csv", sep = ",")

# Cálculo das estruturas de comunidade
ci <-cluster_infomap(rede_bandas,nb.trials = 10, modularity = TRUE)
comunidades <-communities(ci)
write.matrix(comunidades,file="comunidades.csv", sep = ",")
	
#Numeric vector, one value for each vertex, the membership vector of the community structure. Might also be NULL if the community structure is given in another way, e.g. by a merge matrix.
membresia<-membership(ci)
write.matrix(membresia,file="membresia.csv", sep = ",")

# número de arestas (123646)
gsize(rede_bandas)

#Densidade do grafo (0.06191584)
edge_density(rede_bandas, loops = FALSE)

#diametro do grafo (7)
diameter(rede_bandas, directed = FALSE, unconnected = TRUE, weights = NULL)

#Conectividade (0, pois o grafo é fortemente conectado)
vertex_connectivity(rede_bandas, source = NULL, target = NULL,checks = TRUE)
edge_connectivity(rede_bandas, source = NULL, target = NULL, checks = TRUE)
