

DROP DATABASE simplejdbc;

CREATE DATABASE simplejdbc;

\c simplejdbc

CREATE TABLE "skola"
(
  "id" serial PRIMARY KEY,
  "namn" varchar(100) NOT NULL,
  "antal_instruktörer" int NOT NULL,
  "antal_studenter" int NOT NULL,
  "minimi_ålder_för_studenter" int NOT NULL

);

CREATE TABLE "ansökan"
(
  "id" serial PRIMARY KEY,
  "namn" varchar(50) NOT NULL,
  "epost" varchar(100) NOT NULL,
  "telefonumer" varchar(15) NOT NULL,
  "instrument_eller_ensemble" varchar(50) NOT NULL,
  "nivå" varchar(10) NOT NULL,
  "behål_ansökan_för_senare_antagning" bit(1) NOT NULL,
  "antagen" bit(1),
  "skola_id" int NOT NULL REFERENCES "skola"
);

CREATE TABLE "adition"
(
  "ansökan_id" int PRIMARY KEY REFERENCES "ansökan" ON DELETE CASCADE,
  "tid" TIMESTAMP(6) NOT NULL,
  "plats" varchar(50) NOT NULL,
  "godkänd" bit(1)
);

CREATE TABLE "svar_på_antagan"
(
  "ansökan_id" int PRIMARY KEY REFERENCES "ansökan" ON DELETE CASCADE,
  "svar_ja" bit(1)
);

CREATE TABLE "lediga_plats"
(
  "id" serial PRIMARY KEY,
  "instrument_eller_ensemble" varchar(50) NOT NULL,
  "nivå" varchar(10) NOT NULL,
  "antal_lediga_platser" int NOT NULL,
  "skola_id" int NOT NULL REFERENCES "skola"
);

CREATE TABLE "instruktör"
(
  "id" serial PRIMARY KEY,
  "namn" varchar(50) NOT NULL,
  "ålder" int NOT NULL,
  "personumer" char(12) UNIQUE NOT NULL,
  "telefonumer" varchar(15) NOT NULL,
  "epost" varchar(100) NOT NULL,
  "betalningsinfo" varchar(20) NOT NULL,
  "gatu_adress" varchar(100) NOT NULL,
  "postnumer" varchar(5) NOT NULL,
  "postort" varchar(50) NOT NULL,
  "stad" varchar(50) NOT NULL,
  "skola_id" int NOT NULL REFERENCES "skola"
);

CREATE TABLE "instrument_instruktör"
(
  "instruktör_id" int NOT NULL REFERENCES "instruktör" ON DELETE CASCADE,
  "instrument_emsembler" varchar(50) NOT NULL,
  PRIMARY KEY("instruktör_id", "instrument_emsembler")
);

CREATE TABLE "ledigt_schema"
(
  "instruktör_id" int NOT NULL REFERENCES "instruktör" ON DELETE CASCADE,
  "start_tid" TIMESTAMP(6) NOT NULL,
  "slut_tid" TIMESTAMP(6) NOT NULL,
  PRIMARY KEY("instruktör_id", "start_tid")
);

CREATE TABLE "syskon_rabat"
(
  "id" serial PRIMARY KEY,
  "prosentuel_rabat" float(10) NOT NULL
);

CREATE TABLE "student"
(
  "id" serial PRIMARY KEY,
  "namn" varchar(50) NOT NULL,
  "ålder" int NOT NULL,
  "personumer" char(12) UNIQUE NOT NULL,
  "telefonumer" varchar(15) NOT NULL,
  "epost" varchar(100) NOT NULL,
  "förälders_telefonumer" varchar(15) NOT NULL,
  "förälders_epost" varchar(100) NOT NULL,
  "betalningsinfo" varchar(20) NOT NULL,
  "antal_hyrda_instrument" int NOT NULL,
  "gatu_adress" varchar(100) NOT NULL,
  "postnumer" varchar(5) NOT NULL,
  "postort" varchar(50) NOT NULL,
  "stad" varchar(50) NOT NULL,
  "skola_id" int NOT NULL REFERENCES "skola",
  "syskon_rabat_id" int REFERENCES "syskon_rabat"
);

CREATE TABLE "syskon"
(
  "student1_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "student2_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  PRIMARY KEY("student1_id", "student2_id")
);

CREATE TABLE "extra_kostnad"
(
  "id" serial PRIMARY KEY,
  "extra_kostnad" float(10) NOT NULL
);

CREATE TABLE "ensembler"
(
  "id" serial PRIMARY KEY,
  "antal_platser" int NOT NULL,
  "minsta_antal_deltagare" int NOT NULL,
  "antal_deltagare" int NOT NULL,
  "genre" varchar(50) NOT NULL,
  "nivå" varchar(10) NOT NULL,
  "tid" TIMESTAMP(6) NOT NULL,
  "sal" varchar(50) NOT NULL,
  "pris" float(10) NOT NULL,
  "instruktör_id" int NOT NULL REFERENCES "instruktör",
  "extra_kostnad_id" int REFERENCES "extra_kostnad"
);

CREATE TABLE "grupplektion"
(
  "id" serial PRIMARY KEY,
  "antal_platser" int NOT NULL,
  "minsta_antal_deltagare" int NOT NULL,
  "antal_deltagare" int NOT NULL,
  "instrument" varchar(50) NOT NULL,
  "nivå" varchar(10) NOT NULL,
  "tid" TIMESTAMP(6) NOT NULL,
  "sal" varchar(50) NOT NULL,
  "pris" float(10) NOT NULL,
  "instruktör_id" int NOT NULL REFERENCES "instruktör",
  "extra_kostnad_id" int REFERENCES "extra_kostnad"
);

CREATE TABLE "inviduellektion"
(
  "id" serial PRIMARY KEY,
  "instrument" varchar(50) NOT NULL,
  "nivå" varchar(10) NOT NULL,
  "tid" TIMESTAMP(6) NOT NULL,
  "sal" varchar(50) NOT NULL,
  "pris" float(10) NOT NULL,
  "instruktör_id" int NOT NULL REFERENCES "instruktör",
  "extra_kostnad_id" int REFERENCES "extra_kostnad",
  "student_id" int NOT NULL REFERENCES "student"
);


CREATE TABLE "student_ensembler"
(
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "ensembler_id" int NOT NULL REFERENCES "ensembler" ON DELETE CASCADE,
  PRIMARY KEY("student_id", "ensembler_id")
);

CREATE TABLE "student_grupplektion"
(
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "grupplektion_id" int NOT NULL REFERENCES "grupplektion" ON DELETE CASCADE,
  PRIMARY KEY("student_id", "grupplektion_id")
);

CREATE TABLE "instrument_student"
(
  "student_id" int NOT NULL REFERENCES "student" ON DELETE CASCADE,
  "instrument_emsembler" varchar(50) NOT NULL,
  "nivå" varchar(10) NOT NULL,
  PRIMARY KEY("student_id", "instrument_emsembler")
);

CREATE TABLE "hyr_instrument"
(
  "id" serial PRIMARY KEY,
  "instrument" varchar(50) NOT NULL,
  "katigori" varchar(50),
  "märke" varchar(50),
  "antal_på_lager" int NOT NULL,
  "pris_per_månad" float(10) NOT NULL
);

CREATE TABLE "hyrda_instrument"
(
  "id" serial PRIMARY KEY,
  "start_månad" date NOT NULL,
  "slut_månad" date NOT NULL,
  "student_id" int NOT NULL REFERENCES "student",
  "hyr_instrument_id" int NOT NULL REFERENCES "hyr_instrument"
);


CREATE VIEW totalt_antal_uthyrda_instrument_per_månad AS
SELECT 'januari' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-01-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-01-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'feburari' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-02-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-02-29' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'mars' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-03-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-03-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'april' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-04-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-04-30' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'maj' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-05-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-05-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'juni' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-06-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-06-30' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'juli' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-07-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-07-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'agusti' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-08-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-08-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'september' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-09-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-09-30' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'oktober' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-10-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-10-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'november' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-11-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-11-30' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
UNION ALL
SELECT 'desember' AS månad, 'total' AS instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-12-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-12-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad;


CREATE VIEW antal_uthyrda_instrument_per_månad_per_instrument AS
SELECT 'januari' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-01-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-01-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'feburari' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-02-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-02-29' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'mars' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-03-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-03-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'april' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-04-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-04-30' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'maj' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-05-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-05-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'juni' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-06-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-06-30' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'juli' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-07-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-07-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'agusti' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-08-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-08-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'september' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-09-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-09-30' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'oktober' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-10-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-10-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'november' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-11-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-11-30' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument
UNION ALL
SELECT 'desember' AS månad, hyr_instrument.instrument, count(hyrda_instrument.id) as antal_instrument
FROM (hyr_instrument INNER JOIN hyrda_instrument ON hyr_instrument.id = hyrda_instrument.hyr_instrument_id)
WHERE '2020-12-01' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad OR '2020-12-31' BETWEEN hyrda_instrument.start_månad AND hyrda_instrument.slut_månad
GROUP BY hyr_instrument.instrument;
