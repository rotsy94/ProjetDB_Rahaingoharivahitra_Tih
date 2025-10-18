INSERT INTO Cage (num_cage, capacite) VALUES
  (1, 5),
  (2, 2),
  (3, 8),
  (4, 10),
  (5, 4),
  (6, 6);

INSERT INTO Soins (id_soin, type_soin) VALUES
  (1, 'Vaccination'),
  (2, 'Vermifuge'),
  (3, 'Sterilisation'),
  (4, 'Controle general'),
  (5, 'Deparasitage'),
  (6, 'Consultation specialisee');

INSERT INTO Veterinaire (id_veterinaire, tel_veterinaire, nom_veterinaire, prenom_veterinaire) VALUES
  (10, 3311223344, 'Da Vinci', 'Leonardo'),
  (11, 3399887766, 'Kahlo', 'Frida'),
  (12, 3319393993, 'Hockney', 'David'),
  (13, 3381818222, 'Weiwei', 'Ai'),
  (14, 3322272727, 'Picasso', 'Pablo');

INSERT INTO Adoption (id_adoption, tel_adopteur, nom_adopteur, prenom_adopteur, date_adoption) VALUES
  (200, 3362211456, 'MoMA', 'Alice', '2025-10-01'),
  (201, 3371568432, 'Louvre', 'Sofiane', '2025-10-09'),
  (202, 3385636721, 'Ermitage', 'Fatima', '2025-09-19'),
  (203, 3358747832, 'Tate', 'Oscar', '2025-07-30'),
  (204, 3342985697, 'Prado', 'Laura', '2025-08-23');

INSERT INTO Animal (
  id_animal, race, espece, nom, sexe, date_naissance, date_arrivee, etat_sante, statut, num_cage, id_adoption, tel_adopteur
) VALUES
  (100, 'Siamois', 'Chat', 'Olympia', 'F', '2024-05-21', '2025-01-15', 'Bon', 'adopte', 1, 200, 3362211456),
  (101, 'Labrador', 'Chien', 'Starry', 'M', '2023-10-02', '2025-02-03', 'Bon', 'adopte', 3, 201, 3371568432),
  (102, 'Persan', 'Chat', 'Salvador', 'M', '2025-03-11', '2025-08-19', 'Fragile', 'en refuge', 2, NULL, NULL),
  (103, 'Border Collie', 'Chien', 'Guernica', 'F', '2024-12-07', '2025-05-26', 'Bon', 'en refuge', 1, NULL, NULL),
  (104, 'Exotic Shorthair', 'Chat', 'Venus', 'F', '2024-07-09', '2025-07-19', 'Moyen', 'en refuge', 3, NULL, NULL),
  (105, 'Abyssin', 'Chat', 'Mona', 'F', '2025-02-17', '2025-06-08', 'Bon', 'adopte', 4, 202, 3385636721),
  (106, 'Berger Australien', 'Chien', 'Sunflowers', 'M', '2024-06-15', '2025-05-11', 'Bon', 'adopte', 5, 203, 3358747832),
  (107, 'Carlin', 'Chien', 'LesNympheas', 'F', '2025-02-09', '2025-04-21', 'Fragile', 'en refuge', 2, NULL, NULL),
  (108, 'Levrier', 'Chien', 'Sacrebleu', 'M', '2024-10-22', '2025-03-15', 'Bon', 'adopte', 6, 204, 3342985697);

INSERT INTO ADMINISTRER (
  id_animal, id_soin, id_veterinaire, tel_veterinaire, date_soin
) VALUES
  (100, 1, 10, 3311223344, '2025-01-25'),
  (101, 2, 11, 3399887766, '2025-02-10'),
  (102, 1, 10, 3311223344, '2025-08-21'),
  (103, 3, 11, 3399887766, '2025-06-05'),
  (104, 2, 10, 3311223344, '2025-07-22'),
  (105, 4, 12, 3319393993, '2025-07-10'),
  (106, 5, 13, 3381818222, '2025-08-12'),
  (107, 6, 14, 3322272727, '2025-09-01'),
  (108, 3, 13, 3381818222, '2025-09-12');

INSERT INTO Adopter (id_animal, id_adoption) VALUES
  (100, 200),
  (101, 201),
  (105, 202),
  (106, 203),
  (108, 204);


