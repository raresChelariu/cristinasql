-- ============================================================
-- facultate.sql — adaptat pentru PostgreSQL
-- Modificări față de versiunea Oracle:
--   1. DROP TABLE ... CASCADE (elimină dependențele automat)
--   2. VARCHAR2 → VARCHAR
--   3. NUMBER(p,s) → NUMERIC(p,s) / INTEGER
--   4. TO_DATE păstrat (PostgreSQL îl suportă)
--   5. Eliminat separatorul "/" specific Oracle SQL*Plus
--   6. Duplicate la profesori (p20, p21) — păstrate cu comentariu
-- ============================================================

DROP TABLE IF EXISTS note      CASCADE;
DROP TABLE IF EXISTS didactic  CASCADE;
DROP TABLE IF EXISTS studenti  CASCADE;
DROP TABLE IF EXISTS cursuri   CASCADE;
DROP TABLE IF EXISTS profesori CASCADE;

-- ============================================================
-- CREARE TABELE
-- ============================================================

CREATE TABLE studenti (
    nr_matricol CHAR(6)        NOT NULL,
    nume        VARCHAR(10),
    prenume     VARCHAR(10),
    an          INTEGER,
    grupa       CHAR(2),
    bursa       NUMERIC(6, 2),
    data_nastere DATE
);

CREATE TABLE cursuri (
    id_curs     CHAR(4)        NOT NULL,
    titlu_curs  VARCHAR(15),
    an          INTEGER,
    semestru    INTEGER,
    credite     INTEGER
);

CREATE TABLE note (
    nr_matricol CHAR(6),
    id_curs     CHAR(4),
    valoare     INTEGER,
    data_notare DATE
);

CREATE TABLE profesori (
    id_prof      CHAR(4),
    nume         CHAR(10),
    prenume      CHAR(10),
    grad_didactic VARCHAR(5)
);

CREATE TABLE didactic (
    id_prof CHAR(4),
    id_curs CHAR(4)
);

-- ============================================================
-- DATE: STUDENTI
-- ============================================================

-- Anul 3
INSERT INTO studenti VALUES ('111', 'Popescu',    'Bogdan',    3, 'A2', NULL, TO_DATE('17/02/1995', 'DD/MM/YYYY'));
INSERT INTO studenti VALUES ('112', 'Prelipcean', 'Radu',      3, 'A2', NULL, TO_DATE('26/05/1995', 'DD/MM/YYYY'));
INSERT INTO studenti VALUES ('113', 'Antonie',    'Ioana',     3, 'A2', 450,  TO_DATE('03/01/1995', 'DD/MM/YYYY'));
INSERT INTO studenti VALUES ('114', 'Arhire',     'Raluca',    3, 'A4', NULL, TO_DATE('26/12/1995', 'DD/MM/YYYY'));
INSERT INTO studenti VALUES ('115', 'Panaite',    'Alexandru', 3, 'B3', NULL, TO_DATE('13/04/1995', 'DD/MM/YYYY'));

-- Anul 2
INSERT INTO studenti VALUES ('116', 'Bodnar',      'Ioana',   2, 'A1', NULL, TO_DATE('26/08/1996', 'DD/MM/YYYY'));
INSERT INTO studenti VALUES ('117', 'Archip',      'Andrada', 2, 'A1', 350,  TO_DATE('03/04/1996', 'DD/MM/YYYY'));
INSERT INTO studenti VALUES ('118', 'Ciobotariu',  'Ciprian', 2, 'A1', 350,  TO_DATE('03/04/1996', 'DD/MM/YYYY'));
INSERT INTO studenti VALUES ('119', 'Bodnar',      'Ioana',   2, 'B2', NULL, TO_DATE('10/06/1996', 'DD/MM/YYYY'));

-- Anul 1
INSERT INTO studenti VALUES ('120', 'Pintescu', 'Andrei',    1, 'B1', 250,  TO_DATE('26/08/1997', 'DD/MM/YYYY'));
INSERT INTO studenti VALUES ('121', 'Arhire',   'Alexandra', 1, 'B1', NULL, TO_DATE('02/07/1997', 'DD/MM/YYYY'));
INSERT INTO studenti VALUES ('122', 'Cobzaru',  'George',    1, 'B1', 350,  TO_DATE('29/04/1997', 'DD/MM/YYYY'));
INSERT INTO studenti VALUES ('123', 'Bucur',    'Andreea',   1, 'B2', NULL, TO_DATE('10/05/1997', 'DD/MM/YYYY'));

-- ============================================================
-- DATE: CURSURI
-- ============================================================

INSERT INTO cursuri VALUES ('21', 'Logica',          1, 1, 5);
INSERT INTO cursuri VALUES ('22', 'Matematica',      1, 1, 4);
INSERT INTO cursuri VALUES ('23', 'OOP',             1, 2, 5);
INSERT INTO cursuri VALUES ('24', 'BD',              2, 1, 8);
INSERT INTO cursuri VALUES ('25', 'Java',            2, 2, 5);
INSERT INTO cursuri VALUES ('26', 'Tehnologii Web',  2, 2, 5);
INSERT INTO cursuri VALUES ('27', 'Sec. Info.',      3, 1, 5);
INSERT INTO cursuri VALUES ('28', 'DSFUM',           3, 1, 6);
INSERT INTO cursuri VALUES ('29', 'Limbaje formale', 2, 1, 5);

-- ============================================================
-- DATE: PROFESORI
-- ============================================================

INSERT INTO profesori VALUES ('p1',  'Masalagiu', 'Cristian', 'Prof');
INSERT INTO profesori VALUES ('p2',  'Buraga',    'Sabin',    'Conf');
INSERT INTO profesori VALUES ('p3',  'Lucanu',    'Dorel',    'Prof');
INSERT INTO profesori VALUES ('p4',  'Tiplea',    'Laurentiu','Prof');
INSERT INTO profesori VALUES ('p5',  'Iacob',     'Florin',   'Lect');
INSERT INTO profesori VALUES ('p6',  'Breaban',   'Mihaela',  'Conf');
INSERT INTO profesori VALUES ('p7',  'Varlan',    'Cosmin',   'Lect');
INSERT INTO profesori VALUES ('p8',  'Frasinaru', 'Cristian', 'Prof');
INSERT INTO profesori VALUES ('p9',  'Ciobaca',   'Stefan',   'Conf');
INSERT INTO profesori VALUES ('p10', 'Captarencu','Oana',     'Lect');
INSERT INTO profesori VALUES ('p11', 'Moruz',     'Alexandru','Lect');

-- ATENȚIE: în scriptul original, p20 și p21 apar de două ori cu valori diferite.
-- Prima apariție (la sfârșitul fișierului original):
INSERT INTO profesori VALUES ('p20', 'PASCARIU', 'GEORGIANA', NULL);
INSERT INTO profesori VALUES ('p21', 'LAZAR',    'LUCIAN',    NULL);
INSERT INTO profesori VALUES ('p22', 'Kristo',   'ROBERT',    NULL);
-- A doua apariție (duplicate pe același id_prof — probabil greșeală în original):
-- INSERT INTO profesori VALUES ('p20', 'Nastasa', 'Laura',   NULL);  -- duplicat p20
-- INSERT INTO profesori VALUES ('p21', 'PASAT',   'Tiberiu', NULL);  -- duplicat p21

-- ============================================================
-- DATE: DIDACTIC
-- ============================================================

INSERT INTO didactic VALUES ('p1', '21');
INSERT INTO didactic VALUES ('p9', '21');
INSERT INTO didactic VALUES ('p5', '22');
INSERT INTO didactic VALUES ('p3', '23');
INSERT INTO didactic VALUES ('p6', '24');
INSERT INTO didactic VALUES ('p7', '24');
INSERT INTO didactic VALUES ('p8', '25');
INSERT INTO didactic VALUES ('p2', '26');
INSERT INTO didactic VALUES ('p4', '27');
INSERT INTO didactic VALUES ('p7', '28');

-- ============================================================
-- DATE: NOTE
-- ============================================================

-- Studentii din anul 3 (au toate examenele date)
INSERT INTO note VALUES ('111', '21',  8, TO_DATE('17/02/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('111', '22',  9, TO_DATE('19/02/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('111', '23', 10, TO_DATE('24/06/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('111', '24',  9, TO_DATE('17/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('111', '25',  7, TO_DATE('20/06/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('111', '26',  8, TO_DATE('21/06/2015', 'DD/MM/YYYY'));

INSERT INTO note VALUES ('112', '21',  7, TO_DATE('25/02/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('112', '22',  6, TO_DATE('19/02/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('112', '23',  5, TO_DATE('24/06/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('112', '24',  6, TO_DATE('17/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('112', '25',  7, TO_DATE('20/06/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('112', '26',  4, TO_DATE('21/06/2015', 'DD/MM/YYYY'));

INSERT INTO note VALUES ('113', '21',  9, TO_DATE('17/02/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('113', '22',  9, TO_DATE('19/02/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('113', '23',  7, TO_DATE('24/06/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('113', '24', 10, TO_DATE('17/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('113', '25',  4, TO_DATE('20/06/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('113', '26',  7, TO_DATE('21/06/2015', 'DD/MM/YYYY'));

INSERT INTO note VALUES ('114', '21',  6, TO_DATE('17/02/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('114', '22',  9, TO_DATE('19/02/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('114', '23', 10, TO_DATE('24/06/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('114', '24',  4, TO_DATE('17/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('114', '25',  5, TO_DATE('20/06/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('114', '26',  4, TO_DATE('21/06/2015', 'DD/MM/YYYY'));

INSERT INTO note VALUES ('115', '21', 10, TO_DATE('17/02/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('115', '22',  7, TO_DATE('19/02/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('115', '23', 10, TO_DATE('24/06/2014', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('115', '24', 10, TO_DATE('17/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('115', '25',  8, TO_DATE('20/06/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('115', '26',  9, TO_DATE('21/06/2015', 'DD/MM/YYYY'));

-- Studentii din anul 2 (au examenele din anul 1)
INSERT INTO note VALUES ('116', '21', 10, TO_DATE('18/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('116', '22', 10, TO_DATE('20/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('116', '23',  9, TO_DATE('21/06/2015', 'DD/MM/YYYY'));

INSERT INTO note VALUES ('117', '21',  7, TO_DATE('18/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('117', '22',  6, TO_DATE('20/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('117', '23',  4, TO_DATE('25/06/2015', 'DD/MM/YYYY'));

INSERT INTO note VALUES ('118', '21',  7, TO_DATE('22/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('118', '22',  7, TO_DATE('24/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('118', '23',  7, TO_DATE('21/06/2015', 'DD/MM/YYYY'));

INSERT INTO note VALUES ('119', '21',  7, TO_DATE('18/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('119', '22',  8, TO_DATE('20/02/2015', 'DD/MM/YYYY'));
INSERT INTO note VALUES ('119', '23',  9, TO_DATE('21/06/2015', 'DD/MM/YYYY'));

-- Studentii din anul 1 — nu au note (conform comentariului original)

COMMIT;