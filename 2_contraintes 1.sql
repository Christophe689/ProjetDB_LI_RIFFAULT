USE maple_leafs;

ALTER TABLE saison ADD CONSTRAINT chk_saison_dates CHECK (date_fin > date_debut);

ALTER TABLE joueur ADD CONSTRAINT chk_joueur_nom CHECK (LENGTH(nom_joueur) > 0);
ALTER TABLE joueur ADD CONSTRAINT chk_joueur_prenom CHECK (LENGTH(prenom_joueur) > 0);

ALTER TABLE joueur ADD CONSTRAINT chk_joueur_naissance CHECK (YEAR(date_naissance) BETWEEN 1985 AND 2010);

ALTER TABLE composer_effectif ADD CONSTRAINT chk_effectif_numero CHECK (numero_maillot BETWEEN 1 AND 98);

ALTER TABLE tribune ADD CONSTRAINT chk_tribune_capacite CHECK (capacite IS NULL OR capacite > 0);

ALTER TABLE rencontre ADD CONSTRAINT chk_rencontre_lieu CHECK (domicile_exterieur IN ('domicile', 'exterieur'));
ALTER TABLE rencontre ADD CONSTRAINT chk_rencontre_statut CHECK (statut IN ('prevue', 'jouee', 'reportee', 'annulee'));

ALTER TABLE blessure ADD CONSTRAINT chk_blessure_dates CHECK (date_fin IS NULL OR date_fin >= date_debut);
ALTER TABLE blessure ADD CONSTRAINT chk_blessure_statut CHECK (statut IN ('en cours', 'en reeducation', 'retabli'));
ALTER TABLE blessure ADD CONSTRAINT chk_blessure_statut_fin CHECK (
(statut = 'retabli' AND date_fin IS NOT NULL)
OR (statut <> 'retabli' AND date_fin IS NULL)
);

ALTER TABLE exercer ADD CONSTRAINT chk_exercer_dates CHECK (date_fin_exercice IS NULL OR date_fin_exercice >= date_debut_exercice);

ALTER TABLE convoquer ADD CONSTRAINT chk_convoquer_statut CHECK (statut IN ('convoque', 'non retenu', 'indisponible'));

ALTER TABLE saison ADD CONSTRAINT chk_saison_libelle CHECK (libelle LIKE '____-____');

ALTER TABLE composer_effectif ADD CONSTRAINT uq_effectif_numero UNIQUE (id_saison, numero_maillot);

ALTER TABLE poste ADD CONSTRAINT uq_poste_code UNIQUE (code_poste);

ALTER TABLE rencontre ADD CONSTRAINT chk_rencontre_heure CHECK (heure_rencontre BETWEEN '10:00:00' AND '23:00:00');
ALTER TABLE rencontre ADD CONSTRAINT chk_rencontre_adversaire CHECK (equipe_adverse <> 'Toronto Maple Leafs');

ALTER TABLE convoquer ALTER COLUMN statut SET DEFAULT 'convoque';