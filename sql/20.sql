CREATE OR REPLACE FUNCTION zakresy() RETURNS void AS $$
    DECLARE
        tekst   text := 'tekst';
        liczba  integer := 123;
    BEGIN
        RAISE NOTICE 'tekst=%, liczba=%', tekst, liczba;
    
        <<blok_zagniezdzony>>
        DECLARE
            tekst   text := 'zagnieżdżony';
        BEGIN
            RAISE NOTICE 'tekst=%, liczba=%', tekst, liczba;
        END;

        RAISE NOTICE 'tekst=%, liczba=%', tekst, liczba;
    END
$$ LANGUAGE 'plpgsql';

SELECT zakresy();
