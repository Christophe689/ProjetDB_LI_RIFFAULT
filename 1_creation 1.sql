USE maple_leafs;

CREATE TABLE joueur(
   id_joueur INT AUTO_INCREMENT,
   prenom_joueur VARCHAR(50) NOT NULL,
   nom_joueur VARCHAR(50) NOT NULL,
   date_naissance DATE NOT NULL,
   PRIMARY KEY(id_joueur)
);

CREATE TABLE blessure(
   id_blessure INT AUTO_INCREMENT,
   date_debut DATE NOT NULL,
   date_fin DATE,
   description VARCHAR(255),
   statut VARCHAR(30) NOT NULL,
   id_joueur INT NOT NULL,
   PRIMARY KEY(id_blessure),
   FOREIGN KEY(id_joueur) REFERENCES joueur(id_joueur)
);

CREATE TABLE saison(
   id_saison INT AUTO_INCREMENT,
   libelle VARCHAR(50) NOT NULL,
   date_debut DATE NOT NULL,
   date_fin DATE NOT NULL,
   PRIMARY KEY(id_saison)
);

CREATE TABLE poste(
    id_poste INT AUTO_INCREMENT,
    code_poste VARCHAR(5) NOT NULL,
    libelle VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_poste)
);

CREATE TABLE fonction_staff(
   id_fonction INT AUTO_INCREMENT,
   libelle VARCHAR(50) NOT NULL,
   description VARCHAR(255),
   PRIMARY KEY(id_fonction)
);

CREATE TABLE membre_staff(
   id_membre INT AUTO_INCREMENT,
   prenom_membre VARCHAR(50) NOT NULL,
   nom_membre VARCHAR(50) NOT NULL,
   id_membre_1 INT,
   PRIMARY KEY(id_membre),
   FOREIGN KEY(id_membre_1) REFERENCES membre_staff(id_membre)
);

CREATE TABLE lieu(
   id_lieu INT AUTO_INCREMENT,
   nom VARCHAR(100) NOT NULL,
   ville VARCHAR(100) NOT NULL,
   adresse VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_lieu)
);

CREATE TABLE categorie_tribune(
   id_categorie INT AUTO_INCREMENT,
   libelle VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_categorie)
);

CREATE TABLE rencontre(
    id_rencontre INT AUTO_INCREMENT,
    date_rencontre DATE NOT NULL,
    heure_rencontre TIME NOT NULL,
    equipe_adverse VARCHAR(100) NOT NULL,
    domicile_exterieur VARCHAR(10) NOT NULL CHECK(domicile_exterieur IN('domicile', 'exterieur')),
    statut VARCHAR(10) NOT NULL CHECK(statut IN('prevue', 'jouee', 'reportee', 'annulee')),
    id_saison INT NOT NULL,
    id_lieu INT NOT NULL,
    PRIMARY KEY(id_rencontre),
    FOREIGN KEY(id_saison) REFERENCES saison(id_saison),
    FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu)
);

CREATE TABLE tribune(
   id_lieu INT,
   id_tribune VARCHAR(10),
   nom VARCHAR(50) NOT NULL,
   capacite INT NOT NULL,
   id_categorie INT NOT NULL,
   PRIMARY KEY(id_lieu, id_tribune),
   FOREIGN KEY(id_lieu) REFERENCES lieu(id_lieu),
   FOREIGN KEY(id_categorie) REFERENCES categorie_tribune(id_categorie)
);

CREATE TABLE composer_effectif(
   id_joueur INT,
   id_saison INT,
   numero_maillot INT NOT NULL,
   PRIMARY KEY(id_joueur, id_saison),
   FOREIGN KEY(id_joueur) REFERENCES joueur(id_joueur),
   FOREIGN KEY(id_saison) REFERENCES saison(id_saison)
);

CREATE TABLE occuper(
    id_joueur INT,
    id_poste INT,
    poste_principal BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY(id_joueur, id_poste),
    FOREIGN KEY(id_joueur) REFERENCES joueur(id_joueur),
    FOREIGN KEY(id_poste) REFERENCES poste(id_poste)
);

CREATE TABLE convoquer(
   id_joueur INT,
   id_rencontre INT,
   statut VARCHAR(30) NOT NULL,
   date_convocation DATE NOT NULL,
   PRIMARY KEY(id_joueur, id_rencontre),
   FOREIGN KEY(id_joueur) REFERENCES joueur(id_joueur),
   FOREIGN KEY(id_rencontre) REFERENCES rencontre(id_rencontre)
);

CREATE TABLE exercer(
    id_membre INT,
    id_fonction INT,
    date_debut_exercice DATE NOT NULL,
    date_fin_exercice DATE,
    PRIMARY KEY(id_membre, id_fonction),
    FOREIGN KEY(id_membre) REFERENCES membre_staff(id_membre),
    FOREIGN KEY(id_fonction) REFERENCES fonction_staff(id_fonction)
);