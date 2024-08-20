-- Tworzenie tabeli

CREATE TABLE Produkty (
    ProduktID INT PRIMARY KEY,
    Nazwa VARCHAR(100),
    Kategoria VARCHAR(50),
    Cena DECIMAL(10, 2),
    Ilosc INT,
    DataDodania DATE
);


-- Wstawianie przykładowych danych do tabeli

INSERT INTO Produkty (ProduktID, Nazwa, Kategoria, Cena, Ilosc, DataDodania) VALUES
(1, 'Laptop', 'Elektronika', 3500.00, 10, '2024-01-15'),
(2, 'Smartfon', 'Elektronika', 2500.00, 25, '2024-02-10'),
(3, 'Tablet', 'Elektronika', 1500.00, 15, '2024-03-05'),
(4, 'Telewizor', 'Elektronika', 4500.00, 8, '2024-04-12'),
(5, 'Pralka', 'AGD', 1800.00, 5, '2024-05-18'),
(6, 'Lodówka', 'AGD', 3200.00, 3, '2024-06-20'),
(7, 'Zmywarka', 'AGD', 2000.00, 4, '2024-07-22'),
(8, 'Konsola do gier', 'Elektronika', 2300.00, 12, '2024-08-15'),
(9, 'Ekspres do kawy', 'AGD', 1200.00, 7, '2024-09-05'),
(10, 'Odkurzacz', 'AGD', 900.00, 20, '2024-10-10');



-- Zapytania SQL do tej tabeli

SELECT * 
FROM Produkty 
WHERE Kategoria = 'Elektronika';

SELECT DISTINCT Kategoria 
FROM Produkty;

SELECT Kategoria, COUNT(*) AS LiczbaProduktow 
FROM Produkty 
GROUP BY Kategoria;

SELECT Nazwa, MIN(Cena) AS NajnizszaCena 
FROM Produkty;

SELECT Nazwa, MAX(Cena) AS NajwyzszaCena 
FROM Produkty;

SELECT SUM(Cena * Ilosc) AS WartoscMagazynu 
FROM Produkty;

SELECT AVG(Cena) AS SredniaCenaAGD 
FROM Produkty 
WHERE Kategoria = 'AGD';

SELECT Kategoria, AVG(Cena) AS SredniaCena 
FROM Produkty 
GROUP BY Kategoria 
HAVING AVG(Cena) > 2000;

SELECT * 
FROM Produkty 
ORDER BY Cena DESC;

SELECT * 
FROM Produkty 
ORDER BY Cena DESC 
LIMIT 3;


-- Tworzenie dodatkowej tabeli Dostawcy

CREATE TABLE Dostawcy (
    DostawcaID INT PRIMARY KEY,
    NazwaDostawcy VARCHAR(100),
    ProduktID INT
);


-- Wstawianie przykładowych danych do tabeli

INSERT INTO Dostawcy (DostawcaID, NazwaDostawcy, ProduktID) VALUES
(1, 'ABC Electronics', 1),
(2, 'XYZ Electronics', 2),
(3, 'Home Appliances Ltd', 5),
(4, 'Home Appliances Ltd', 6),
(5, 'Gaming World', 8);

-- Zapytania SQL

SELECT Produkty.Nazwa, Produkty.Kategoria, Dostawcy.NazwaDostawcy
FROM Produkty
INNER JOIN Dostawcy ON Produkty.ProduktID = Dostawcy.ProduktID;

SELECT Produkty.Nazwa, Produkty.Kategoria, Dostawcy.NazwaDostawcy
FROM Produkty
LEFT JOIN Dostawcy ON Produkty.ProduktID = Dostawcy.ProduktID;

SELECT Produkty.Nazwa, Produkty.Kategoria, Dostawcy.NazwaDostawcy
FROM Produkty
RIGHT JOIN Dostawcy ON Produkty.ProduktID = Dostawcy.ProduktID;

SELECT Produkty.Nazwa, Dostawcy.NazwaDostawcy
FROM Produkty
CROSS JOIN Dostawcy;

SELECT Produkty.Nazwa, Dostawcy.NazwaDostawcy
FROM Produkty
NATURAL JOIN Dostawcy;

SELECT Nazwa FROM Produkty
UNION
SELECT NazwaDostawcy FROM Dostawcy;

SELECT Nazwa FROM Produkty
UNION ALL
SELECT NazwaDostawcy FROM Dostawcy;

UPDATE Produkty
SET Cena = 3600.00
WHERE Nazwa = 'Laptop';

DROP TABLE Dostawcy;

TRUNCATE TABLE Produkty;

ALTER TABLE Produkty
ADD Opis VARCHAR(255);

ALTER TABLE Produkty
RENAME TO Towary;

DELETE FROM Produkty
WHERE Nazwa = 'Odkurzacz';

CREATE VIEW ElektronikaWidok AS
SELECT Nazwa, Cena FROM Produkty
WHERE Kategoria = 'Elektronika';

CREATE INDEX idx_kategoria ON Produkty(Kategoria);

SELECT * FROM Produkty
WHERE Nazwa LIKE 'L%';SELECT Nazwa, 
       CASE 
           WHEN Cena > 3000 THEN 'Drogi'
           WHEN Cena BETWEEN 1000 AND 3000 THEN 'Średnia cena'
           ELSE 'Tani'
       END AS KlasyfikacjaCeny
FROM Produkty;
