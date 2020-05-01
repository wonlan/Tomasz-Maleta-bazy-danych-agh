BEGIN TRANSACTION;

CREATE TABLE Pracownicy
(
    IDPracownika varchar(5) Primary Key,
    Imie varchar(15) NOT NULL,
    Nazwisko varchar(20) NOT NULL
);
CREATE TABLE Pacjenci
(
    IDPacjenta varchar(4) Primary Key,
    Imie varchar(15) NOT NULL,
    Nazwisko varchar(20) NOT NULL    
);
CREATE TABLE Wizyty
(
    IDWizyty int Primary Key,
    Data date NOT NULL,
    Godzina date NOT NULL,
    IDPacjenta varchar(4) NOT NULL,
    IDZabiegu varchar(4) NOT NULL,
    IDPracownika varchar(5) NOT NULL
);
CREATE TABLE Zabiegi
(
    IDZabiegu varchar(4) Primary Key,
    NazwaZabiegu varchar(30)
);

ALTER TABLE Wizyty ADD FOREIGN KEY (IDPracownika) REFERENCES Pracownicy (IDPracownika);
ALTER TABLE Wizyty ADD FOREIGN KEY (IDPacjenta) REFERENCES Pacjenci (IDPacjenta);
ALTER TABLE Wizyty ADD FOREIGN KEY (IDZabiegu) REFERENCES Zabiegi (IDZabiegu);