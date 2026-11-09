USE maple_leafs;

SELECT date_rencontre, heure_rencontre, equipe_adverse, domicile_exterieur, statut
FROM rencontre
WHERE statut IN ('prevue', 'reportee')
AND date_rencontre >= '2026-11-08'
ORDER BY date_rencontre, heure_rencontre;

SELECT nom_joueur, prenom_joueur, date_naissance
FROM joueur
WHERE date_naissance BETWEEN '1995-01-01' AND '1999-12-31'
ORDER BY date_naissance;

SELECT DISTINCT equipe_adverse
FROM rencontre
WHERE statut = 'jouee'
ORDER BY equipe_adverse;

SELECT id_joueur, date_debut, date_fin, description, statut
FROM blessure
WHERE description LIKE '%bas du corps%'
OR description LIKE '%genou%'
ORDER BY date_debut DESC;

SELECT prenom_joueur, nom_joueur
FROM joueur
WHERE nom_joueur LIKE 'Mc%'
OR nom_joueur LIKE '%-%'
ORDER BY nom_joueur;

SELECT code_tribune, nom, capacite
FROM tribune
WHERE id_lieu = 1
AND code_tribune LIKE '3__'
AND capacite BETWEEN 800 AND 900
ORDER BY capacite DESC;

SELECT date_rencontre, equipe_adverse
FROM rencontre
WHERE domicile_exterieur = 'domicile'
AND date_rencontre BETWEEN '2026-10-01' AND '2026-10-31'
AND equipe_adverse IN ('Canadiens de Montréal', 'Sénateurs d''Ottawa',
'Bruins de Boston', 'Red Wings de Détroit')
ORDER BY date_rencontre;

SELECT s.libelle AS saison, r.domicile_exterieur, COUNT(*) AS nb_rencontres
FROM rencontre r
JOIN saison s ON s.id_saison = r.id_saison
WHERE r.statut = 'jouee'
GROUP BY s.libelle, r.domicile_exterieur
ORDER BY s.libelle, r.domicile_exterieur;

SELECT j.nom_joueur, j.prenom_joueur, COUNT(*) AS nb_matchs_alignes
FROM convoquer c
JOIN joueur j ON j.id_joueur = c.id_joueur
JOIN rencontre r ON r.id_rencontre = c.id_rencontre
WHERE r.id_saison = 4
AND r.statut = 'jouee'
AND c.statut = 'convoque'
GROUP BY j.id_joueur, j.nom_joueur, j.prenom_joueur
HAVING COUNT(*) >= 5
ORDER BY nb_matchs_alignes DESC, j.nom_joueur;

SELECT j.nom_joueur, j.prenom_joueur,
COUNT(*) AS nb_blessures,
ROUND(AVG(DATEDIFF(b.date_fin, b.date_debut)), 1) AS duree_moyenne_jours
FROM blessure b
JOIN joueur j ON j.id_joueur = b.id_joueur
GROUP BY j.id_joueur, j.nom_joueur, j.prenom_joueur
HAVING COUNT(*) >= 2
ORDER BY nb_blessures DESC, duree_moyenne_jours DESC;

SELECT l.nom, l.ville,
COUNT(*) AS nb_tribunes,
SUM(t.capacite) AS capacite_totale,
MIN(t.capacite) AS plus_petite,
MAX(t.capacite) AS plus_grande
FROM tribune t
JOIN lieu l ON l.id_lieu = t.id_lieu
GROUP BY l.id_lieu, l.nom, l.ville
HAVING SUM(t.capacite) > 2000
ORDER BY capacite_totale DESC;

SELECT s.libelle AS saison,
COUNT(*) AS nb_joueurs,
ROUND(AVG(TIMESTAMPDIFF(YEAR, j.date_naissance, s.date_debut)), 1) AS age_moyen,
MIN(TIMESTAMPDIFF(YEAR, j.date_naissance, s.date_debut)) AS age_min,
MAX(TIMESTAMPDIFF(YEAR, j.date_naissance, s.date_debut)) AS age_max
FROM composer_effectif ce
JOIN saison s ON s.id_saison = ce.id_saison
JOIN joueur j ON j.id_joueur = ce.id_joueur
GROUP BY s.id_saison, s.libelle
ORDER BY s.libelle;

SELECT p.libelle AS poste_principal, COUNT(*) AS nb_joueurs
FROM composer_effectif ce
JOIN occuper o ON o.id_joueur = ce.id_joueur AND o.poste_principal = TRUE
JOIN poste p ON p.id_poste = o.id_poste
WHERE ce.id_saison = 4
GROUP BY p.id_poste, p.libelle
HAVING COUNT(*) >= 3
ORDER BY nb_joueurs DESC;

SELECT ce.numero_maillot, j.prenom_joueur, j.nom_joueur, p.code_poste, p.libelle AS poste
FROM composer_effectif ce
JOIN saison s ON s.id_saison = ce.id_saison
JOIN joueur j ON j.id_joueur = ce.id_joueur
JOIN occuper o ON o.id_joueur = j.id_joueur AND o.poste_principal = TRUE
JOIN poste p ON p.id_poste = o.id_poste
WHERE s.libelle = '2026-2027'
ORDER BY p.id_poste, ce.numero_maillot;

SELECT m.prenom_membre, m.nom_membre, f.libelle AS fonction,
CONCAT(sup.prenom_membre, ' ', sup.nom_membre) AS superviseur
FROM membre_staff m
JOIN exercer e ON e.id_membre = m.id_membre AND e.date_fin_exercice IS NULL
JOIN fonction_staff f ON f.id_fonction = e.id_fonction
LEFT JOIN membre_staff sup ON sup.id_membre = m.id_superviseur
ORDER BY f.id_fonction, m.nom_membre;

SELECT l.nom, l.ville, COUNT(r.id_rencontre) AS nb_rencontres
FROM lieu l
LEFT JOIN rencontre r ON r.id_lieu = l.id_lieu
GROUP BY l.id_lieu, l.nom, l.ville
ORDER BY nb_rencontres DESC, l.nom;

SELECT c.libelle AS categorie, COUNT(t.code_tribune) AS nb_tribunes
FROM tribune t
RIGHT JOIN categorie_tribune c ON c.id_categorie = t.id_categorie
GROUP BY c.id_categorie, c.libelle
ORDER BY nb_tribunes DESC;

SELECT r.date_rencontre, r.equipe_adverse, l.nom AS lieu,
ce.numero_maillot, j.prenom_joueur, j.nom_joueur, p.code_poste
FROM rencontre r
JOIN lieu l ON l.id_lieu = r.id_lieu
JOIN convoquer c ON c.id_rencontre = r.id_rencontre AND c.statut = 'convoque'
JOIN joueur j ON j.id_joueur = c.id_joueur
JOIN composer_effectif ce ON ce.id_joueur = j.id_joueur AND ce.id_saison = r.id_saison
JOIN occuper o ON o.id_joueur = j.id_joueur AND o.poste_principal = TRUE
JOIN poste p ON p.id_poste = o.id_poste
WHERE r.date_rencontre = '2026-11-10'
ORDER BY p.id_poste, ce.numero_maillot;

SELECT j.nom_joueur, j.prenom_joueur, b.date_debut, b.description, b.statut AS statut_blessure
FROM composer_effectif ce
JOIN joueur j ON j.id_joueur = ce.id_joueur
LEFT JOIN blessure b ON b.id_joueur = j.id_joueur
AND b.date_debut <= '2026-11-08'
AND b.date_fin IS NULL
WHERE ce.id_saison = 4
ORDER BY b.date_debut IS NULL, b.date_debut, j.nom_joueur;

SELECT j.nom_joueur, j.prenom_joueur
FROM joueur j
JOIN composer_effectif ce ON ce.id_joueur = j.id_joueur AND ce.id_saison = 4
WHERE NOT EXISTS (
SELECT 1 FROM blessure b WHERE b.id_joueur = j.id_joueur
)
ORDER BY j.nom_joueur;

SELECT j.nom_joueur, j.prenom_joueur
FROM joueur j
WHERE j.id_joueur IN (
SELECT c.id_joueur
FROM convoquer c
JOIN rencontre r ON r.id_rencontre = c.id_rencontre
WHERE r.date_rencontre = '2025-05-18' AND c.statut = 'convoque')
AND j.id_joueur IN (
SELECT id_joueur FROM composer_effectif WHERE id_saison = 4)
ORDER BY j.nom_joueur;

SELECT nom_joueur, prenom_joueur, date_naissance
FROM joueur
WHERE id_joueur NOT IN (SELECT id_joueur FROM composer_effectif);

SELECT code_tribune, nom, capacite
FROM tribune
WHERE id_lieu = 1
AND capacite >= ALL (
SELECT capacite FROM tribune
WHERE id_lieu = 1 AND capacite IS NOT NULL);

SELECT j.nom_joueur, j.prenom_joueur, j.date_naissance
FROM joueur j
JOIN composer_effectif ce ON ce.id_joueur = j.id_joueur AND ce.id_saison = 4
JOIN occuper o ON o.id_joueur = j.id_joueur AND o.poste_principal = TRUE AND o.id_poste <> 5
WHERE j.date_naissance > ANY (
SELECT jg.date_naissance
FROM joueur jg
JOIN composer_effectif ceg ON ceg.id_joueur = jg.id_joueur AND ceg.id_saison = 4
JOIN occuper og ON og.id_joueur = jg.id_joueur AND og.id_poste = 5)
ORDER BY j.date_naissance DESC;

SELECT m.prenom_membre, m.nom_membre
FROM membre_staff m
WHERE EXISTS (
SELECT 1
FROM membre_staff sub
JOIN exercer e ON e.id_membre = sub.id_membre
WHERE sub.id_superviseur = m.id_membre
AND e.date_fin_exercice IS NULL)
ORDER BY m.nom_membre;

SELECT j.nom_joueur, j.prenom_joueur, COUNT(*) AS nb_matchs_alignes
FROM convoquer c
JOIN joueur j ON j.id_joueur = c.id_joueur
WHERE c.statut = 'convoque'
GROUP BY j.id_joueur, j.nom_joueur, j.prenom_joueur
HAVING COUNT(*) > (
SELECT AVG(nb)
FROM (SELECT COUNT(*) AS nb
FROM convoquer
WHERE statut = 'convoque'
GROUP BY id_joueur) AS stats)
ORDER BY nb_matchs_alignes DESC;

SELECT j.nom_joueur, j.prenom_joueur
FROM joueur j
JOIN convoquer c ON c.id_joueur = j.id_joueur
JOIN rencontre r ON r.id_rencontre = c.id_rencontre
WHERE r.date_rencontre = '2026-11-10'
AND c.statut = 'convoque';
