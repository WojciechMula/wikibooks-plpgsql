CREATE TABLE osoby (
    osoba_imie        text,
    osoba_nazwisko    text,
    osoba_wiek        integer
);


CREATE OR REPLACE FUNCTION test(integer) RETURNS void AS $$
    DECLARE
        kursor CURSOR (wiek integer) FOR
                    SELECT * FROM osoby WHERE osoba_wiek >= wiek;

        rekord osoby%ROWTYPE;
    BEGIN
        FOR rekord IN kursor($1) LOOP
            RAISE NOTICE 'imię=%, nazwisko=%', rekord.osoba_imie, rekord.osoba_nazwisko;
        END LOOP;
        
        OPEN kursor($1);
        CLOSE kursor;
    END;
$$ LANGUAGE 'plpgsql' STABLE;

TRUNCATE osoby;
INSERT INTO osoby VALUES
    ('Jan', 'Kowalski', 25),
    ('Anna', 'Nowak', 33),
    ('Tomasz', 'Jodłowski', 40),
    ('Ryszard', 'Zamojski', 20)
;

SELECT test(0);
