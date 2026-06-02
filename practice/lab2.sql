SELECT s.nume||' '||s.prenume||' este coleg cu '||colegi.nume||' '||colegi.prenume AS "Colegi de grupa", s.an, colegi.an
FROM studenti s
JOIN studenti colegi ON 
--s.grupa=colegi.grupa
--AND 
s.an=colegi.an
WHERE s.prenume='Andrei';


--Afişaţi studenţii şi notele pe care le-au luat si profesorii care le-au pus acele note.
select s.nume, s.prenume, n.valoare, p.nume, p.prenume
from studenti s 
join note n on s.nr_matricol = n.nr_matricol
join cursuri c on c.id_curs = n.id_curs
join didactic d on d.id_curs = c.id_curs
join profesori p on p.id_prof = d.id_prof;

-- Afişaţi studenţii care au luat nota 10 la materia 'BD'. 
-- Singurele valori pe care aveţi voie să le hardcodaţi în interogare
-- sunt valoarea notei (10) şi numele cursului ('BD').
select s.nume, s.prenume, n.valoare, c.titlu_curs
from studenti s
JOIN note n on n.nr_matricol = s.nr_matricol
join cursuri c on c.id_curs = n.id_curs
where n.valoare = '10' and c.titlu_curs = 'BD';

--Afisaţi profesorii (numele şi prenumele) impreuna cu cursurile pe care fiecare le ţine.
SELECT p.nume, p.prenume, c.titlu_curs
FROM profesori p
JOIN didactic d on d.id_prof = p.id_prof
join cursuri c  on c.id_curs = d.id_curs;

--Modificaţi interogarea de la punctul 3 pentru a fi afişaţi şi acei profesori care nu au încă alocat un curs.
SELECT p.nume, p.prenume, c.titlu_curs
FROM profesori p
left JOIN didactic d on d.id_prof = p.id_prof
left join cursuri c  on c.id_curs = d.id_curs;

--Modificaţi interogarea de la punctul 3 pentru a fi afişate acele cursuri ce nu au alocate încă un profesor.
SELECT p.nume, p.prenume, c.titlu_curs
FROM profesori p
right JOIN didactic d on d.id_prof = p.id_prof
right join cursuri c  on c.id_curs = d.id_curs;

--Modificaţi interogarea de la punctul 3 astfel încât 
--să fie afişaţi atat profesorii care nu au nici un curs alocat cât şi cursurile care nu sunt încă predate de nici un profesor.
SELECT p.nume, p.prenume, c.titlu_curs
FROM profesori p
full outer JOIN didactic d on d.id_prof = p.id_prof
full outer join cursuri c  on c.id_curs = d.id_curs;

- 
select to_char(date '2026-06-10', 'Day') as ziDeAzi

-- Să se afișeze, pentru fiecare student, numele colegilor care au luat notă mai mare ca ei la fiecare dintre cursuri. Formulați rezultatele ca propoziții (de forma "Popescu Gigel a luat notă mai mare ca Vasilescu Ionel la materia BD."). Dați un nume corespunzător coloanei [pont: interogarea trebuie să returneze 118 rânduri].
-- colegi.nume || ' ' || colegi.prenume
-- s.nume || ' ' || s.prenume
SELECT colegi.nume || ' ' || colegi.prenume || ' a luat notă mai mare ca '|| s.nume || ' ' || s.prenume || ' la materia ' || c.titlu_curs,
 n_c.valoare notaColeg, n_s.valoare notaStud,  c.titlu_curs
FROM studenti s 
JOIN studenti colegi on s.nr_matricol <> colegi.nr_matricol
join note n_c on n_c.nr_matricol = colegi.nr_matricol
join note n_s on n_s.nr_matricol = s.nr_matricol and n_s.id_curs = n_c.id_curs
join cursuri c on c.id_curs = n_s.id_curs
where n_s.valoare < n_c.valoare;

--- 
























