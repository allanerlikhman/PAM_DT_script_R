##clear directory##
rm(list = ls())
##input data##
##choose directory##
setwd("...")
dados <- read.csv2("pasta1.csv",header=TRUE,dec = ".")
head(dados)
dados <- dados[,2:7]
## PAM
library(cluster)
cl <- pam(dados, 7)
summary(cl)
dados_pam <- cbind(dados,grupos)
write.csv(dados_pam, file = "dados_pam")
##choosedirectory
setwd("...")
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






