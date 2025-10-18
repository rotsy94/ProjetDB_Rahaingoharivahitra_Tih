-- Partie A : projections, selection avec tri, DISTINCT, masques, IN, BETWEEN
-- 1. afficher la Liste des animaux présents dans le refuge triés par ordre alphabétique
select nom, statut
from animal
where statut ='en refuge'
order by nom ASC ;

-- 2. liste des animaux dont l'etat de santé est moyen ou bon
select nom, espece, etat_sante
from animal
where etat_sante='bon' or etat_sante='moyen';  

-- 3. soins administrés pour un animal entre deux dates 
select id_animal, id_soin, date_soin
from administrer
where date_soin between '2025-06-01' and '2025-09-30';

-- 4. animaux dont la race est incluse dans la liste "labradpr", "siamois"
select nom, race
from animal
where race in ('labrador', 'siamois');

-- 5. prenoms des adoptants dont le nom commence par M ou par L. Faire en sorte de ne pas afficher les doublons
select distinct prenom_adopteur
from adoption 
where nom_adopteur like '%L';

-- Partie B : fonction d'aggregation; GROUP BY, HAVING
-- 6. afficher le nombre d'animaux par espece
select espece, count(*) as nb_animaux
from animal
group by espece;

-- 7. nombre de soins administrés par veterinaire
select id_veterinaire, count(*) as soins_administres
from administrer
group by id_veterinaire;

-- 8. nombre de cage ayant une capacite superieure a la moyenne
select count(*) as nb_cage_sup_moy
from cage
where capacite > (select avg(capacite) as moy);

-- 9. somme du nombre d'animaux presents dans le refuge
select count(*) as nb_animal
from animal 
where statut='en refuge';

-- 10. afficher le nombre de cage qui contient exactement un animal
select num_cage, count(*) as nb_animaux
from cage
group by num_cage
having count(*) = 1;

-- partie C : jointurs internes, externes, simples, multiples
-- 11. liste des animaux avec le numero de cage ou ils se trouvent
select nom, cage.num_cage, capacite
from animal inner join cage on animal.num_cage=cage.num_cage;

-- 12. afficher les animaux et leur adoptant s'il y en a
select a.nom, ad.nom_adopteur, ad.prenom_adopteur
from animal a left join adoption ad on a.id_adoption and a.tel_adopteur=ad.tel_adopteur;

-- 13. detailler les soins avec le nom du veterinaire, le type de soin administré et le nom de l'animal
SELECT an.nom AS animal, so.type_soin, ve.nom_veterinaire
FROM administrer ad
JOIN animal an ON ad.id_animal = an.id_animal
JOIN soins so ON ad.id_soin = so.id_soin
JOIN veterinaire ve ON ad.id_veterinaire = ve.id_veterinaire AND ad.tel_veterinaire = ve.tel_veterinaire;

-- 14. afficher les cages qui ne contiennent pas d'animaux
SELECT c.num_cage, c.capacite
FROM cage c
LEFT JOIN animal a ON c.num_cage = a.num_cage
WHERE a.num_cage IS NULL;

-- 15. La liste ds animaux qui ont été adopté et les veterinaires qui leur ont administré au moins un soin
SELECT ani.nom, v.nom_veterinaire, v.prenom_veterinaire
FROM animal ani
JOIN administrer adm ON adm.id_animal = ani.id_animal
JOIN veterinaire v ON adm.id_veterinaire = v.id_veterinaire AND adm.tel_veterinaire = v.tel_veterinaire
WHERE statut = 'adopte';

-- Partie D : Requêtes imbriquées avec (NOT) IN, (NOT) EXIST, ANY, ALL
-- 16. animaux qui n'ont pas recu le soin sterilisation
SELECT nom
FROM animal
WHERE id_animal NOT IN (
  SELECT id_animal FROM administrer WHERE id_soin = (SELECT id_soin FROM soins WHERE type_soin = 'Sterilisation')
);

-- 17. liste des veterinaires qui n'ont administré aucun soin depuis le 01/09/2025
SELECT nom_veterinaire, prenom_veterinaire
FROM veterinaire
WHERE NOT EXISTS (
  SELECT * FROM administrer
  WHERE administrer.id_veterinaire = veterinaire.id_veterinaire
    AND administrer.tel_veterinaire = veterinaire.tel_veterinaire
    AND date_soin > '2025-09-01'
);

-- 18. affiche la cage dont la capacite max et atteinte
SELECT nom, cage.num_cage
FROM animal
JOIN cage ON animal.num_cage = cage.num_cage
WHERE cage.capacite = (SELECT MAX(capacite) FROM cage);

-- 19. animaux ayant recu plus de soins que la moyenne
SELECT nom
FROM animal
WHERE id_animal IN (
  SELECT id_animal
  FROM administrer
  GROUP BY id_animal
  HAVING COUNT(*) > (SELECT AVG(nb) FROM (SELECT COUNT(*) AS nb FROM administrer GROUP BY id_animal) X)
);

-- 20. tous les noms des adoptants ayant adopté un animal de race 'Siamois'
SELECT nom_adopteur
FROM adoption
WHERE id_adoption IN (
  SELECT id_adoption FROM adopter
  WHERE id_animal = ALL (SELECT id_animal FROM animal WHERE race = 'Siamois')
);
