CREATE OR REPLACE FUNCTION test(text, integer) RETURNS void AS $$
    DECLARE
        napis1  text := 'zmienna';

        napis2  ALIAS FOR $1;       -- parametr
        liczba  ALIAS FOR $2;       -- parametr

        napis3  ALIAS FOR napis1;   -- zmienna
        napis4  ALIAS FOR napis2;   -- inny alias

    BEGIN
        RAISE NOTICE '%, %', $1, $2;
        RAISE NOTICE '%, %, %, %, %', napis1, liczba, napis2, napis3, napis4;
    END;
$$ LANGUAGE 'plpgsql';

SELECT test('kot', 123);
