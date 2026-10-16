Mini-projet bases de données : Toronto Maple Leafs Hockey Club
TI503N, Bases de données 1. Binôme : Christophe LI, Nolan Riffault

Le projet conçoit, avec la méthode MERISE, la base de données sportive d'un club de la NHL inspiré des Toronto Maple Leafs. Le périmètre couvre l'effectif des joueurs par saison, les postes, les blessures, les fonctions du staff, les rencontres, leurs lieux, les convocations et les catégories de tribune.

Contenu du dépôt
Fichier	Contenu
README.md	Documentation du projet
prompt_ricardo.txt	Prompt soumis à l'IAG
[MCD].loo	Fichier source du MCD (Looping)
[MCD].png	Image du MCD

Partie 1 : analyse des besoins
Prompt RICARDO utilisé
R — Rôle :
Tu travailles dans le domaine du sport professionnel, plus précisément dans le hockey sur glace. Tu connais le fonctionnement général d'un club professionnel évoluant dans la Ligue nationale de hockey (NHL). Le club étudié est le Toronto Maple Leafs Hockey Club, basé à Toronto. La base de données envisagée concerne uniquement l'effectif des joueurs, les postes, les blessures, les fonctions du staff, les dates et lieux des rencontres, le statut des convocations et les catégories de tribune.

I — Instructions :
Inspire-toi des sites web suivants pour comprendre le contexte du club, du hockey professionnel et de son calendrier :
- https://www.nhl.com/mapleleafs/
- https://www.nhl.com/
- https://www.scotiabankarena.com/
Le club souhaite appliquer la méthode MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse des besoins. Tu dois te comporter comme une personne qui connaît le fonctionnement général du club et expliquer ses besoins à un étudiant en ingénierie informatique. Cet étudiant réalisera ensuite lui-même les étapes de conception et de développement de la base de données.
Aucune information interne du club ne t'a été communiquée. Ne prétends donc pas connaître ses procédures internes. Lorsque les références publiques ne permettent pas de confirmer une règle, formule une hypothèse raisonnable et indique clairement qu'elle doit être validée.

C — Contexte :
Le domaine est celui d'un club professionnel de hockey sur glace comparable aux Toronto Maple Leafs. La démarche de conception est la méthode MERISE. Le destinataire est un étudiant qui doit recueillir les besoins métier avant de construire le MCD, le MLD et le MPD.
Le périmètre demandé comprend uniquement les activités suivantes :
- gérer l'effectif des joueurs par saison ;
- gérer les postes des joueurs ;
- enregistrer les blessures des joueurs ;
- gérer les fonctions exercées par les membres du staff ;
- enregistrer les dates des rencontres ;
- enregistrer les lieux des matchs ;
- suivre le statut des convocations des joueurs pour les rencontres ;
- classer les tribunes par catégorie.
N'ajoute pas la gestion des contrats, des statistiques, des officiels, des supporters, de la billetterie ou des sponsors.

A — Contraintes additionnelles :
D'abord, établis les règles de gestion du club sous la forme d'une liste à puces. Elles doivent être formulées comme les expliquerait une personne connaissant le métier, sans vocabulaire de conception de base de données.
Les règles doivent couvrir les huit activités du périmètre et préciser les cas importants : inscription d'un joueur dans un effectif saisonnier, attribution d'un ou plusieurs postes, suivi des dates d'une blessure, exercice d'une ou plusieurs fonctions par un membre du staff, programmation d'une rencontre, lieu du match, convocation d'un joueur et statut associé, ainsi que classement des tribunes.
Ne présente pas de choix de modélisation comme des clés primaires, des clés étrangères, des tables ou des relations techniques. Si une règle n'est pas confirmée par les sources publiques, indique qu'il s'agit d'une hypothèse à valider. N'invente pas de procédures internes au club.

R — Références :
- https://www.nhl.com/mapleleafs/
- https://www.nhl.com/
- https://www.scotiabankarena.com/
Utilise ces références comme contexte général. Elles ne donnent pas nécessairement accès aux règles de fonctionnement internes du club. Distingue les informations confirmées par les sources des hypothèses proposées.

D — Rendement désiré :
Après les règles de gestion, fournis un dictionnaire de données brutes sous forme de tableau. Il doit contenir entre 25 et 35 données distinctes, couvrant les huit activités du périmètre.
Le tableau doit comporter exactement les colonnes suivantes :
- Signification de la donnée
- Type
- Taille en nombre de caractères ou de chiffres
Le dictionnaire doit décrire les données métier sans indiquer comment elles seront modélisées ensuite. N'ajoute pas de colonnes d'identifiant technique, de clé primaire, de clé étrangère ou de table. Pour les dates et heures, indique le format et la taille envisagés. Pour les données dont la taille dépend des règles du club, donne une taille indicative et signale qu'elle doit être confirmée.
Fournis uniquement :
1. les règles de gestion sous forme de liste à puces ;
2. le dictionnaire de données sous forme de tableau ;
3. une courte liste des hypothèses à faire valider.

O — Objectif :
Permettre à l'étudiant de disposer des informations métier nécessaires pour construire ensuite le MCD, le MLD et le MPD selon la méthode MERISE, à partir des règles de gestion et du dictionnaire de données fournis.

Règles de gestion obtenues
La base porte sur les effectifs et activités sportives du Toronto Maple Leafs Hockey Club.
Chaque saison possède un identifiant, un libellé, une date de début et une date de fin. La date de fin est postérieure à la date de début.
Un joueur peut être inscrit à plusieurs saisons. Pour une saison donnée, il ne peut avoir qu'une seule inscription à l'effectif.
Le numéro de chandail est associé à l'inscription d'un joueur pour une saison ; il n'identifie pas le joueur de façon permanente.
Un joueur peut occuper un ou plusieurs postes. Si plusieurs postes sont enregistrés, un seul peut être indiqué comme poste principal.
Un poste peut être occupé par plusieurs joueurs.
Un joueur peut avoir plusieurs blessures enregistrées. Chaque blessure concerne un seul joueur et comporte une date de début ; sa date de fin peut être inconnue.
La date de fin d'une blessure, lorsqu'elle est renseignée, ne peut pas précéder sa date de début.
Les informations sur une blessure se limitent aux dates et à un descriptif utile à la gestion sportive ; les diagnostics médicaux détaillés sont exclus.
Un membre du staff peut exercer plusieurs fonctions, et une fonction peut être exercée par plusieurs membres.
Une affectation à une fonction peut avoir une date de début et une date de fin afin d'en conserver l'historique.
Un membre du staff peut superviser zéro ou plusieurs autres membres. Il a au plus un superviseur direct et ne peut pas se superviser lui-même.
Chaque rencontre appartient à une saison et possède une date et une heure prévues.
Chaque rencontre se déroule dans un seul lieu. Un lieu peut accueillir plusieurs rencontres.
Une convocation relie un joueur à une rencontre. Un même joueur ne possède qu'une convocation par rencontre.
Chaque convocation possède un statut, par exemple "convoqué", "non retenu" ou "indisponible". Un statut peut être utilisé pour plusieurs convocations.
Chaque tribune appartient à un seul lieu et possède un code unique dans ce lieu.
Un lieu peut comporter plusieurs tribunes ; une catégorie de tribune peut être associée à plusieurs tribunes.

Dictionnaire de données obtenu
Les trois premières colonnes reprennent la réponse de l'IA. La dernière indique où chaque donnée se trouve dans le MCD.

Signification de la donnée	Type	Taille indicative	Élément du MCD
Prénom du joueur	Texte	60 caractères	JOUEUR.prenom_joueur
Nom du joueur	Texte	60 caractères	JOUEUR.nom_joueur
Date de naissance du joueur	Date (AAAA-MM-JJ)	10 caractères	JOUEUR.date_naissance
Numéro de chandail porté pour une saison	Entier	2 chiffres	COMPOSER_EFFECTIF.numero_maillot
Libellé de la saison	Texte	20 caractères	SAISON.libelle
Date de début de la saison	Date (AAAA-MM-JJ)	10 caractères	SAISON.date_debut
Date de fin de la saison	Date (AAAA-MM-JJ)	10 caractères	SAISON.date_fin
Code du poste occupé	Texte	10 caractères	POSTE.code_poste
Libellé du poste occupé	Texte	40 caractères	POSTE.libelle
Date de début de la blessure	Date (AAAA-MM-JJ)	10 caractères	BLESSURE.date_debut
Date de fin de la blessure, si connue	Date (AAAA-MM-JJ)	10 caractères	BLESSURE.date_fin
Description de la blessure	Texte	300 caractères	BLESSURE.description
État de suivi de la blessure	Texte	30 caractères	BLESSURE.statut
Prénom du membre du staff	Texte	60 caractères	MEMBRE_STAFF.prenom_membre
Nom du membre du staff	Texte	60 caractères	MEMBRE_STAFF.nom_membre
Nom de la fonction exercée	Texte	80 caractères	FONCTION_STAFF.libelle
Description de la fonction	Texte	300 caractères	FONCTION_STAFF.description
Date de début d'exercice de la fonction	Date (AAAA-MM-JJ)	10 caractères	EXERCER.date_debut_exercice
Date de fin d'exercice de la fonction, si connue	Date (AAAA-MM-JJ)	10 caractères	EXERCER.date_fin_exercice
Nom du superviseur du membre du staff, si cette hiérarchie est retenue	Texte	120 caractères	Association SUPERVISER (obtenu par jointure, non stocké)
Date de la rencontre	Date (AAAA-MM-JJ)	10 caractères	RENCONTRE.date_rencontre
Heure prévue de la rencontre	Heure (HH:MM)	5 caractères	RENCONTRE.heure_rencontre
Nom de l'équipe adverse	Texte	120 caractères	RENCONTRE.equipe_adverse
Indication rencontre à domicile ou à l'extérieur	Texte	10 caractères	RENCONTRE.domicile_exterieur
Nom du lieu de la rencontre	Texte	120 caractères	LIEU.nom
Ville du lieu de la rencontre	Texte	80 caractères	LIEU.ville
Adresse du lieu de la rencontre	Texte	200 caractères	LIEU.adresse
Date d'enregistrement de la convocation	Date (AAAA-MM-JJ)	10 caractères	CONVOQUER.date_convocation
Statut de la convocation	Texte	40 caractères	CONVOQUER.statut
Code de la tribune dans le lieu	Texte	20 caractères	TRIBUNE.code_tribune
Nom de la tribune	Texte	80 caractères	TRIBUNE.nom
Catégorie de la tribune	Texte	60 caractères	CATEGORIE_TRIBUNE.libelle
Capacité de la tribune, si connue	Entier	6 chiffres	TRIBUNE.capacite
Analyse du résultat
L'IA a renvoyé 33 données, dans la fourchette demandée (25 à 35), et ses règles couvrent les huit activités du périmètre.

Partie 2 : MCD

Entités
Entité	Identifiant	Attributs
JOUEUR	id_joueur	prenom_joueur, nom_joueur, date_naissance
SAISON	id_saison	libelle, date_debut, date_fin
POSTE	code_poste	libelle
BLESSURE	id_blessure	date_debut, date_fin, description, statut
MEMBRE_STAFF	id_membre	prenom_membre, nom_membre
FONCTION_STAFF	id_fonction	libelle, description
RENCONTRE	id_rencontre	date_rencontre, heure_rencontre, equipe_adverse, domicile_exterieur, statut
LIEU	id_lieu	nom, ville, adresse
TRIBUNE (entité faible)	id_lieu + code_tribune	nom, capacite
CATEGORIE_TRIBUNE	id_categorie	libelle
L'attribut statut de RENCONTRE est un ajout de notre part, absent du dictionnaire. Il sert à indiquer l'état de la rencontre (valeurs à définir en partie 2).

Associations
Association	Entités reliées	Cardinalités	Attributs portés
COMPOSER_EFFECTIF	JOUEUR / SAISON	JOUEUR (0,n) ; SAISON (0,n)	numero_maillot
OCCUPER	JOUEUR / POSTE	JOUEUR (1,n) ; POSTE (0,n)	poste_principal
SUBIR	JOUEUR / BLESSURE	JOUEUR (0,n) ; BLESSURE (1,1)	
EXERCER	MEMBRE_STAFF / FONCTION_STAFF	MEMBRE_STAFF (0,n) ; FONCTION_STAFF (0,n)	date_debut_exercice, date_fin_exercice
SUPERVISER (récursive)	MEMBRE_STAFF / MEMBRE_STAFF	superviseur (0,n) ; supervisé (0,1)	
PLANIFIER	RENCONTRE / SAISON	RENCONTRE (1,1) ; SAISON (0,n)	
SE_DEROULER	RENCONTRE / LIEU	RENCONTRE (1,1) ; LIEU (0,n)	
CONVOQUER	JOUEUR / RENCONTRE	JOUEUR (0,n) ; RENCONTRE (0,n)	statut, date_convocation
COMPORTER	LIEU / TRIBUNE	LIEU (0,n) ; TRIBUNE (1,1) (R)	
APPARTENIR	TRIBUNE / CATEGORIE_TRIBUNE	TRIBUNE (1,1) ; CATEGORIE_TRIBUNE (0,n)

Éléments de modélisation avancée
L'association récursive SUPERVISER relie MEMBRE_STAFF à elle-même pour représenter la hiérarchie du staff (règle 12). Un membre peut superviser zéro ou plusieurs membres et a au plus un superviseur direct. Le nom du superviseur, présent dans le dictionnaire, se retrouve par cette association : le stocker dans MEMBRE_STAFF créerait une redondance contraire à la 3FN.

TRIBUNE est une entité faible rattachée à l'entité forte LIEU (règle 17). Un code de tribune n'est unique qu'à l'intérieur d'un lieu, donc l'identifiant complet d'une tribune est le couple (id_lieu, code_tribune). Dans Looping, l'identification relative est marquée par le (R) sur la cardinalité 1,1 de COMPORTER.
