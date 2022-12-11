-- base de données pour le PokéQuiz

BEGIN;

-- on supprime la clef étrangère "bonne réponse" lors de l'ajout des données, les tables "answer" et "question" étant liées 
ALTER TABLE "answer"
    DROP CONSTRAINT answer_question_id_fkey;

-- données table "answer"
INSERT INTO "answer" ("id", "description", "question_id") VALUES

(1, 'Sacha', 1),
(2, 'Electrique', 2),
(3, 'Raichu', 3),
(4, 'Pierre foudre', 4),
(5, '26', 5),
(6, 'La vitesse', 6),
(7, '25', 7),
(8, 'Un écureuil', 8),
(9, 'Bulbizarre', 9),
(10, 'Papilusion', 10),
(11, 'Sabelette', 11),
(12, 'Nosferalto', 12),
(13, 'M. Mime', 13),
(14, 'Hypnomade', 14),
(15, 'Reptincel', 15),
(16, 'Voltorbe', 16),
(17,'Ondine', 1),
(18, 'Eau', 2),
(19, 'Florizarre', 3),
(20, 'Pierre glace', 4),
(21, '42', 5),
(22, 'L''endurance', 6),
(23, '1', 7),
(24, 'Une souris', 8),
(25, 'Pikachu', 9),
(26, 'Rondoudou', 10),
(27, 'Osselait', 11),
(28, 'Persian', 12),
(29, 'Taupiqueur', 13),
(30,  'Akwakwak', 14),
(31, 'Krabboss', 15),
(32, 'Amonita', 16),
(33,'Pierre', 1),
(34, 'Poison', 2),
(35, 'Rattatac', 3),
(36, 'Pierre eau', 4),
(37, '99', 5),
(38, 'La défense', 6),
(39, '151', 7),
(40, 'Un lapin', 8),
(41, ' Piafabec', 9),
(42, 'Nidoqueen', 10),
(43, 'Hypotrempe', 11),
(44, 'Dardargnan', 12),
(45, 'Chetiflor', 13),
(46, 'Ponyta ', 14),
(47, ' Staross', 15),
(48, 'Tauros ', 16),
(49,'Auguste ',1),
(50, 'Roche ', 2),
(51, 'Tetarte ', 3),
(52, 'Pierre plante ', 4),
(53, '55 ', 5),
(54, 'L''attaque ', 6),
(55, '100 ', 7),
(56, 'Une chevre ', 8),
(57, 'Rondoudou ', 9),
(58, 'Canarticho ', 10),
(59, ' Elektek', 11),
(60, 'Goupix ', 12),
(61, 'Tartard ', 13),
(62, 'Gravalanch ', 14),
(63, 'Minidraco ', 15),
(64, ' Noeunoeuf', 16);

-- données table "quiz"
INSERT INTO "quiz" ("id", "title") VALUES

(1, 'Un quiz sur Pikachu'),
(2, 'Qui est ce pokemon?');

-- données table "question"
INSERT INTO "question" ("id", "quiz_id", "question", "answer_id") VALUES

(1, 1, 'Qui est le dresseur de Pikachu?', 1),
(2, 1, 'De quel type est Pikachu ?', 2),
(3, 1, 'Quelle est la derniere évolution de Pikachu?', 3),
(4, 1, 'Grace à quelle pierre Pikachu évolue t''il?', 4),
(5, 1, 'Quel niveau doit atteindre Pikachu pour apprendre l''attaque Tonnerre?',5),
(6, 1, 'Quel est le point fort de Pikachu?',6),
(7, 1, 'Pikachu est le pokemon n°',7),
(8, 1, 'De quel animal est inspiré Pikachu?',8),
(9, 2, '1.png', 9),
(10, 2, '12.png', 10),
(11, 2, '27.png', 11),
(12, 2, '42.png', 12),
(13, 2, '122.png', 13),
(14, 2, '97.png', 14),
(15, 2, '5.png', 15),
(16, 2, '100.png', 16);

-- données de la table "tag"

INSERT INTO "tag" ("id", "name") VALUES
(1, 'Pikachu'),
(2, 'blabla'),

- Déchargement des données de la table "quiz_has_tag"
--

INSERT INTO "quiz_has_tag" ("quiz_id", "tag_id") VALUES
(1, 1),
(2, 2),


-- On rajoute la clé étrangère
ALTER TABLE "answer"
  ADD FOREIGN KEY ("question_id") REFERENCES "question" ("id");

COMMIT;

BEGIN;

SELECT setval('answer_id_seq', (SELECT MAX(id) from "answer"));
SELECT setval('question_id_seq', (SELECT MAX(id) from "question"));
SELECT setval('quiz_id_seq', (SELECT MAX(id) from "quiz"));
SELECT setval('tag_id_seq', (SELECT MAX(id) from "tag"));

COMMIT;