BEGIN TRANSACTION;

CREATE TABLE pracownicy
(id_pracownika integer primary key NOT NULL,
imie varchar[20] NOT NULL,
nazwisko varchar[30] NOT NULL,
adres varchar[50],
telefon varchar[15]);

CREATE TABLE godziny
(id_godziny integer primary key NOT NULL,
data date NOT NULL,
liczba_godzin integer NOT NULL,
id_pracownika integer NOT NULL);

CREATE TABLE pensje
(id_pensji integer primary key NOT NULL,
stanowisko varchar[15] NOT NULL,
kwota integer NOT NULL,
id_premii integer);

CREATE TABLE premie
(id_premii integer primary key NOT NULL,
rodzaj varchar[30],
kwota integer);

ALTER TABLE godziny
ADD FOREIGN KEY (id_pracownika) REFERENCES pracownicy(id_pracownika)

ALTER TABLE pensje
ADD FOREIGN KEY (id_premii) REFERENCES premie (id_premii)


INSERT INTO pracownicy VALUES(1,'Dominik','Kwiatkowski','Poznañ','656243076');
INSERT INTO pracownicy VALUES(2,'Krystian','Krol','Sopot','767123432');
INSERT INTO pracownicy VALUES(3,'Agata','Salwa','Kolobrzeg','222333444');
INSERT INTO pracownicy VALUES(4,'Andrzej','WoŸnicki','Opole','742932101');
INSERT INTO pracownicy VALUES(5,'Marta','Wójcik','£ódŸ','889941420');
INSERT INTO pracownicy VALUES(6,'Kacper','Malinowski','Warszawa','660700112');
INSERT INTO pracownicy VALUES(7,'Mi³osz','Mordka','Wa³brzych','132176007');
INSERT INTO pracownicy VALUES(8,'Ma³gorzata','Adamczyk','Kraków','460692183');
INSERT INTO pracownicy VALUES(9,'Adam','Michalczyk','Bydgoszcz','984721208');
INSERT INTO pracownicy VALUES(10,'Dominik','Kwiatkowski','Radom','656243076');

INSERT INTO godziny VALUES(1,'07-01-2020',3,2);
INSERT INTO godziny VALUES(2,'07-01-2020',5,4);
INSERT INTO godziny VALUES(3,'08-01-2020',1,1);
INSERT INTO godziny VALUES(4,'09-01-2020',8,10);
INSERT INTO godziny VALUES(5,'09-01-2020',6,8);
INSERT INTO godziny VALUES(6,'09-01-2020',6,7);
INSERT INTO godziny VALUES(7,'09-01-2020',7,6);
INSERT INTO godziny VALUES(8,'10-01-2020',4,3);
INSERT INTO godziny VALUES(9,'13-01-2020',5,3);
INSERT INTO godziny VALUES(10,'13-01-2020',2,5);

INSERT INTO pensje VALUES(1,'CEO',25000,1);
INSERT INTO pensje VALUES(2,'Junior dev',4500,10);
INSERT INTO pensje VALUES(3,'Senior dev',6000,4);
INSERT INTO pensje VALUES(4,'Ksiêgowa',4250,3);
INSERT INTO pensje VALUES(5,'Sprzedawca',5200,5);
INSERT INTO pensje VALUES(6,'Grafik',4500,2);
INSERT INTO pensje VALUES(7,'Sprz¹taczka',3000,7);
INSERT INTO pensje VALUES(8,'Spec. ds. promocji',5500,9);
INSERT INTO pensje VALUES(9,'Senior dev',6000,6);
INSERT INTO pensje VALUES(10,'Sta¿ysta',2500,8);

INSERT INTO premie VALUES(1,'pracownik miesiaca',1500);
INSERT INTO premie VALUES(2,'odszkodowanie',4000);
INSERT INTO premie VALUES(3,'premia motywacyjna',200);
INSERT INTO premie VALUES(4,'premia za wyniki',400);
INSERT INTO premie VALUES(5,'premia za wyniki',400);
INSERT INTO premie VALUES(6,'nadgodziny',500);
INSERT INTO premie VALUES(7,'odszkodowanie',750);
INSERT INTO premie VALUES(8,'zwrot za paliwo',200);
INSERT INTO premie VALUES(9,'nadgodziny',50);
INSERT INTO premie VALUES(10,'zapomoga',500);

SELECT * FROM pensje;
SELECT * FROM godziny;
SELECT * FROM premie;
SELECT * FROM pracownicy;