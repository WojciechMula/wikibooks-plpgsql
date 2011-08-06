CREATE TABLE pracownicy (imie text, nazwisko text, wiek integer);

CREATE OR REPLACE FUNCTION funkcja(wspolczynnik real) RETURNS void AS $$
    DECLARE
        napis pracownicy.imie%TYPE; -- typ text
        w     wspolczynnik%TYPE;    -- typ real
        r1    pracownicy;           -- typ pracownicy
        r2    pracownicy%ROWTYPE;   -- typ pracownicy
        r3    w%TYPE;               -- typ real
    BEGIN
        RAISE NOTICE 'typ zmiennej: napis=%, w=%, r1=%, r2=%, r3=%',
            pg_typeof(napis),
            pg_typeof(w),
            pg_typeof(r1),
            pg_typeof(r2),
            pg_typeof(r3)
        ;
    END;
$$ LANGUAGE 'plpgsql';

SELECT funkcja(0.5);
