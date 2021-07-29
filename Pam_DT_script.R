##limpeza do diretório##
rm(list = ls())
##entrada de dados##
setwd("C:/Users/allan/OneDrive/Área de Trabalho/arvore_de_decisao_kmeans_7_grupos/")
dados <- read.csv2("pasta1.csv",header=TRUE,dec = ".")
head(dados)
dados <- dados[,2:7]
## PAM
library(cluster)
cl <- pam(dados, 7)
summary(cl)
x11()
plot(cl)
cl$diss
grupos <- cl$cluster
fviz_pca_ind(acp_R.2, title = "PCA com grupos originais do RMR",
             habillage = grupos, palette = "jco",
             geom = "point", ggtheme = theme_classic(),
             legend = "bottom")
dados_pam <- cbind(dados,grupos)
write.csv(dados_pam, file = "dados_pam")
setwd("C:/Users/allan/OneDrive/Área de Trabalho/arvore_de_decisao_kmeans_7_grupos/")
dados <- read.csv2("pam_arvore_2.csv",header=TRUE,dec = ".")
library(rpart)
library(rpart.plot)
dados <- dados[,2:8]
head(dados)
classification_tree <- rpart(grupos ~ ., 
                             data = dados, 
                             method = "class", 
                             parms = list(split = "gini"),
                             control = rpart.control(cp = 0.01))
x11()
prp(classification_tree, type = 0, extra = 1, under = TRUE, compress = TRUE)






