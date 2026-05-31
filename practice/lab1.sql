-- 1 
select nume n, prenume p, an a, data_nastere d_n
from studenti;

-- 2
SELECT DISTINCT COALESCE (bursa, 0) valoare
 FROM studenti;


-- 4
SELECT 
'Studentul '||nume||' '||prenume||
' este inmatriculat in anul '|| an ||'.' AS info 
FROM studenti;


SELECT
nume||' '||prenume|| ',' ||an "Studenti pe an de studiu"
FROM studenti
ORDER BY an;


--5
SELECT nume, prenume, data_nastere, an
from studenti
WHERE data_nastere >= '1995-01-01' AND data_nastere <= '1997-06-10' 
ORDER BY an DESC;

--6
SELECT nume n, prenume p, an a_s
FROM studenti
WHERE data_nastere >= '1995-01-01' AND data_nastere <= '1995-12-31';

SELECT nume n, prenume p, an a_s
FROM studenti
WHERE EXTRACT(year from data_nastere) = '1995';

-- 7
SELECT nr_matricol, nume, prenume, an, grupa, data_nastere, bursa
FROM studenti
WHERE bursa IS NULL;

--8
SELECT nume, prenume, an, bursa
FROM studenti 
WHERE bursa IS NOT NULL AND an >=2 AND an<=3
ORDER BY nume ASC, prenume DESC;

SELECT nume, prenume, an, bursa
FROM studenti 
WHERE bursa IS NOT NULL AND an IN(2,3)
ORDER BY nume ASC, prenume DESC;


--9
SELECT nume, prenume, bursa * 1.15
FROM studenti 
WHERE bursa IS NOT NULL;

--10
SELECT nume, prenume, an
FROM studenti
WHERE an = 1 AND (nume LIKE 'P%' OR nume like 'C%') ;


--12
SELECT nr_matricol, nume, prenume, an, grupa, data_nastere, bursa
FROM studenti
WHERE prenume IN ('Alexandru', 'Ioana', 'Marius');

--13
SELECT nume, prenume, an, grupa, bursa
FROM studenti 
WHERE grupa LIKE 'A%' AND bursa IS NOT NULL;

--14
SELECT nume, prenume, an, grupa, bursa
FROM studenti
WHERE prenume LIKE '%a%'
AND prenume NOT LIKE '%a%a%';

-- vreau sa testez si aparitiile lui A si a
-- deci iau prenumele dar cu litere mici
-- AnDReaa => andreea

-- SELECT nume, prenume, an, grupa, bursa
-- FROM studenti
-- WHERE lower(prenume) LIKE '%a%'
-- AND lower(prenume)  LIKE '%a%a%';


--15
SELECT nume, prenume
FROM profesori
WHERE trim(nume) LIKE '%n';