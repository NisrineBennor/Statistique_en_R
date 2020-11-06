# Statistique_en_R
Il s'agit d'un ensemble de de 4 fichiers "csv". Plusieurs calculs ont été effectués sur l'ensemble de ces fichiers.
Régression logistique 
Régression linéaire simple et multiple
Représentation graphique: Boite à moustache ,Camenbert, histogramme,un diagramme en batôns,Diagramme temporel.....
Odds Ratio et Risque Relatif
p-value
test de Student 
test de Fisher 
Croisements de 2 variables  qualitatives ou quantitatives
tester la nullité de la coefficient de corrélation 
test de wilcoxon ou de Mann-Whitney
Calculer l'intervale de confiance 

Il existe aussi la présentation de l'ensemble des fichier CSV, sous forme de fichier pdf.

## **Présentation du jeu de données « Santé mentale en prison »**
**Fichier smp1.csv**

- age : âge (en année) ;
- prof : profession (parmi : agriculteur, artisan, cadre, profession intermédiaire, employé, ouvrier,
autre, sans emploi) ;
- dep.cons : existence d’un trouble dépressif (0 : non, 1 : oui) ; le diagnostic est fait selon le consensus des deux investigateurs cliniciens ;
- scz.cons : existence d’une trouble schizophrénique (0 : non, 1 : oui) ; le diagnostic est fait selon le consensus des deux investigateurs cliniciens ;
- grav.cons : niveau de gravité du détenu considéré sous l’angle de l’ensemble de sa psychopathologie ; l’évaluation est fait selon le consensus des deux investigateurs cliniciens ; le score varie de 1 à 7 (1 : normal, 2 : limite, 3 : légèrement, 4 : modérément, 5 : manifestement, 6 : gravement, 7 : parmi les patients les plus malades) ;
- n.enfant : nombred’enfants
- rs : niveau de recherche de sensation (1 : faible, 2 : modéré, 3 : élevé) ; relatif à l’instrument de mesure de la personnalité « TCI » (Temperament and Character Inventory) de R. Cloninger ; en fait le score original était dénommé « recherche de nouveauté » et était calculé à partir de la réponse à une liste d’items comme « J’aime explorer de nouvelles manières de faire les choses. Lorsque rien de nouveau n'arrive, je commence habituellement à rechercher quelque chose de sensationnel ou d'excitant » ;
- ed : niveau d’évitement du danger (1 : faible, 2 : modéré, 3 : élevé) ; relatif à l’instrument de mesure de la personnalité « TCI » (Temperament and Character Inventory) de R. Cloninger ; le score est calculé à partir de la réponse à une liste d’items comme « J'ai moins d'énergie et je me fatigue beaucoup plus vite que la plupart des gens. Je me sens souvent tendu et inquiet dans des situations non familières même lorsque les autres pensent qu'il y a peu de souci à se faire » ;
- dr : niveau de dépendance à la récompense (1 : faible, 2 : modéré, 3 : élevé) ; relatif à l’instrument de mesure de la personnalité « TCI » (Temperament and Character Inventory) de R. Cloninger ; le score est calculé à partir de la réponse à une liste d’items comme « J'aime faire plaisir aux gens autant que je le peux. Je voudrais avoir des amis proches et chaleureux autour de moi la plupart du temps. »



**Fichier smp2.csv**
- age : âge (en année) ;
- prof : profession (parmi : agriculteur, artisan, cadre, profession intermédiaire, employé, ouvrier,
autre, sans emploi) ;
- duree : durée d’incarcération (1: Moins d’1 mois, 2 : 1 à 6 mois, 3 : 6 mois à 1 an, 4 : 1 à 5 ans, 5 : 5 ans ou plus)
- discip : depuis votre incarcération, le détenu a-t-il fait l’objet d’une procédure disciplinaire ? (0 : non, 1 : oui)
- n.enfant : nombred’enfants
- n.fratrie : taille de la fratrie (c’est-à-dire nombre de frères et sœurs)
- ecole : niveau de formation actuel (1 : sans diplôme, 2 : collège, 3 : CAP, BEP, 4 : Lycée, 5 : université)
- separation : dans l’enfance, le détenu a-t-il été séparé au moins 6 mois d’un de ses parents ou de ses deux parents ? (0 : non, 1 : oui)
- juge.enfant : avant ses 18 ans, le détenu a-t-il été suivi par un juge pour enfants ? (0 : non, 1 : oui)
- place : avant ses 18 ans, le détenu a-t-il été l’objet d’une mesure de placement (foyer, famille d’accueil...) ? (0 : non, 1 : oui)
- abus : le détenu a-t-il subi des maltraitances dans l’enfance (de nature physique, psychologique ou sexuelle) ? (0 : non, 1 : oui)
- grav.cons : niveau de gravité du détenu considéré sous l’angle de l’ensemble de sa psychopathologie ; l’évaluation est fait selon le consensus des deux investigateurs cliniciens ; le score varie de 1 à 7 (1 : normal, 2 : limite, 3 : légèrement, 4 : modérément, 5 : manifestement, 6 : gravement, 7 : parmi les patients les plus malades) ;
- dep.cons : existence d’un trouble dépressif (0 : non, 1 : oui) ; le diagnostic est fait selon le consensus des deux investigateurs cliniciens ;
- ago.cons : existence d’un trouble agoraphobique (0 : non, 1 : oui) ; le diagnostic est fait selon le consensus des deux investigateurs cliniciens ;
- ptsd.cons : existence d’un syndrome de stress post traumatique (0 : non, 1 : oui) ; le diagnostic est fait selon le consensus des deux investigateurs cliniciens ;
- alc.cons : existence d’un abus d’alcool (0 : non, 1 : oui) ; le diagnostic est fait selon le consensus des deux investigateurs cliniciens ;
- subst.cons : existence d’un abus de substance (0 : non, 1 : oui) ; le diagnostic est fait selon le consensus des deux investigateurs cliniciens ;
- scz.cons : existence d’une trouble schizophrénique (0 : non, 1 : oui) ; le diagnostic est fait selon le consensus des deux investigateurs cliniciens ;
- char : intensité d’un éventuel trouble de la personnalité (1 : absent, 2 : léger, 3 : moyen, 4 : sévère) ; relatif à l’instrument de mesure de la personnalité « TCI » (Temperament and Character Inventory) de R. Cloninger
- rs : niveau de recherche de sensation (1 : faible, 2 : modéré, 3 : élevé) ; relatif à l’instrument de mesure de la personnalité « TCI » (Temperament and Character Inventory) de R. Cloninger ; en fait le score original était dénommé « recherche de nouveauté » et était calculé à partir de la réponse à une liste d’items comme « J’aime explorer de nouvelles manières de faire les choses. Lorsque rien de nouveau n'arrive, je commence habituellement à rechercher quelque chose de sensationnel ou d'excitant » ;
- ed : niveau d’évitement du danger (1 : faible, 2 : modéré, 3 : élevé) ; relatif à l’instrument de mesure de la personnalité « TCI » (Temperament and Character Inventory) de R. Cloninger ; le score est calculé à partir de la réponse à une liste d’items comme « J'ai moins d'énergie et je me fatigue beaucoup plus vite que la plupart des gens. Je me sens souvent tendu et inquiet dans des situations non familières même lorsque les autres pensent qu'il y a peu de souci à se faire » ;
- dr : niveau de dépendance à la récompense (1 : faible, 2 : modéré, 3 : élevé) ; relatif à l’instrument de mesure de la personnalité « TCI » (Temperament and Character Inventory) de R. Cloninger ; le score est calculé à partir de la réponse à une liste d’items comme « J'aime faire plaisir aux gens autant que je le peux. Je voudrais avoir des amis proches et chaleureux autour de moi la plupart du temps. » ;
- suicide.s : score de risque suicidaire variant de 1 à 6 et obtenu à partir de la somme des réponses obtenues à 6 items parmi lesquels « Au cours du mois écoulé avez-vous voulu vous faire du mal ? Au cours du mois écoulé avez-vous établi la façon dont vous pourriez vous suicider ? » ;
- suicide.hr : le détenu est-il à haut risque suicidaire ? (1 : faible, 2 : modéré, 3 : élevé) ; relatif à l’instrument de mesure de la personnalité « TCI » (Temperament and Character Inventory) de R. Cloninger (0 : non, 1 : oui) ;
- suicide.past : existence d’un antécédent de tentative de suicide (0 : non, 1 : oui) ; dur.interv :duréedel’interviewenminutes;
