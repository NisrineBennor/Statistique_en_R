#Nisrine Bennor 
#==================
  
#Chapitre 1

#### Importation du fichier smp1.csv
library(readr)

#### Définir lerépertoire du travail 
setwd("~/Documents/INTRO_Stat_FunMooc_Nisrine")

#### Impoter le fichier csv 
smp <- read.csv2("smp1.csv")

#### Voir le fichier csv 
str(smp)

str(smp$prof)

#### Le nombre des détenus ayant chacun un métiers 
table(smp$prof)

#### Présentation des résultats par un diagramme en batôns 
barplot(table(smp$prof))


#### Présentation des résultats par un diagramme en batôns 
barplot(table(smp$prof))

#### Présentation des résultats par un Camenbert 
pie(table(smp$prof))


#### Présentation de l'âge des détenues 
hist(smp$age)

#### Griser les batons ou colorier les batôns de l'hist

hist(smp$age, col = "grey", main = "", xlab = "age")

#### Boite à moustache 
boxplot(smp$age, xlab= "age ")

#### La distribution de l'âge en fonction du niveau de recherche de sensation
boxplot(smp$age~smp$rs , ylab = "age", xlab = "Recherche de sensation")

#### répresenter la distribution conjointe de é variables quantitatives 
plot(jitter(smp$age), jitter(smp$n.enfant),xlab="age", ylab="n.enfant")

#### Diagramme temporel
install.packages("gplots")
library(gplots)
hdrs <- read_csv2("outils_hdrs.csv")
plotmeans(hdrs$HDRS~hdrs$VISIT, barcol ="black", gap=0)

#### Diagramme en fagot : l'évoloution moyenne des sujets au cours du temps par rapport à l'HDRS
interaction.plot(hdrs$VISIT, hdrs$NUMERO, hdrs$HDRS, lty = 1, legend = FALSE)
 
hist(smp$age)

#### calculer les mesures de position et de dispersion 
summary(smp)

#### calculer les mesures de position et de dispersion
install.packages("prettyR")
library(prettyR)
describe(smp)

describe(smp, num.desc = c("mean", "sd", "valid.n", "median", "min", "max"))

#### calculer la moyenne des ages 
mean(smp$age, na.rm = TRUE)

#### calculer l'écart-type des ages
sd(smp$age, na.rm = TRUE)

#### savoir les nombres de sujet  pour chaque profession
table(smp$prof, deparse.level = 2, useNA = "always")


## Gestion des données.dataframes.variables catégorielles
setwd("~/INTRO_Stat_FunMooc_Nisrine")
smp <- read_csv2("smp1.csv")
View(smp)
names(smp)
str(smp)
summary(smp)
summary(smp$age)

#### ensemble des observations 
smp$age

#### afficher une seul abservation 
smp$age[1]

#### afficher de la 1er à la 10eme observation 
smp$age[1:10]

#### valeur minimal de l'age 
min(smp$age)
help(min)
min(smp$age, na.rm = TRUE)

#### les variables binaires 
smp$scz.cons[1:10]

unique(smp$scz.cons)

#### afficher les 10 permières valeurs
head(smp$scz.cons, n=10)

#### nombre d'obs 
length(smp$scz.cons)

#### nombre de ligne du tableau smp
nrow(smp)

#### nombre d'affectifs associées à chacune des modalités 
table(smp$scz.cons)

table(smp$scz.cons, useNA = "always")

#### variable catégorielle  binaire 
head(factor(smp$scz.cons))

abus <- factor(smp$scz.cons, levels = c(0,1), labels = c("Non", "Oui"))

table(abus)
table(abus, useNA = "always")

#### on prend une autre variable quanlitative : n.enfant
head(smp$n.enfant)

summary(smp$n.enfant)

#### regardant la répartitionde l'effectif 
table(smp$n.enfant)

#### Nombre d'enfants > 4 
table(smp$n.enfant > 4)

#### création de variable qualitative 
smp$n.enfant.cat <- factor(smp$n.enfant)
table(smp$n.enfant)
table(smp$n.enfant.cat)
levels(smp$n.enfant.cat)
nlevels(smp$n.enfant.cat)

#### changer de d'obs
levels(smp$n.enfant.cat)[6:13] <- "5+"
table(smp$n.enfant.cat)

#### 
smp2 <- read_csv2("smp1.csv")
smp2$age[50:100] <- "+50"

#### Sauvegarder le nouveau fichier smp avec les nouvelles colonnes
save(smp, file = "smp_v1.rda")

#### sauvegarder le history ou les commandes 
savehistory("commande.R")
load("smp_v1.rda")

## Indexation criteriés d'obsreations, sélection de variables, graphiques suivantes   
### variables  quantitatives 
names(smp)
smp$age[1]
smp[1,1]
smp[1,"age"]

### variables  qualitatives
head(smp$prof)
head(smp$prof=="agriculteur")
table(smp$prof == "agriculteur")

#### savoir quel obs remplie les conditions 
which(smp$prof=="agriculteur")


#### indexer les variables d'age pour lesquelles la profession == "agriculteur"
smp$age[which(smp$prof == "agriculteur")]


#### indexer les variables d'age pour lesquelles la profession == "agriculteur" avec la fonction subset
subset(smp, prof =="agriculteur", age)

#### visualiser les 5 permières variables quand la prof == "agriculteur"
subset(smp, prof == "agriculteur", 1:5)

#### pareil  mais en nomment les variables 
names(smp)
subset(smp, prof == "agriculteur", c(age, dep.cons, scz.cons, grav.cons) )

#### Rajouter des filtres 
subset(smp, prof == "agriculteur" & n.enfant > 2, c(age, dep.cons, scz.cons, grav.cons) )

#### Rajouter plus de filtres 
subset(smp, prof == "agriculteur" & n.enfant > 2 & complete.cases(grav.cons), c(age, dep.cons, scz.cons, grav.cons) )

#### n.enfant.cat 
table(smp$n.enfant.cat)
tab <- table(smp$n.enfant.cat)

#### effectier des opérations sur tab
sum(tab)

#### effectif raporté à l'effectif total
tab / sum(tab)

#### commande qui fait la même chose : que tab / sum(tab)
prop.table(tab)

#### arrondir les résultats à 3 chiffres après la virgule 
round(prop.table(tab), 3)

#### arrondir les résultats à 2 chiffres après la virgule 
round(prop.table(tab), 2)

#### diagrammes barplot avec pourcentage 
barplot(prop.table(tab) * 100)

#### diagrammes barplot avec pourcentage et augmentation de l'axe du graphique 
barplot(prop.table(tab) * 100, ylim = c(0,30))

#### aligner les répartitions de l'axe du graphique 
barplot(prop.table(tab) * 100, ylim = c(0,30), las=1)

#### graphique pour variable numérique 
head(smp$age)
summary(smp$age)
hist(smp$age)
  
#### graphique pour variable numérique: reduire le nombre de classe de l'age
hist(smp$age, nclass = 6)
hist(smp$age, breaks = 6, main = "rr")

#### fonction de densité 
lines(density(smp$age, na.rm=TRUE))
hist(smp$age, nclass = 6, prob=TRUE)
hist(smp$age, nclass = 6, prob=TRUE, las = 1)
lines(density(smp$age, na.rm=TRUE))

#### faire un tableu de fréquence et un barplot 
smp$n.enfant.cat <- factor(smp$n.enfant)
levels(smp$n.enfant.cat)[6:13] <- "5+"
table(smp$n.enfant.cat)
prop.table(table(smp$n.enfant.cat))
prop.table(table(smp$n.enfant.cat)) *100
barplot(prop.table(table(smp$n.enfant.cat)) *100, ylim = c(0,30), las=1)

savehistory('commande.R')


  
## Semaine 2
### chapitre 5

####Calculer l'intervale de confiance 
describe(smp$age)
38.9-1.96*13.27/sqrt(797)
38.9+1.96*13.27/sqrt(797)
install.packages("binom")
library(binom)
binom.confint(30,100, method="all")
binom.confint(300,1000, method="all")

#### recoder les modlités de la variable ed en binaire 0 et 1 
smp$ed.b <- ifelse(smp$ed > 2,1,0)
str(smp$ed.b)
table(smp$ed.b,smp$ed, deparse.level = 2, useNA = "always")

#### calculer OR et RR
install.packages("Epi")
library(Epi)

twoby2(1-smp$ed.b,1-smp$dep.cons)

#### execrcice
barplot(table(smp$prof))

#### Quel est le nombre moyen d'enfants (variable n.enfant) chez les individus diagnostiqués comme dépressifs (dep.cons = 1) (2 chiffres après la virgule) ?
smp5 <- read.csv2("smp2.csv")
table(smp5$dep.cons == "1")



subset(smp5, )

round(mean(table(smp5$n.enfant,smp5$dep.cons== "1")),2)

library(prettyR)
describe(subset(smp5, dep.cons == "1" , c(n.enfant)))


#### Donner la borne supérieure de l'intervalle interquartile pour la variable duree chez les individus dont l'âge est strictement inférieur à 35 ans (2 chiffres après la virgule). Borne supérieure :

summary(subset(smp5, age< 35, c(duree)))

#### Nous souhaitons estimer la durée moyenne d'intervention (dur.interv) chez les individus ayant au moins un antécédent de tentative de suicide (suicide.past = 1). Quelle commande pouvons-nous utiliser ?
mean(smp5[smp5$age > 35, 'duree'], na.rm=TRUE)


#### 
sum(table(subset(smp5, age > 37 & age <= 48, 'age', na.rm=TRUE), useNA = "always"))

is.na(smp5[c(20, 221,342,446,531,444),])

round(prop.table(table(smp5$prof=="sans emploi", useNA = "always"))*100 , 2)

#### calculer le poucentage en croisant les 2 variables binaires: existance d'un haut niveau d'évitement du danger et existence d'un diagnostic de dépression 

tab <- table(smp$ed.b,smp$dep.cons, deparse.level = 2)
prop.table(tab, 1)

prop.table(tab, 2)
#### text Chi-2

chisq.test(smp$ed.b,smp$dep.cons,correct = FALSE)

#### text Fisher
fisher.test(smp$ed.b,smp$dep.cons)

#### pour savoir si une variable suit une loi normale
hist(smp$age)
qqnorm(smp$age);qqline(smp$age)

#### tester l'égalité des variances 
by(smp$age, smp$ed.b,sd ,na.rm= TRUE)

#### test de t Student 
t.test(smp$age~smp$ed.b,var.equal=TRUE)

#### test de wilcoxon ou de Mann-Whitney
wilcox.test(smp$age~smp$ed.b)

#### tester la nullité de la coefficient de corrélation 
cor.test(smp$age, smp$rs)

#### utiliser la méthode de Spearman pour la corrélation 
cor.test(smp$age, smp$rs, method="spearman")


## Labs4: Croisements de 2 variables  qualitatives ou quantitatives 

#### tableau d'une variable 
table(smp5$subst.cons)

#### tableau de contingence 
table(smp5$subst.cons, smp5$abus)

#### on stocke le résultat du  tableau de contingence 
tab<- table(smp5$subst.cons, smp5$abus)
tab 

#### tableau de proportion 
prop.table(tab)

#### tableau de proportion rapporté à la subst.cons
prop.table(tab, margin = 1)


#### tableau de proportion rapporté à abus
prop.table(tab, margin = 2)

### on peut faire un tableau de contingence d'une autre manière 
xtabs(~ subst.cons + abus, smp5)

#### un graphique sur le tableau de contingence
barplot(xtabs(~ subst.cons + abus, smp5))

#### afficher les modalités autrement
barplot(xtabs(~ subst.cons + abus, smp5), beside = TRUE)

#### réaliser un test Chi-2
chisq.test(tab)

res <- chisq.test(tab)
res

#### les effectifs  obsérvées 
res$observed

#### les effectifs attendus  
res$expected

#### realiser un test fisher 
fisher.test(tab)

#### on considère la variable age et cherchant à decrire la variable age en fonction de subst.cons
#### calculer aussi les moyennes conditionnelles 
head(smp5$age)
table(smp5$subst.cons,useNA = "always" )
tapply(smp5$age, smp5$subst.cons,mean,na.rm=TRUE)

#### réaliser un test de Student pour les échantillons qu'on souhaite comparé 
t.test(smp5$age[smp5$subst.cons == 0],smp5$age[smp5$subst.cons == 1] )

#### réaliser un test de Student classique pour les échantillons qu'on souhaite comparé 
t.test(smp5$age[smp5$subst.cons == 0],smp5$age[smp5$subst.cons == 1], var.equal = TRUE )

#### ou d'une autre manière 
t.test(age ~ subst.cons , smp5, var.equal = TRUE )

#### calculer les moyennes conditionnelles en restant sur la même formule 
aggregate(age ~ subst.cons, smp5, mean)


#### faire un graphique 
boxplot(age ~ subst.cons, smp5)

#### exo semaine 3

by(smp5[c("age","subst.cons"), subst.cons, mean])
within(smp5, tapply(age ,subst.cons , mean, na.rm=TRUE))
with(smp5, tapply(age ,subst.cons, mean, na.rm=TRUE))

tapply(smp5$dur.interv, smp5$dep.cons, median,na.rm=TRUE)

t.test(smp5$dur.interv[smp5$dep.cons == 0],smp5$dur.interv[smp5$dep.cons == 1], var.equal = TRUE )

cor.test(smp5$age,smp5$dur.interv)

wilcox.test(smp5$dur.interv~smp5$suicide.past)


## semaine 4

smp.l <- read.csv2("smp2.csv")
str(smp.l)

### régression linéaire: on fait le graphique x= age et y = dur.interv 
plot(smp.l$age, smp.l$dur.interv)

#### réglement du problème des points superposés: 
plot(jitter(smp.l$age), jitter(smp.l$dur.interv))

#### changer le niveau de bruit par défaut sur l'age et dur.interv
lala <-plot(jitter(smp.l$age), jitter(smp.l$dur.interv,factor = 4))

#### tracer la droite de la régression linéaire
abline(lm(smp.l$dur.interv~smp.l$age),lwd=2)

#### est ce que b est significativement différente de 0?
mod1<-lm(dur.interv~age, smp.l)
summary(mod1)
### p < 5% donc la ponte de la droite de régression linéaire entre dur.interv et age est significativement différente de 0

### régression linéaire: on fait le graphique x= dep.cons et y = dur.interv 
plot(smp.l$dep.cons, smp.l$dur.interv)

#### réglement du problème des points superposés: 
plot(jitter(smp.l$dep.cons), jitter(smp.l$dur.interv))

#### changer le niveau de bruit par défaut sur l'age et dur.interv
plot(jitter(smp.l$dep.cons), jitter(smp.l$dur.interv,factor = 4))

#### tracer la droite de la régression linéaire
abline(lm(smp.l$dur.interv~smp.l$dep.cons),lwd=2)

#### est ce que b est significativement différente de 0 entre dur.interv et présence de dépression?
mod2 <- lm(dur.interv~ dep.cons,data = smp.l)
summary(mod2)

t.test(smp.l$dur.interv~smp.l$dep.cons,var.equal=TRUE)

#### Régression linéaire multiple 
mod3 <- lm(dur.interv~age+ dep.cons+ subst.cons+scz.cons,data = smp.l) 
summary(mod3)

#### la variable catégorielle à plus de 2 classes

mod4 <- lm(dur.interv~age+ dep.cons+ subst.cons+scz.cons+prof,data = smp.l) 
summary(mod4)

#### changer la modalité  de réferénce pourla variable profession 

smp.l$prof<- relevel(smp.l$prof,ref="ouvrier")
mod5 <- lm(dur.interv~age+ dep.cons+ subst.cons+scz.cons+prof,data = smp.l)
summary(mod5)

#### est ce qu'il y a un effet profession sur la durée de l'interview?
drop1(mod5,.~.,test="F")

#### interaction entre 2 variables explicatives:depression et abus de substance
mod6 <- lm(dur.interv~age+dep.cons*subst.cons+scz.cons,data = smp.l)
summary(mod6)

#### analyse de variance: comparer la moyenne d'une variable quantitative à plus de 2 groupes: dur.interv, profession
mod7<- lm(dur.interv~ prof, data = smp.l)
summary(mod7)

#### effet global de la variable profession
drop1(mod7,.~.,test = "F")

#### Comparer un pourcetag quand on a plusieurs sous-groupe: comparer la prévalence de la depression en fonction des professions 
chisq.test(smp.l$dep.cons,smp.l$prof)

#### conditions de validité d'un modèle de régression 
hist(resid(mod3), col="grey", main="")

#### régression logistique simple:
mod8<- glm(suicide.hr~abus, data = smp.l,family = "binomial")
summary(mod8)
exp(0.7688)
library(Epi)
twoby2(1-smp.l$suicide.hr,1-smp.l$abus)

#### regression logistique multiple
mod9<- glm(suicide.hr~abus+discip+duree,data = smp.l,family = "binomial")
summary(mod9)
exp(coefficients(mod9))

## Lab5: ANOVA.Régression linéaire. Régression logistique
## on va obsérvé la variable profession pour certaines modalités par rapport à l'age et le nombre d'enfant 
smp6<- read.csv2("smp2.csv")
head(subset(smp6, prof=="sans emploi"|prof=="prof.intermediaire"|prof=="cadre", c(age, n.enfant, prof)))


smpb<- subset(smp6, prof=="sans emploi"| prof=="prof.intermediaire"| prof=="cadre", c(age, n.enfant, prof))
summary(smpb)

### R garde les autres modalités de professions non citées dans la commande.Pour celà:

smpb$prof <- factor(smpb$prof)
summary(smpb)

#### on fait un tableau pour vérifier 
table(smpb$prof)

#### résumé le nombre d'enfants moyen en fonction de la profession
aggregate(n.enfant ~ prof, smpb, mean)

#### faire un graphique 
boxplot(n.enfant ~ prof, smpb)


#### faire une ANOVA 
m<- lm(n.enfant ~ prof, smpb)
m

#### effet global
drop1(m, test = "F")

#### #### faire une ANOVA dans le cadre de variable explicatives numériques 
m2<- lm(n.enfant ~ age, smpb)
m2

#### tableau de variation 
summary(m2)

#### on peut même travailler avec le jeu de donnée d'origine en rajoutant subset()
m3 <- lm(n.enfant ~ age, smp6, subset= prof=="sans emploi"|prof=="prof.intermediaire"|prof=="cadre")
summary(m3)
m3

#### modèle de régression : affichage des coeffients 
coef(m3)

#### on peut même indexer ces coefficients
coef(m3)[2]

coef(m3)["age"]

#### obtenir des intervalles de confiance 
confint(m3)

#### tableau d'analyses de variation associé à la régression 
anova(m3)

#### réaliser des predictions sur des variables et l'intervale de confiance  
predict(m3, data.frame(age=c(20, 30, 40, 50)), interval = "confidence")

#### Régression logistique : recoder la varible n.enfant
smp5$n.enfant.bin <-ifelse(smp5$n.enfant > 2,1,0) 

#### verifier 
table(smp5$n.enfant.bin)

#### régression logistique 
m4<- glm(n.enfant.bin~age, smp5, family = binomial("logit"))
summary(m4)

#### exercice 4
aggregate(age ~ prof, data = subset(smp5, n.enfant > 3 & prof %in% c("sans emploi", "ouvrier", "cadre", "employé"), c(age, prof)), var)
281/88

n.fratrie.c <- cut(smp5$n.fratrie, breaks = c(0, 2, 4, 21), include.lowest = TRUE)
anova(lm(age ~ n.fratrie.c, data = smp))
summary(aov(age ~ n.fratrie.c, data = smp))


m <- glm(separation ~ age, data = smp5, family = binomial)
exp(confint(m))
exp(confint(m))["age",1]


m9<-lm(dur.interv~age, data=smp5)
summary(m9)
confint(m9, level=0.90)

suicideTT <- subset(smp5, dep.cons==1)
m10 <- glm(dep.cons~age, suicideTT, family = "binomial")
summary(m10)
###Log(p/(1-p))=-0.0116 -0.00982*age
###pour age=35 on a Log(p/(1-p))=-0.355
###soit p/(1-p)=0.7
###on trouve alors p = 0.7/1.7=0.412


##Quiz5
##On souhaite comparer le risque de rechute de la maladie alcoolique dans deux 
##sous-groupes: le groupe des plus de 50 ans (strictement plus de 50 ans, recodé en “1”)
##et le groupe des moins de 50 ans (50 ou moins, recodé en “0”).
##Donner la p-value associée au test statistique correspondant 
alcool<- read.csv2("alcool.csv")
install.packages("survival")
library(survival)
alcool$AGE.c <- ifelse(alcool$AGE >= 50 , 1 , 0)
str(alcool)
diff<-survdiff(Surv(t,SEVRE)~AGE.c, data=alcool)
p <- pchisq(diff$chisq, length(diff$n)-1, lower.tail = FALSE)
sprintf("%.4f",p)

##On souhaite tester l'association entre le risque de rechute de la maladie
##alcoolique et les variables SEXE, AGE et l'interaction entre les variables 
##SEXE et AGE. Donner la p-value associée
##à l'interaction entre les variables SEXE et AGE dans le test correspondant

mod<-coxph(Surv(t,SEVRE)~AGE+SEXE+AGE*SEXE, data=alcool)
mod






 


















