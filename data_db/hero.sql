-- 1
SELECT Nom FROM Heros ORDER BY Nom ASC

-- 2
SELECT Nom, PV FROM Heros WHERE PV = 40

-- 3
SELECT COUNT(Nom) as "Total ayant 40PV" FROM Heros WHERE PV = 40

-- 4
SELECT Nom, PV FROM Heros ORDER BY PV ASC

-- 5
SELECT Nom, MAX(PV) FROM Heros

-- 6
SELECT SUM(PV) as "Somme de tous les PVs des personnages" FROM Heros

-- 7
SELECT Heros.Nom as Hero, CompetenceHeros.Nom as Competence FROM Heros
JOIN CompetenceHeros
ON CompetenceID = Heros.ID;

-- 8
SELECT Nom, `Type`, Effet FROM CompetenceHeros JOIN Competence
ON Competence.ID = CompetenceHeros.CompetenceID;
--9
SELECT Heros.Nom, CompetenceHeros.Nom FROM CompetenceHeros
JOIN Heros
ON CompetenceHeros.CompetenceID = Heros.ID;

-- 10
SELECT CompetenceHeros.Nom as 'Compétence', Heros.Nom as 'Héro' FROM CompetenceHeros
LEFT JOIN Heros
ON Heros.ID = CompetenceID;

-- 11
SELECT Heros.Nom as 'Héro', CompetenceHeros.Nom as 'Compétence' FROM CompetenceHeros
RIGHT JOIN Heros
ON Heros.ID = CompetenceID;

-- 12
SELECT DISTINCT Heros.Nom, Arme.Nom, CompetenceHeros.Nom FROM Heros
INNER JOIN Arme
INNER JOIN CompetenceHeros
ON CompetenceHeros.HerosID = Heros.ID
AND Heros.ID = Arme.HerosID;


-- 13

SELECT Heros.*, Arme.Nom, CompetenceHeros.Nom FROM Heros
JOIN CompetenceHeros
JOIN Arme
WHERE Arme.HerosID = Heros.ID
AND CompetenceHeros.HerosID = Heros.ID;

-- 14
INSERT INTO Arme VALUES(3, null, 'Bâton', 'Contondant', 5);

UPDATE Heros
SET Bonus = Bonus +2
WHERE PV = 40;

UPDATE Heros
SET ArmeEnMain = (SELECT ID FROM Arme WHERE ID = 3)
WHERE PV = 40;

-- 15
UPDATE Heros
SET ArmeEnMain = 0
WHERE Defense >= 5
AND ArmeEnMain = (SELECT ID FROM Arme WHERE ID = 3);

-- 16
UPDATE Heros
SET Heros.Immunite = 'Aucune'
WHERE Heros.Immunite LIKE 'A%';

-- 17
UPDATE Heros
SET Heros.ArmeEnMain = (SELECT ID FROM Arme WHERE ID = 3)
WHERE Heros.PV < 10
OR Heros.PV > 40;

-- 18
INSERT INTO CompetenceHeros VALUES(3, 0, 'Kung Fu');

UPDATE CompetenceHeros
JOIN Heros
SET CompetenceHeros.HerosID = Heros.ID
WHERE Heros.ArmeEnMain = (SELECT ID FROM Arme WHERE ID = 3)
AND CompetenceHeros.CompetenceID = 3;

-- 19




