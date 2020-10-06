### Devoir 2


### definir le repertoire du travail 
setwd(~/INTRO_Stat_FunMooc_Nisrine)
### importer le fichier satisfaction_hopital.csv
Satisfaction_Hopital <- read.csv2("satisfaction_hopital.csv")
### afficher le nombre de ligne et de colonnes du jeu de données 
dim(Satisfaction_Hopital)

## Question 1 : pour recoder la variable "recommander" en variable binaire qu'on va appeler "recommander.b" où les modalités 0,1 seront récodées en 0 ,et 2 sera recodée en 1 et pour cela on utilise la fonction suivante:

Satisfaction_Hopital$recommander.b <- ifelse(Satisfaction_Hopital$recommander == 2 , 1 , 0)
str(Satisfaction_Hopital)

### et pour bien verifier ça on fait : 
table(Satisfaction_Hopital$recommander.b,Satisfaction_Hopital$recommander, deparse.level = 2, useNA = "always")

## Question 2:  pour calculer l'odds-ratio entre les variables "recommander.b » et « sexe » on installe le package Epi
install.packages("Epi")
library(Epi)
twoby2(1 - Satisfaction_Hopital$recommander.b, 1- Satisfaction_Hopital$sexe)
##### La valeur de l'odds-ratio =  1.0837

#### intervalle de cofiance de l'odds-ratio est :  [0.7169 , 1,6383]

## Question 3: 

#### on teste statistiquement qu'il existe les conditions de la validié du la correlation de Pearson entre « score.relation » et « age ».
###  pour tester statistiquement la corrélation il faut que l'une des 2 variables suit une distribution de loi normale. pour cela on effectue un histogramme de la variable age 
hist(Satisfaction_Hopital$age)

#### le graphique est plus au moins symétrique. Donc on va dire qu'elle suit une loi normale.
#### testons statistiquement la correlation avec la fonction cor.test()
cor.test(Satisfaction_Hopital$age, Satisfaction_Hopital$score.relation)

## Question 4:

#### vérification des contions de validité de la méthode utilisée
## le nombre de sujet est supérieur à 30 -> 534 > 30
## alors la distirbution suit une loi normale

#### la variance dans chaque groupe doit être égale
by(Satisfaction_Hopital$score.relation, Satisfaction_Hopital$sexe, sd, na.rm= TRUE)
#### les résultats sont quasiment idéntiques 

### Test t de Student  pour savoir si la moyenne du score de relation est-il significativement différente chez les hommes et chez les femmes ?
t.test (Satisfaction_Hopital$score.relation~ Satisfaction_Hopital$sexe, var.equal= TRUE)
#### le résultat montre  que p = 0.2649 > 0.05 donc on peut dire qu'il existe une différence statistiquement significative entre le score de relation chez les hommes et le score de relation chez les femmes.

correction 2

#Devoir n°2

### definir le repertoire du travail 
setwd(~/INTRO_Stat_FunMooc_Nisrine)
### importer le fichier satisfaction_hopital.csv
Satisfaction_Hopital <- read.csv2("satisfaction_hopital.csv")
### afficher le nombre de ligne et de colonnes du jeu de données 
dim(Satisfaction_Hopital)


#Question1 : Transformez la variable « recommander » en une variable binaire « recommander.b » : « recommander.b » vaut 0 si « recommander » vaut 0 ou 1 ; « recommander.b » vaut 1 si « recommander » vaut 2.

## pour recoder la variable "recommander" en variable binaire qu'on va appeler "recommander.b" où les modalités 0,1 seront récodées en 0 ,et 2 sera recodée en 1 et pour cela on utilise la fonction suivante:

Satisfaction_Hopital$recommander.b <- ifelse(Satisfaction_Hopital$recommander == 2 , 1 , 0)
str(Satisfaction_Hopital)

### et pour bien vérifier ça on fait : 
table(Satisfaction_Hopital$recommander.b,Satisfaction_Hopital$recommander, deparse.level = 2, useNA = "always")



#Question2 : A l’aide d’un odds-ratio, estimez la force de l’association entre « recommander.b » et « sexe ». Estimez un intervalle de confiance de cet odds-ratio.

install.packages("Epi") #installation du package Epi
library(Epi) #activation du package Epi
twoby2(1 - Satisfaction_Hopital$recommander.b, 1- Satisfaction_Hopital$sexe) #calcul de l'odds-ratio

#Nous trouvons un odds-ratio de 1.0837 avec un intervalle de confiance à 95% de [0.7169,1.6383].
#Nous pouvons donc dire que l'association entre les variables recommander.b et sexe est plutôt faible car l'odd ratio est proche de 1.

#Question3 : Calculez la corrélation (de Pearson) entre « score.relation » et « age ». Testez statistiquement cette corrélation (le script doit inclure la vérification éventuelle des conditions de validité de la méthode utilisée).

qqnorm(Satisfaction_Hopital$age);qqline(Satisfaction_Hopital$age) #vérification n°1 --> points presque alignés sauf aux extrémités mais suffisant pour estimer que la variable age suit une loi normale.
hist(Satisfaction_Hopital$age) #vérification n°2 --> histogramme en cloche presque symétrique mais suffisant pour estimer que la variable age suit une loi normale.

#Nous pouvons donc calculer le coefficient de corrélation de Pearson car l'une des deux variables suit la loi normale.
cor.test(Satisfaction_Hopital$age,Satisfaction_Hopital$score.relation)#calcul corrélation de Pearson

#la corrélation trouvée est de ~0.096 donc une très faible corrélation positive. La p-value est de 0.07336 donc supérieur à 5%, la corrélation n'est pas statistiquement significative.

#Question 4 : La moyenne du score de relation est-il significativement différent chez les hommes et chez les femmes ? (le script doit inclure la vérification éventuelle des conditions de validité de la méthode utilisée)
by(Satisfaction_Hopital$score.relation,Satisfaction_Hopital$sexe,sd,na.rm=TRUE)#permet de calculer l'écart type chez les hommes et les femmes, il est presque identique dans chaque groupe donc les variances sont égales.
qqnorm(Satisfaction_Hopital$score.relation);qqline(Satisfaction_Hopital$score.relation)# Diagramme de normalité : la variable score.relation ne suit pas une loi normale car les points ne sont pas alignés.
hist(Satisfaction_Hopital$score.relation)#la variable score.relation ne suit pas une loi normale car l'histogramme n'est pas en cloche.

#on va donc utiliser un test de Wilcoxon pour comparer les moyennes de la variable score.relation chez les hommes et les femmes car score.relation ne suit pas la loi normale.
wilcox.test(Satisfaction_Hopital$score.relation~Satisfaction_Hopital$sexe)#test de Wilcoxon

#la p-value est de 0.3454, très supérieur à 5% donc on peut dire que il n'y pas de différence significtive de la moyenne du score de relation entre les hommes et les femmes.


#Question 4
#On calcul la moyenne par sexe
tab<-tapply(satpatient$score.relation, satpatient$sexe, mean, na.rm=TRUE)
tab
#On souhaite savoir si il y a 1 différence significative de moyenne de score.relation entre les 2 groupes H et F. Pour cela on efectue un test de Student dont les conditions de validité sont : (au moins 30 sujets par groupe OU la variable suit une loi normale) ET (la variance de la variable est identique dans chaque groupe) 
hist(satpatient$score.relation)
#la distribution n'est pas normale
#Pour mieux vérifier la normalité, on peux faire une diagramme de normalité
qqnorm(satpatient$score.relation);qqline(satpatient$score.relation)
#on conclue également que la var ne suit pas une distribution normale
table(satpatient$sexe)
#On a au moins 30 sujets par groupe (268 pour les H et 266 pour les F)
#Pour vérifier l'égalité de la variance () ou l'écart type (sd), on utilise by
by(satpatient$score.relation, satpatient$sexe, sd, na.rm = TRUE)
#Les deux valeurs sont proches
#Les conditions de validité du test étant avérées, on réalise un test Student
t.test(satpatient$score.relation~satpatient$sexe, var.equal = TRUE)
#le p est de 26% ce qui nous amène à ne pas pouvoir rejeter H0: la différence n'est donc pas significative











