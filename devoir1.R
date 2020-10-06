### Devoir 1


### definir le repertoire du travail 
setwd(~/INTRO_Stat_FunMooc_Nisrine)
### importer le fichier satisfaction_hopital.csv
Satisfaction_Hopital <- read.csv2("satisfaction_hopital.csv")
### afficher le nombre de ligne et de colonnes du jeu de données 
dim(Satisfaction_Hopital)


##question 1 : j'ai utilisé 2 manières pour répondre à cette question , une plus longue et l'autre en 2 lignes de codes  

### variable sexe
#### Pour femme 
(sum(Satisfaction_Hopital$sexe == "1", na.rm = TRUE) / 534) * 100
#### Pour homme 
(sum(Satisfaction_Hopital$sexe == "0", na.rm = TRUE) / 534) * 100

### Variable Profession 
#### agriculteur exploitant
(sum(Satisfaction_Hopital$profession == "1", na.rm = TRUE) / 534)* 100
#### artisan, commerçant, chef d'entreprise
(sum(Satisfaction_Hopital$profession == "2", na.rm = TRUE) / 534)* 100
#### cadre, profession intellectuelle ou artistique, profession libérale
(sum(Satisfaction_Hopital$profession == "3", na.rm = TRUE) / 534)* 100
#### profession intermédiaire de l'enseignement, de la santé, du travail social ou de la fonction publique, technicien, contremaître, agent de maîtrise, clergé
(sum(Satisfaction_Hopital$profession == "4", na.rm = TRUE) / 534)* 100
#### employé
(sum(Satisfaction_Hopital$profession == "5", na.rm = TRUE) / 534)* 100
#### ouvrier
(sum(Satisfaction_Hopital$profession == "6", na.rm = TRUE) / 534)* 100
#### étudiant, militaire, chômeur sans avoir jamais travaillé
(sum(Satisfaction_Hopital$profession == "7", na.rm = TRUE) / 534)* 100
#### autre
(sum(Satisfaction_Hopital$profession == "8", na.rm = TRUE) / 534)* 100

### d'une manière plus résumée 

###Définition du répertoire et affichage du tableau des données :
###Nous renommons le fichier "satisfaction_hopital" en Satisfaction_Hopital

setwd("~/Documents/Mooc")
Satisfaction_Hopital<- read.csv2("satisfaction_hopital.csv")

### Voir le jeu de données
View(Satisfaction_Hopital) 

### afficher le nombre de ligne et de colonnes du jeu de données 
dim(Satisfaction_Hopital)

####Recodage des variables catégorielles (profession et sexe et amélioration.santé)

Satisfaction_Hopital$sexe.c<-factor(Satisfaction_Hopital$sexe, labels=c("homme", "femme"))
Satisfaction_Hopital$profession.c<-factor(Satisfaction_Hopital$profession, labels=c("agriculteur", "artisan", "cadre","intermédiaire", "employé", "ouvrier", "sans emploi", "autre"))
Satisfaction_Hopital$amelioration.sante.c<-factor(Satisfaction_Hopital$amelioration.sante)

#### variable sexe 
round(prop.table(table(Satisfaction_Hopital$sexe.c , useNA = "always")) * 100 , 3)

#### variable Profession 
round(prop.table(table(Satisfaction_Hopital$profession.c, useNA = "always")) * 100 , 3)

#### variable amélioration.sante
round(prop.table(table(Satisfaction_Hopital$amelioration.sante.c, useNA = "always")) * 100 , 3)

### Question 2 
names(Satisfaction_Hopital)
####  pour utiliser la commande describe il faut installer le package prettyR  
install.packages("prettyR")
library(prettyR)

#### pour utiliser la commande select il faut installer le package "dplyr" de "tidyverse".
#### j'ai utilisé la commande select pour éviter de reprendre les trois variables déjà traiter avant. j'ai également créé une autre table "Satisfaction_Hopital_cat" qui contient le reste des variabes non traiter avant
install.packages("dplyr")
library(dplyr)
Satisfaction_Hopital_cat<- Satisfaction_Hopital %>% select(service, age, score.relation, score.information, amelioration.moral, recommander)
describe(Satisfaction_Hopital_cat,num.desc = c("mean", "median", "sd","min", "max", "valid.n"))

#### une autre façon
describe(Satisfaction_Hopital
         [c("age","service","amelioration.moral","recommander","score.relation","score.information")], 
         num.desc = c("mean","median","sd","min","max","valid.n"))

### Question 3
#### histogramme de score.relation 
hist(Satisfaction_Hopital$score.relation, xlab= "score.relation", ylim = c(0,120),main = "histogramme du score de relation", col = "grey", las=1)

### Question 4

boxplot(Satisfaction_Hopital$score.relation ~ Satisfaction_Hopital$sexe, ylab = "score de relation", 
        xlab ="sexe", las=1, col=c("lightblue", "red"),
        main="La distribution du score de relation par sexe", names=c("hommes", "femmes"))











