SELECT COUNT(bursa) AS "Total studenti"
FROM studenti;


select distinct bursa
from studenti;

SELECT MAX(valoare), nr_matricol, id_curs
FROM note
GROUP BY nr_matricol;

select *
from note
ORDER BY nr_matricol;

--Afișați numărul de studenți din fiecare an.
SELECT count(nr_matricol) as "Numar studenti din fiecare an"
from studenti
GROUP BY an;

--Afișați numărul de studenți din fiecare grupă a fiecărui an de studiu. 
--Ordonați crescător după anul de studiu și după grupă.
select count (nr_matricol) as "Numar studenti", an, grupa
from studenti
GROUP BY an, grupa
order by an, grupa ASC;


--Afișați numărul de studenți din fiecare grupă a fiecărui an de studiu 
--și specificați câți dintre aceștia sunt bursieri.
select count (nr_matricol) as "numar studenti", count(bursa) as "numar bursieri", an, grupa
from studenti
GROUP BY an, grupa
order by an, grupa;


--Afișați suma totală cheltuită de facultate pentru acordarea burselor.
select sum (bursa) as "Suma totala cheltuita de facultate pentru plata burselor"
from studenti;

--Afișați valoarea bursei/cap de student (se consideră că studentii care nu sunt bursieri primesc 0 RON); 
--altfel spus: cât se cheltuiește în medie pentru un student?
select AVG (COALESCE(bursa, 0))
from studenti;

--Afișați numărul de note de fiecare fel (câte note de 10, câte de 9,etc.).
-- Ordonați descrescător după valoarea notei
select valoare, count (valoare)
from note
group by valoare
ORDER BY valoare DESC;

--Afișați numărul de note pus în fiecare zi a săptămânii. Ordonați descrescător după numărul de note.
select count (valoare) nrnote, to_char(data_notare, 'day')
from note
group by to_char(data_notare, 'day')
order by nrnote desc;

--Afișați numărul de note pus în fiecare zi a săptămânii. Ordonați crescător după ziua saptamanii: Sunday, Monday, etc.

--Afișați pentru fiecare elev care are măcar o notă, numele și media notelor sale. Ordonați descrescător după valoarea mediei.