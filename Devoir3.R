### Devoir 3


### definir le repertoire du travail 
setwd(~/INTRO_Stat_FunMooc_Nisrine)
### importer le fichier satisfaction_hopital.csv
Satisfaction_Hopital <- read.csv2("satisfaction_hopital.csv")
### afficher le nombre de ligne et de colonnes du jeu de données 
dim(Satisfaction_Hopital)


##1)Estimez le modèle de régression linéaire expliquant la variable « score.relation » par les variables « age », « sexe », « score.information », « amelioration.sante », « amelioration.moral », « profession », « service ». (Le script doit inclure la vérification éventuelle des conditions de validité de la méthode utilisée.)

# recodage des variables catégorielles effectué en semaine 1
Satisfaction_Hopital$profession.c <- factor(Satisfaction_Hopital$profession,
                                 labels=c("agriculteur","artisan"
                                           ,"cadre","intermédiaire"
                                            ,"employé","ouvrier"
                                            ,"sans emploi","autre"))
Satisfaction_Hopital$service.c <- factor(Satisfaction_Hopital$service,
                             labels=c("1","2","3","4","5","6","7","8"))
mod <- lm(score.relation~ age+sexe+score.information
             +amelioration.sante + amelioration.moral
             + profession.c + service.c, data=Satisfaction_Hopital)
##Effet global de variable catégorielle
drop1(mod,.~.,test="F")
summary(mod)
# Condition de validité du test
# normalité du terme de bruit (résidus du modèle)
hist(resid(mod), col="grey")
# l'histogramme montre que les termes de bruit suivent une loi normale.
# On peut donc considérer que le modèle est valide.

##2)Modèle de régression logistique expliquant la variable « recommander.b » par
#les variables «âge», «sexe», «score.information», «amelioration.sante», «amelioration.
##moral», «profession», «service».

#recodage effectué en semaine 1
Satisfaction_Hopital$recommander.b <- ifelse(Satisfaction_Hopital$recommander==2,1,0)
# Modèle
mod2 <- glm(recommander.b~ age+sexe+score.information+amelioration.sante
                 + amelioration.moral + profession.c + service.c,
                data=Satisfaction_Hopital, family="binomial")
summary(mod2)
##Effet global de variable catégorielle
drop1(mod2,.~.,test="Chisq")


# conditions de validité
# Au moins 5 à 10 évenements par variable explicative
# 1+1+1+1+1+7+7 variables explicatives: 19*10 = 190 < 294
# On peut donc considérer que le modèle est valide.

## fin de devoir