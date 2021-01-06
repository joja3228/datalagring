
\c simplejdbc

-- skapa skola
INSERT INTO skola (namn, antal_instruktörer, antal_studenter, minimi_ålder_för_studenter)
VALUES('Soundgood Music School', 4, 6, 10);

-- skapa instruktörer
INSERT INTO instruktör(namn, ålder, personumer, telefonumer, epost, betalningsinfo, gatu_adress, postnumer, postort, stad, skola_id)
VALUES ('Peter', 45, '000000000001', '123', 'peter@epost', '000000000001', 'gata 1', '123', 'ort 1', 'stad 1', 1);

INSERT INTO instruktör(namn, ålder, personumer, telefonumer, epost, betalningsinfo, gatu_adress, postnumer, postort, stad, skola_id)
VALUES ('Anna', 36, '000000000002', '456', 'anna@epost', '000000000002', 'gata 2', '234', 'ort 2', 'stad 2', 1);

INSERT INTO instruktör(namn, ålder, personumer, telefonumer, epost, betalningsinfo, gatu_adress, postnumer, postort, stad, skola_id)
VALUES ('Lisa', 53, '000000000003', '352', 'lisa@epost', '000000000003', 'gata 3', '345', 'ort 3', 'stad 3', 1);

INSERT INTO instruktör(namn, ålder, personumer, telefonumer, epost, betalningsinfo, gatu_adress, postnumer, postort, stad, skola_id)
VALUES ('Simon', 48, '000000000004', '001', 'simon@epost', '000000000004', 'gata 4', '456', 'ort 4', 'stad 4', 1);

-- instrument_instruktör
INSERT INTO instrument_instruktör(instruktör_id, instrument_emsembler)
VALUES(1,'gitar');

INSERT INTO instrument_instruktör(instruktör_id, instrument_emsembler)
VALUES(2,'gitar');

INSERT INTO instrument_instruktör(instruktör_id, instrument_emsembler)
VALUES(1,'piano');

INSERT INTO instrument_instruktör(instruktör_id, instrument_emsembler)
VALUES(3,'selo');

INSERT INTO instrument_instruktör(instruktör_id, instrument_emsembler)
VALUES(4,'flöjt');

INSERT INTO instrument_instruktör(instruktör_id, instrument_emsembler)
VALUES(4,'ensembler');

-- skapa syskon_rabat
INSERT INTO syskon_rabat(prosentuel_rabat)
VALUES (0.1);

-- skapa studenter
INSERT INTO student(namn, ålder, personumer, telefonumer, epost, förälders_telefonumer, förälders_epost, betalningsinfo,
  antal_hyrda_instrument, gatu_adress, postnumer, postort, stad, skola_id, syskon_rabat_id)
VALUES ('Kale', 15, '10000000000', '01', 'kale@epost', '10', 'kalef@epost', '001',
  0, 'gata 5', '123', 'ort 1', 'stad 1', 1, 1);

INSERT INTO student(namn, ålder, personumer, telefonumer, epost, förälders_telefonumer, förälders_epost, betalningsinfo,
  antal_hyrda_instrument, gatu_adress, postnumer, postort, stad, skola_id)
VALUES ('Kale', 11, '20000000000', '02', 'kale2@epost', '20', 'kale2f@epost', '002',
  0, 'gata 6', '678', 'ort 6', 'stad 6', 1);

INSERT INTO student(namn, ålder, personumer, telefonumer, epost, förälders_telefonumer, förälders_epost, betalningsinfo,
  antal_hyrda_instrument, gatu_adress, postnumer, postort, stad, skola_id)
VALUES ('Maja', 17, '30000000000', '03', 'maja@epost', '30', 'majaf@epost', '003',
  0, 'gata 3', '345', 'ort 3', 'stad 3', 1);

INSERT INTO student(namn, ålder, personumer, telefonumer, epost, förälders_telefonumer, förälders_epost, betalningsinfo,
  antal_hyrda_instrument, gatu_adress, postnumer, postort, stad, skola_id, syskon_rabat_id)
VALUES ('Stina', 17, '40000000000', '04', 'stina@epost', '10', 'kalef@epost', '001',
  0, 'gata 5', '123', 'ort 1', 'stad 1', 1, 1);

INSERT INTO student(namn, ålder, personumer, telefonumer, epost, förälders_telefonumer, förälders_epost, betalningsinfo,
  antal_hyrda_instrument, gatu_adress, postnumer, postort, stad, skola_id)
VALUES ('Klara', 12, '50000000000', '05', 'klara@epost', '50', 'klaraf@epost', '005',
  0, 'gata 7', '123', 'ort 1', 'stad 1', 1);

INSERT INTO student(namn, ålder, personumer, telefonumer, epost, förälders_telefonumer, förälders_epost, betalningsinfo,
  antal_hyrda_instrument, gatu_adress, postnumer, postort, stad, skola_id)
VALUES ('Maria', 13, '60000000000', '06', 'maria@epost', '60', 'mariaf@epost', '006',
  0, 'gata 8', '678', 'ort 6', 'stad 6', 1);

-- skapa syskon
INSERT INTO syskon(student1_id, student2_id)
VALUES(1,4);

-- skapa hyr_instrument
INSERT INTO hyr_instrument(instrument, katigori, märke, antal_på_lager, pris_per_månad)
VALUES ('gitar', 'sträng instrument', 'märke 1', 5, 100);

INSERT INTO hyr_instrument(instrument, katigori, märke, antal_på_lager, pris_per_månad)
VALUES ('gitar', 'sträng instrument', 'märke 2', 0, 90);

INSERT INTO hyr_instrument(instrument, katigori, märke, antal_på_lager, pris_per_månad)
VALUES ('selo', 'sträng instrument', 'märke 1', 3, 150);

INSERT INTO hyr_instrument(instrument, katigori, märke, antal_på_lager, pris_per_månad)
VALUES ('flöjt', 'blås instrument', 'märke 2', 8, 50);

INSERT INTO hyr_instrument(instrument, katigori, märke, antal_på_lager, pris_per_månad)
VALUES ('flöjt', 'blås instrument', 'märke 3', 1, 70);

-- skapa hyrda_instrument
-- gitar
INSERT INTO hyrda_instrument(start_månad, slut_månad, student_id, hyr_instrument_id)
VALUES ('2020-02-12', '2020-12-01', 1, 1);

-- selo
INSERT INTO hyrda_instrument(start_månad, slut_månad, student_id, hyr_instrument_id)
VALUES ('2019-06-5', '2020-02-05', 3, 3);

-- gitar
INSERT INTO hyrda_instrument(start_månad, slut_månad, student_id, hyr_instrument_id)
VALUES ('2020-01-10', '2020-08-01', 3, 1);

-- gitar
INSERT INTO hyrda_instrument(start_månad, slut_månad, student_id, hyr_instrument_id)
VALUES ('2020-02-09', '2020-08-01', 4, 2);

-- gitar
INSERT INTO hyrda_instrument(start_månad, slut_månad, student_id, hyr_instrument_id)
VALUES ('2019-02-09', '2019-08-01', 4, 2);


-- skapa extra_kostnad
INSERT INTO extra_kostnad(extra_kostnad)
VALUES(50);

-- skapa grupplektion



INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'gitar', 'avanserad', '2021-01-18 16:00', 'blå', 100, 2);

INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'gitar', 'melan', '2021-01-15 16:00', 'röd', 100, 1);



INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'gitar', 'nybörjare', '2020-12-28 10:00', 'grön', 100, 1);

INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'gitar', 'avanserad', '2020-12-28 13:00', 'grön', 150, 2);

INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'selo', 'melan', '2020-12-30 16:00', 'röd', 100, 3);



INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id)
VALUES(10, 4, 0, 'flöjt', 'nybörjare', '2020-11-28 10:00', 'grön', 100, 4, 1);

INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id)
VALUES(10, 4, 0, 'gitar', 'avanserad', '2020-11-28 13:00', 'grön', 150, 2, 1);

INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'selo', 'melan', '2020-11-30 16:00', 'röd', 100, 3);

INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'gitar', 'nybörjare', '2020-11-20 14:00', 'röd', 100, 1);

INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'gitar', 'avanserad', '2020-11-18 11:00', 'grön', 150, 2);



INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'gitar', 'nybörjare', '2020-10-28 10:00', 'grön', 100, 1);

INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'gitar', 'avanserad', '2020-10-28 13:00', 'grön', 150, 2);

INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'selo', 'melan', '2020-10-30 16:00', 'röd', 100, 3);



INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id)
VALUES(10, 4, 0, 'gitar', 'nybörjare', '2020-09-20 14:00', 'röd', 100, 1, 1);

INSERT INTO grupplektion(antal_platser, minsta_antal_deltagare, antal_deltagare, instrument, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 0, 'gitar', 'avanserad', '2020-09-18 11:00', 'grön', 150, 2);

-- skapa ensembler

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 10, 'punk rock', 'nybörjare', '2020-12-28 10:00', 'blå', 150, 4);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 8, 'gospel band', 'avanserad', '2020-12-28 13:00', 'blå', 150, 4);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 9, 'gospel band', 'melan', '2020-12-30 16:00', 'blå', 150, 4);



INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id)
VALUES(10, 4, 10, 'gospel band', 'nybörjare', '2020-11-28 13:00', 'blå', 150, 4, 1);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id)
VALUES(10, 4, 5, 'gospel band', 'avanserad', '2020-11-28 16:00', 'blå', 150, 4, 1);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 7, 'punk rock', 'melan', '2020-11-30 16:00', 'blå', 150, 4);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 8, 'punk rock', 'nybörjare', '2020-11-20 14:00', 'blå', 150, 4);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 10, 'gospel band', 'avanserad', '2020-11-18 11:00', 'blå', 150, 4);



INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 8, 'gospel band', 'nybörjare', '2020-08-28 10:00', 'blå', 150, 4);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 9, 'gospel band', 'avanserad', '2020-08-28 13:00', 'blå', 150, 4);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id)
VALUES(10, 4, 5, 'gospel band', 'melan', '2020-08-30 16:00', 'blå', 150, 4, 1);


-- 2021
INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id)
VALUES(10, 4, 8, 'punk rock', 'nybörjare', '2021-01-02 14:00', 'blå', 150, 4, 1);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id)
VALUES(10, 4, 5, 'gospel band', 'melan', '2021-01-02 16:00', 'blå', 150, 4, 1);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id)
VALUES(10, 4, 10, 'punk rock', 'avanserad', '2021-01-01 11:00', 'blå', 150, 4, 1);


INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 8, 'punk rock', 'nybörjare', '2021-01-7 14:00', 'blå', 150, 4);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 5, 'gospel band', 'melan', '2021-01-7 16:00', 'blå', 150, 4);

INSERT INTO ensembler(antal_platser, minsta_antal_deltagare, antal_deltagare, genre, nivå, tid, sal, pris, instruktör_id)
VALUES(10, 4, 10, 'punk rock', 'avanserad', '2021-01-7 11:00', 'blå', 150, 4);


-- skapa inviduellektion

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id, student_id)
VALUES('gitar', 'nybörjare', '2020-07-04 10:00', 'grön', 200, 1, 1, 1);

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, student_id)
VALUES('gitar', 'avanserad', '2020-07-10 13:00', 'blå', 200, 2, 3);

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, student_id)
VALUES('flöjt', 'nybörjare', '2020-07-03 09:00', 'röd', 200, 4, 2);

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id, student_id)
VALUES('gitar', 'nybörjare', '2020-07-11 10:00', 'grön', 200, 1, 1, 1);

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, student_id)
VALUES('gitar', 'avanserad', '2020-07-13 13:00', 'blå', 200, 2, 3);

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, student_id)
VALUES('flöjt', 'nybörjare', '2020-07-15 09:00', 'röd', 200, 4, 2);



INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, student_id)
VALUES('gitar', 'nybörjare', '2020-06-04 10:00', 'grön', 200, 1, 1);

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, student_id)
VALUES('gitar', 'avanserad', '2020-06-10 13:00', 'blå', 200, 2, 3);

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, student_id)
VALUES('flöjt', 'nybörjare', '2020-06-03 09:00', 'röd', 200, 4, 2);

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, student_id)
VALUES('gitar', 'nybörjare', '2020-06-11 10:00', 'grön', 200, 1, 1);

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, extra_kostnad_id, student_id)
VALUES('gitar', 'avanserad', '2020-06-13 13:00', 'blå', 200, 2, 1, 3);

INSERT INTO inviduellektion(instrument, nivå, tid, sal, pris, instruktör_id, student_id)
VALUES('flöjt', 'nybörjare', '2020-06-15 09:00', 'röd', 200, 4, 2);
