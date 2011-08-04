CREATE TABLE osoby (
    id          integer PRIMARY KEY,
    imie        text NOT NULL,
    nazwisko    text NOT NULL,
    wiek        integer NOT NULL CHECK (wiek > 0)
);

CREATE OR REPLACE FUNCTION dodaj_osobe(integer, text, text, integer) RETURNS text AS $$
    BEGIN
        INSERT INTO osoby VALUES ($1, $2, $3, $4);
        RETURN 'OK!';
    EXCEPTION
        WHEN UNIQUE_VIOLATION THEN
            RETURN 'powtórzony identyfikator osoby';

        WHEN CHECK_VIOLATION THEN
            RETURN 'wiek nie może być mniejszy ani równy zero';

        WHEN OTHERS THEN
            -- teraz lepiej
            RETURN 'błąd ' || SQLSTATE || ': ' || SQLERRM;
    END;
$$ LANGUAGE 'plpgsql';

TRUNCATE osoby;
SELECT dodaj_osobe(1, 'Jan', 'Kowalski', 33);
SELECT dodaj_osobe(1, 'Jan', 'Kowalski', 33);
SELECT dodaj_osobe(2, 'Kazimierz', 'Nowak', 0);
SELECT dodaj_osobe(3, NULL, 'Nowak', 0);
