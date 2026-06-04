SELECT COUNT(bursa) AS "Total studenti"
FROM studenti;


select distinct bursa
from studenti;


SELECT MAX(valoare),
       nr_matricol,
       id_curs
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

select count (nr_matricol) as "Numar studenti",
             an,
             grupa
from studenti
GROUP BY an,
         grupa
order by an,
         grupa ASC;

--Afișați numărul de studenți din fiecare grupă a fiecărui an de studiu
--și specificați câți dintre aceștia sunt bursieri.

select count (nr_matricol) as "numar studenti",
             count(bursa) as "numar bursieri",
             an,
             grupa
from studenti
GROUP BY an,
         grupa
order by an,
         grupa;

--Afișați suma totală cheltuită de facultate pentru acordarea burselor.

select sum (bursa) as "Suma totala cheltuita de facultate pentru plata burselor"
from studenti;

--Afișați valoarea bursei/cap de student (se consideră că studentii care nu sunt bursieri primesc 0 RON);
--altfel spus: cât se cheltuiește în medie pentru un student?

select AVG (COALESCE(bursa, 0))
from studenti;

--Afișați numărul de note de fiecare fel (câte note de 10, câte de 9,etc.).
-- Ordonați descrescător după valoarea notei

select valoare,
       count (valoare)
from note
group by valoare
ORDER BY valoare DESC;

--Afișați numărul de note pus în fiecare zi a săptămânii. Ordonați descrescător după numărul de note.

select count (valoare) nrnote,
             to_char(data_notare, 'day')
from note
group by to_char(data_notare, 'day')
order by nrnote desc;

--Afișați numărul de note pus în fiecare zi a săptămânii. Ordonați crescător după ziua saptamanii: Sunday, Monday, etc.

select count (valoare) nr_note,
             to_char(data_notare, 'day')
from note
group by to_char(data_notare, 'day'),
         extract(dow
                 from data_notare)
order by extract(dow
                 from data_notare);


select extract(dow
               from date '2026-06-08');

--Afișați pentru fiecare elev care are măcar o notă, numele și media notelor sale. Ordonați descrescător după valoarea mediei.

select s.nume,
       s.prenume,
       avg(n.valoare) as "Valoarea mediei"
from studenti s
join note n on s.nr_matricol = n.nr_matricol
group by s.nr_matricol,
         s.nume,
         s.prenume
order by avg(n.valoare) desc;

--Modificați interogarea anterioară pentru a afișa și elevii fără nici o notă. Media acestora va fi null.

select s.nume,
       s.prenume,
       avg(n.valoare) as "Valoarea mediei"
from studenti s
left join note n on s.nr_matricol = n.nr_matricol
group by s.nr_matricol,
         s.nume,
         s.prenume
order by avg(n.valoare) desc;

select nume,
       avg (valoare) as "Valoarea mediei"
from studenti,
     note
where valoare = 0
group by nume ;

--12.Modificati interogarea de mai sus pentru a afisa doar studentii cu media mai mare ca 8.

select s.nume,
       s.prenume,
       avg(n.valoare) as "Valoarea mediei"
from studenti s
left join note n on s.nr_matricol = n.nr_matricol
group by s.nr_matricol,
         s.nume,
         s.prenume
having avg(n.valoare)>8
order by avg(n.valoare) desc;

-- 13. Afișați numele, cea mai mare notă, cea mai mică notă și media doar pentru acei studenti care au primit doar note mai mari sau egale cu 7 (au cea mai mică notă mai mare sau egală cu 7).


--Pentru fiecare grupă afișați numele studenților care au obținut cea mai mică notă la nivelul grupei.Pentru fiecare grupă afișați numele studenților care au obținut cea mai mică notă la nivelul grupei.