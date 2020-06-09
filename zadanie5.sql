create database firma;
comment on database firma is 'Baza danych - firma';

create schema ksiegowosc;
comment on schema ksiegowosc is 'Schemat - ksiegowosc';

create table ksiegowosc.pracownicy
(
id_pracownika INT not null primary key,
imie VARCHAR(15),
nazwisko VARCHAR(30),
adres VARCHAR(50),
telefon VARCHAR(9)
);
comment on table ksiegowosc.pracownicy is 'Tabela z pracownikami w schemacie ksiegowosc';

create table ksiegowosc.godziny
(
id_godziny INT not null primary key,
"data" DATE,
liczba_godzin INT,
id_pracownika INT not null
);
alter table ksiegowosc.godziny add foreign key (id_pracownika) references ksiegowosc.pracownicy(id_pracownika);
comment on table ksiegowosc.godziny is ' Tabela z godzinami w schemacie ksiegowosc';

create table ksiegowosc.pensja
(
id_pensji INT not null primary key,
stanowisko VARCHAR(20),
kwota INT
);
comment on table ksiegowosc.pensja is 'Tabela z pensjami w schemacie ksiegowosc';

create table ksiegowosc.premia
(
id_premii INT not null primary key,
rodzaj VARCHAR(20),
kwota INT
);
comment on table ksiegowosc.premia is 'Tabela z premiami w schemacie ksiegowosc';

create table ksiegowosc.wynagrodzenie
(
id_wynagrodzenie INT not null primary key,
"data" DATE,
id_pracownika INT not null,
id_godziny INT not null,
id_pensji INT not null,
id_premii INT
);
alter table ksiegowosc.wynagrodzenie add foreign key (id_pracownika) references ksiegowosc.pracownicy(id_pracownika);
alter table ksiegowosc.wynagrodzenie add foreign key (id_godziny) references ksiegowosc.godziny(id_godziny);
alter table ksiegowosc.wynagrodzenie add foreign key (id_pensji) references ksiegowosc.pensja(id_pensji);
alter table ksiegowosc.wynagrodzenie add foreign key (id_premii) references ksiegowosc.premia(id_premii);
comment on table ksiegowosc.wynagrodzenie is 'Tabela z wynagrodzeniami w schemacie ksiegowosc'

insert into ksiegowosc.pracownicy values(1,'Anna','Jarosz','Szczecin','891042091');
insert into ksiegowosc.pracownicy values(2,'Adam','Sikora','Warszawa','791143098');
insert into ksiegowosc.pracownicy values(3,'Robert','Zarêba','Wroc³aw','429871204');
insert into ksiegowosc.pracownicy values(4,'Katarzyna','Madej','Kraków','567876231');
insert into ksiegowosc.pracownicy values(5,'Jaros³aw','Groszkowski','Gdañsk','886992441');
insert into ksiegowosc.pracownicy values(6,'Mi³osz','Koszak','Poznañ','474902206');
insert into ksiegowosc.pracownicy values(7,'Jacek','Robak','Kraków','501912832');
insert into ksiegowosc.pracownicy values(8,'Krzysztof','Kononowicz','Bia³ystok','518888014');
insert into ksiegowosc.pracownicy values(9,'Wojciech','Suchodolski','Bia³ystok','721982335');
insert into ksiegowosc.pracownicy values(10,'Ewa','Lipka','Kielce','640022871');


insert into ksiegowosc.godziny values(1,'2020-05-04',8,1);
insert into ksiegowosc.godziny values(2,'2020-05-04',4,2);
insert into ksiegowosc.godziny values(3,'2020-05-04',1,3);
insert into ksiegowosc.godziny values(4,'2020-05-05',10,4);
insert into ksiegowosc.godziny values(5,'2020-05-05',6,5);
insert into ksiegowosc.godziny values(6,'2020-05-06',6,6);
insert into ksiegowosc.godziny values(7,'2020-05-07',2,7);
insert into ksiegowosc.godziny values(8,'2020-05-07',5,8);
insert into ksiegowosc.godziny values(9,'2020-05-08',7,9);
insert into ksiegowosc.godziny values(10,'2020-05-10',8,10);

insert into ksiegowosc.pensja values(1,'kierownik dzia³u',7500);
insert into ksiegowosc.pensja values(2,'programista',6000);
insert into ksiegowosc.pensja values(3,'grafik',5500);
insert into ksiegowosc.pensja values(4,'konsenwator',2500);
insert into ksiegowosc.pensja values(5,'wsparcie IT',4500);
insert into ksiegowosc.pensja values(6,'sekretarka',5500);
insert into ksiegowosc.pensja values(7,'grafik',5500);
insert into ksiegowosc.pensja values(8,'sprzedawca',4200);
insert into ksiegowosc.pensja values(9,'grafik',5500);
insert into ksiegowosc.pensja values(10,'prezes',12000);

insert into ksiegowosc.premia values(1,'zapomoga',500);
insert into ksiegowosc.premia values(2,'premia za wyniki',1000);
insert into ksiegowosc.premia values(3,'dodatek funkcyjny',300);
insert into ksiegowosc.premia values(4,'dodatek œwi¹teczny',500);
insert into ksiegowosc.premia values(5,'pracownik tygodnia',100);
insert into ksiegowosc.premia values(6,'pracownik miesi¹ca',450);
insert into ksiegowosc.premia values(7,'premia motywacyjna',200);
insert into ksiegowosc.premia values(8,'nadgodziny',50);
insert into ksiegowosc.premia values(9,'dodatek socjalny',250);
insert into ksiegowosc.premia values(10,'punktualnoœæ',50);

insert into ksiegowosc.wynagrodzenie values(1,'2020-05-25',1,1,9,2);
insert into ksiegowosc.wynagrodzenie values(2,'2020-05-25',2,2,10,8);
insert into ksiegowosc.wynagrodzenie values(3,'2020-05-25',3,3,2,9);
insert into ksiegowosc.wynagrodzenie values(4,'2020-05-25',4,4,1,4);
insert into ksiegowosc.wynagrodzenie values(5,'2020-05-25',5,5,4,7);
insert into ksiegowosc.wynagrodzenie values(6,'2020-05-25',6,6,5,6);
insert into ksiegowosc.wynagrodzenie values(7,'2020-05-25',7,7,6,5);
insert into ksiegowosc.wynagrodzenie values(8,'2020-05-25',8,8,7,1);
insert into ksiegowosc.wynagrodzenie values(9,'2020-05-25',9,9,2,1);
insert into ksiegowosc.wynagrodzenie values(10,'2020-05-25',10,10,5,10);


--zapytanie a
select id_pracownika, nazwisko from ksiegowosc.pracownicy;
--zapytanie b
select id_pracownika from ksiegowosc.wynagrodzenie, ksiegowosc.pensja where ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji and kwota> 1000;
--zapytanie c
select id_pracownika from ksiegowosc.wynagrodzenie, ksiegowosc.pensja where ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji and kwota> 2000 and ksiegowosc.wynagrodzenie.id_premii is null;
--zapytanie d
select * from ksiegowosc.pracownicy where imie like 'J%';
--zapytanie e
select * from ksiegowosc.pracownicy where nazwisko like '%n%' and imie like '%a';
--zapytanie f
select imie, nazwisko from ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.godziny where ksiegowosc.wynagrodzenie.id_godziny=ksiegowosc.godziny.id_godziny and ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika and (ksiegowosc.godziny.liczba_godzin*20)>160;
--zapytanie g
select imie, nazwisko from ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.pensja where ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji and ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika and kwota between 1500 and 3000;
--zapytanie h
select imie, nazwisko from ksiegowosc.pracownicy, ksiegowosc.wynagrodzenie, ksiegowosc.godziny where ksiegowosc.wynagrodzenie.id_godziny=ksiegowosc.godziny.id_godziny and ksiegowosc.wynagrodzenie.id_pracownika=ksiegowosc.pracownicy.id_pracownika and (ksiegowosc.godziny.liczba_godzin*20)>160 and ksiegowosc.wynagrodzenie.id_premii is null;
--zapytanie i
select pracownicy.* from ksiegowosc.pracownicy, ksiegowosc.pensja, ksiegowosc.wynagrodzenie where ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika and ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji order by kwota;
--zapytanie j
select pracownicy.*,pensja.kwota,premia.kwota from ksiegowosc.pracownicy, ksiegowosc.pensja, ksiegowosc.wynagrodzenie, ksiegowosc.premia where ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika and ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji and ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii order by pensja.kwota desc, premia.kwota desc;
--zapytanie k
select stanowisko, count(stanowisko) from ksiegowosc.pensja,ksiegowosc.wynagrodzenie,ksiegowosc.pracownicy where ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika and ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji group by stanowisko;
--zapytanie l
select avg(pensja.kwota+premia.kwota), min(pensja.kwota+premia.kwota), max(pensja.kwota+premia.kwota) from ksiegowosc.wynagrodzenie ,ksiegowosc.pensja , ksiegowosc.premia, ksiegowosc.pracownicy where ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji and ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii and ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika and pensja.stanowisko like 'programista';
--zapytanie m
select sum(pensja.kwota+premia.kwota) from ksiegowosc.pensja,ksiegowosc.premia,ksiegowosc.wynagrodzenie,ksiegowosc.pracownicy where ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji and ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii and ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika;
--zapytanie f
select stanowisko, sum(pensja.kwota+premia.kwota) from ksiegowosc.pensja,ksiegowosc.premia,ksiegowosc.wynagrodzenie,ksiegowosc.pracownicy where ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji and ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii and ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika group by stanowisko;
--zapytanie g
select stanowisko, count(premia.id_premii) from ksiegowosc.pensja,ksiegowosc.premia,ksiegowosc.wynagrodzenie,ksiegowosc.pracownicy where ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji and ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii and ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika group by stanowisko;
--zapytanie
delete from ksiegowosc.pracownicy where id_pracownika in (select pracownicy.id_pracownika from ksiegowosc.pracownicy,ksiegowosc.pensja,ksiegowosc.wynagrodzenie where ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika and ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji and pensja.kwota < 1200);