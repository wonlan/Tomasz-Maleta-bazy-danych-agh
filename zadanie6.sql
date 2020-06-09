--zadanie a
alter table ksiegowosc.pracownicy alter column telefon type varchar(16) using telefon::varchar;
update ksiegowosc.pracownicy set telefon ='(+48)' || pracownicy.telefon;
--zadanie b
update ksiegowosc.pracownicy set telefon=substring(telefon,0,9) || '-' || substring(telefon,9,3) || '-' || substring(telefon,12,3);
--zadanie c
select * from ksiegowosc.pracownicy order by char_length(nazwisko) desc limit 1;
--zadanie d
select pracownicy.*, md5(ksiegowosc.pensja.kwota::text) as kwota from ksiegowosc.pracownicy,ksiegowosc.wynagrodzenie,ksiegowosc.pensja where ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika and ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji;
--zadanie f
select pracownicy.*, pensja.kwota, premia.kwota as premia from ksiegowosc.pracownicy 
left join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
left join ksiegowosc.pensja on ksiegowosc.pensja.id_pensji = ksiegowosc.wynagrodzenie.id_pensji
left join ksiegowosc.premia on ksiegowosc.premia.id_premii = ksiegowosc.wynagrodzenie.id_premii;
--zadanie g
select 'Pracownik ' || pracownicy.imie ||' '|| pracownicy.nazwisko ||',w dniu '|| wynagrodzenie."data" || ' otrzyma³ pensjê ca³kowit¹ na kwotê ' ||
pensja.kwota+premia.kwota || 'z³, gdzie wynagrodzenie zasadnicze wynosi³o: '|| pensja.kwota ||'z³, premia: '|| premia.kwota ||'z³, nadgodziny : 0 z³' as Raport
from ksiegowosc.pracownicy
join ksiegowosc.wynagrodzenie on ksiegowosc.wynagrodzenie.id_pracownika = ksiegowosc.pracownicy.id_pracownika
join ksiegowosc.pensja on ksiegowosc.wynagrodzenie.id_pensji = ksiegowosc.pensja.id_pensji
join ksiegowosc.premia on ksiegowosc.wynagrodzenie.id_premii = ksiegowosc.premia.id_premii
where imie = 'Adam' and nazwisko = 'Sikora';
