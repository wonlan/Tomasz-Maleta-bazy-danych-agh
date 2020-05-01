BEGIN TRANSACTION;

CREATE TABLE Dostawcy
(
    IDDostawcy varchar(2) Primary Key,
    NazwaDostawcy varchar(20) NOT NULL,
    KodPocztowy varchar(6) NOT NULL,
    Ulica varchar(20) NOT NULL,
    NumerBudynku int NOT NULL,
    NumerMieszkania int
);
CREATE TABLE Produkty
(
    IDProduktu varchar(2) Primary Key,
    NazwaProduktu varchar(20) NOT NULL,
    CenaNetto int NOT NULL,
    CenaBrutto int NOT NULL
);
CREATE TABLE TabelaGlowna
(
    IDDostawy varchar(2) Primary Key,
    IDDostawcy varchar(2) NOT NULL,
    IDProduktu varchar(2) NOT NULL
);
CREATE TABLE Kody
(
    KodPocztowy varchar(6) Primary Key,
    Miasto varchar(15) NOT NULL
);

ALTER TABLE TabelaGlowna ADD FOREIGN KEY (IDDostawcy) REFERENCES Dostawcy(IDDostawcy);
ALTER TABLE TabelaGlowna ADD FOREIGN KEY (IDProduktu) REFERENCES Produkty(IDProduktu);
ALTER TABLE Dostawcy ADD FOREIGN KEY (KodPocztowy) REFERENCES Kody(KodPocztowy);