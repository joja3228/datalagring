-- \c projekt

\c simplejdbc

-- 1
SELECT *
FROM totalt_antal_uthyrda_instrument_per_månad
UNION ALL
SELECT *
FROM( SELECT *
  FROM antal_uthyrda_instrument_per_månad_per_instrument
  ORDER BY antal_instrument DESC
)per_instrument;



-- 2
SELECT 'totalt' as per_måna, SUM(antal_instrument)/12.0 as avg_antal_instrument
FROM totalt_antal_uthyrda_instrument_per_månad
UNION ALL
SELECT  instrument as per_månad, SUM(antal_instrument)/12.0 as avg_antal_instrument
FROM antal_uthyrda_instrument_per_månad_per_instrument
GROUP BY instrument
ORDER BY avg_antal_instrument DESC;


-- 3
SELECT 'januari' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-01-01' AND '2020-01-31'
  UNION ALL
  SELECT  COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-01-01' AND '2020-01-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-01-01' AND '2020-01-31'
)jan
UNION ALL
SELECT 'feburari' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-02-01' AND '2020-02-29'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-02-01' AND '2020-02-29'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-02-01' AND '2020-02-29'
)feb
UNION ALL
SELECT 'mars' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-03-01' AND '2020-03-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-03-01' AND '2020-03-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-03-01' AND '2020-03-31'
)mar
UNION ALL
SELECT 'april' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-04-01' AND '2020-04-30'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-04-01' AND '2020-04-30'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-04-01' AND '2020-04-30'
)apr
UNION ALL
SELECT 'maj' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-05-01' AND '2020-05-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-05-01' AND '2020-05-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-05-01' AND '2020-05-31'
)maj
UNION ALL
SELECT 'juni' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-06-01' AND '2020-06-30'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-06-01' AND '2020-06-30'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-06-01' AND '2020-06-30'
)jun
UNION ALL
SELECT 'juli' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-07-01' AND '2020-07-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-07-01' AND '2020-07-31'
  UNION ALL
  SELECT  COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-07-01' AND '2020-07-31'
)jul
UNION ALL
SELECT 'agusti' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-08-01' AND '2020-08-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-08-01' AND '2020-08-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-08-01' AND '2020-08-31'
)agu
UNION ALL
SELECT 'september' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-09-01' AND '2020-09-30'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-09-01' AND '2020-09-30'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-09-01' AND '2020-09-30'
)sep
UNION ALL
SELECT 'oktober' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-10-01' AND '2020-10-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-10-01' AND '2020-10-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-10-01' AND '2020-10-31'
)okt
UNION ALL
SELECT 'november' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-11-01' AND '2020-11-30'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-11-01' AND '2020-11-30'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-11-01' AND '2020-11-30'
)nov
UNION ALL
SELECT 'desember' as månad, 'total' as lektion, SUM(antal_lektioner) as antal_lektioner
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-12-01' AND '2020-12-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-12-01' AND '2020-12-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-12-01' AND '2020-12-31'
)dec
UNION ALL
SELECT 'januari' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-01-01' AND '2020-01-31'
UNION ALL
SELECT 'feburari' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-02-01' AND '2020-02-29'
UNION ALL
SELECT 'mars' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-03-01' AND '2020-03-31'
UNION ALL
SELECT 'april' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-04-01' AND '2020-04-30'
UNION ALL
SELECT 'maj' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-05-01' AND '2020-05-31'
UNION ALL
SELECT 'juni' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-06-01' AND '2020-06-30'
UNION ALL
SELECT 'juli' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-07-01' AND '2020-07-31'
UNION ALL
SELECT 'agusti' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-08-01' AND '2020-08-31'
UNION ALL
SELECT 'september' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-09-01' AND '2020-09-30'
UNION ALL
SELECT 'oktober' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-10-01' AND '2020-10-31'
UNION ALL
SELECT 'november' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-11-01' AND '2020-11-30'
UNION ALL
SELECT 'desember' as månad, 'grupplektion' as lektion, COUNT(id) as antal_lektioner
FROM grupplektion
WHERE tid :: date BETWEEN '2020-12-01' AND '2020-12-31'
UNION ALL
SELECT 'januari' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-01-01' AND '2020-01-31'
UNION ALL
SELECT 'feburari' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-02-01' AND '2020-02-29'
UNION ALL
SELECT 'mars' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-03-01' AND '2020-03-31'
UNION ALL
SELECT 'april' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-04-01' AND '2020-04-30'
UNION ALL
SELECT 'maj' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-05-01' AND '2020-05-31'
UNION ALL
SELECT 'juni' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-06-01' AND '2020-06-30'
UNION ALL
SELECT 'juli' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-07-01' AND '2020-07-31'
UNION ALL
SELECT 'agusti' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-08-01' AND '2020-08-31'
UNION ALL
SELECT 'september' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-09-01' AND '2020-09-30'
UNION ALL
SELECT 'oktober' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-10-01' AND '2020-10-31'
UNION ALL
SELECT 'november' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-11-01' AND '2020-11-30'
UNION ALL
SELECT 'desember' as månad, 'ensembler' as lektion, COUNT(id) as antal_lektioner
FROM ensembler
WHERE tid :: date BETWEEN '2020-12-01' AND '2020-12-31'
UNION ALL
SELECT 'januari' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-01-01' AND '2020-01-31'
UNION ALL
SELECT 'feburari' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-02-01' AND '2020-02-29'
UNION ALL
SELECT 'mars' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-03-01' AND '2020-03-31'
UNION ALL
SELECT 'april' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-04-01' AND '2020-04-30'
UNION ALL
SELECT 'maj' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-05-01' AND '2020-05-31'
UNION ALL
SELECT 'juni' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-06-01' AND '2020-06-30'
UNION ALL
SELECT 'juli' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-07-01' AND '2020-07-31'
UNION ALL
SELECT 'agusti' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-08-01' AND '2020-08-31'
UNION ALL
SELECT 'september' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-09-01' AND '2020-09-30'
UNION ALL
SELECT 'oktober' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-10-01' AND '2020-10-31'
UNION ALL
SELECT 'november' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-11-01' AND '2020-11-30'
UNION ALL
SELECT 'desember' as månad, 'inviduellektion' as lektion, COUNT(id) as antal_lektioner
FROM inviduellektion
WHERE tid :: date BETWEEN '2020-12-01' AND '2020-12-31';



-- 4
SELECT 'total' as lektion, SUM(antal_lektioner)/12 as agv_antal_lektioner_per_månad
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-01-01' AND '2020-12-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-01-01' AND '2020-12-31'
  UNION ALL
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-01-01' AND '2020-12-31'
)tot
UNION ALL
SELECT 'grupplektion' as lektion, SUM(antal_lektioner)/12 as agv_antal_lektioner_per_månad
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM grupplektion
  WHERE tid :: date BETWEEN '2020-01-01' AND '2020-12-31'
)gru
UNION ALL
SELECT 'ensembler' as lektion, SUM(antal_lektioner)/12 as agv_antal_lektioner_per_månad
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM ensembler
  WHERE tid :: date BETWEEN '2020-01-01' AND '2020-12-31'
)ens
UNION ALL
SELECT 'inviduellektion' as lektion, SUM(antal_lektioner)/12 as agv_antal_lektioner_per_månad
FROM(
  SELECT COUNT(id) as antal_lektioner
  FROM inviduellektion
  WHERE tid :: date BETWEEN '2020-01-01' AND '2020-12-31'
)inv;

-- 5
SELECT namn, instruktör_id, antal_lektioner
FROM(
  SELECT namn, instruktör_id, COUNT(instruktör_id) as antal_lektioner
  FROM(
    SELECT instruktör_id, namn
    FROM instruktör INNER JOIN grupplektion ON instruktör.id = grupplektion.instruktör_id
    WHERE DATE_PART('year',current_date) = DATE_PART('year', grupplektion.tid) AND DATE_PART('month',current_date) = DATE_PART('month', grupplektion.tid) AND grupplektion.tid <= now()
    UNION ALL
    SELECT instruktör_id, namn
    FROM instruktör INNER JOIN ensembler ON instruktör.id = ensembler.instruktör_id
    WHERE DATE_PART('year',current_date) = DATE_PART('year', ensembler.tid) AND DATE_PART('month',current_date) = DATE_PART('month', ensembler.tid) AND ensembler.tid <= now()
    UNION ALL
    SELECT instruktör_id, namn
    FROM instruktör INNER JOIN inviduellektion ON instruktör.id = inviduellektion.instruktör_id
    WHERE DATE_PART('year',current_date) = DATE_PART('year', inviduellektion.tid) AND DATE_PART('month',current_date) = DATE_PART('month', inviduellektion.tid) AND inviduellektion.tid <= now()
  ) lektioner
  GROUP BY instruktör_id, namn
) över
WHERE antal_lektioner > 2
UNION ALL
SELECT 'top 3 instruktörer som jobbat mest föregåend månad' as namn, 0 as instruktör_id, 0 as count
UNION ALL
SELECT namn, instruktör_id, antal_lektioner
FROM(
  SELECT namn, instruktör_id, COUNT(instruktör_id) as antal_lektioner
  FROM(
    SELECT instruktör_id, namn
    FROM instruktör INNER JOIN grupplektion ON instruktör.id = grupplektion.instruktör_id
    WHERE DATE_PART('year',current_date - interval '1 month') = DATE_PART('year', grupplektion.tid) AND DATE_PART('month',current_date - interval '1 month') = DATE_PART('month', grupplektion.tid)
    UNION ALL
    SELECT instruktör_id, namn
    FROM instruktör INNER JOIN ensembler ON instruktör.id = ensembler.instruktör_id
    WHERE DATE_PART('year',current_date - interval '1 month') = DATE_PART('year', ensembler.tid) AND DATE_PART('month',current_date - interval '1 month') = DATE_PART('month', ensembler.tid)
    UNION ALL
    SELECT instruktör_id, namn
    FROM instruktör INNER JOIN inviduellektion ON instruktör.id = inviduellektion.instruktör_id
    WHERE DATE_PART('year',current_date - interval '1 month') = DATE_PART('year', inviduellektion.tid) AND DATE_PART('month',current_date - interval '1 month') = DATE_PART('month', inviduellektion.tid)
  ) lektion
  GROUP BY instruktör_id, namn
  ORDER BY antal_lektioner DESC
  LIMIT 3
) max;

-- 6
SELECT genre,
  CASE WHEN EXTRACT(DOW FROM tid) = 1 THEN 'månad'
       WHEN EXTRACT(DOW FROM tid) = 2 THEN 'tisdag'
       WHEN EXTRACT(DOW FROM tid) = 3 THEN 'onsdag'
       WHEN EXTRACT(DOW FROM tid) = 4 THEN 'torsdag'
       WHEN EXTRACT(DOW FROM tid) = 5 THEN 'fredag'
       WHEN EXTRACT(DOW FROM tid) = 6 THEN 'lördag'
       ELSE 'söndag'
  END as dag,
  CASE WHEN antal_platser - antal_deltagare = 0 THEN 'fulbokad'
       WHEN antal_platser - antal_deltagare = 1 THEN '1-2 platser kvar'
       WHEN antal_platser - antal_deltagare = 2 THEN '1-2 platser kvar'
       ELSE 'mer än 2 lediga platser'
  END as platser_kvar
FROM ensembler
WHERE tid BETWEEN current_date + 7 - EXTRACT(DOW FROM current_date) :: int AND current_date + 7 - EXTRACT(DOW FROM current_date) :: int + 6
GROUP BY genre, EXTRACT(DOW FROM tid), antal_platser - antal_deltagare;


-- 7
SELECT hyr.instrument, pris_per_månad, på_lager,
  CASE WHEN nästa_lektion IS NULL THEN 'ingen schemalagd lektion'
       ELSE to_char(nästa_lektion, 'YYYY-MM-DD HH24:MI')
  END as nästa_lektion
FROM(
  (SELECT instrument, pris_per_månad,
  CASE WHEN antal_på_lager > 0 THEN 'fins att hyra'
  ELSE 'slut på lager'
  END as på_lager
  FROM hyr_instrument
  ORDER BY pris_per_månad ASC
  LIMIT 3)  as hyr
  LEFT JOIN
    (SELECT DISTINCT ON (instrument) instrument , tid as nästa_lektion
    FROM grupplektion
    WHERE tid > current_date
    GROUP BY instrument, tid) as lektion
   ON hyr.instrument = lektion.instrument
);
