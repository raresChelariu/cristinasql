--Pentru fiecare grupă afișați numele studenților care au obținut cea mai mică notă la nivelul grupei.

select s.nume,
       s.prenume,
       s.grupa,
       s.an
from studenti s
join note n on n.nr_matricol=s.nr_matricol
where (grupa,
       valoare,
       an) in
        (select s.grupa,
                min (n.valoare), an
         from studenti s
         join note n on n.nr_matricol=s.nr_matricol
         group by s.grupa,
                  an)