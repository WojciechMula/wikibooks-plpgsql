CREATE OR REPLACE FUNCTION zakresy() RETURNS void AS $$
    <<blok>>
    DECLARE
        tekst   text := 'tekst';
        liczba  integer := 123;
    BEGIN
        RAISE NOTICE 'tekst=%, liczba=%', tekst, liczba;
    
        <<blok_zagniezdzony>>
        DECLARE
            tekst   text := 'zagnieżdżony'; -- przesłanienie
            liczba2 integer := liczba;      -- inicjalizacja zmienną
        BEGIN
            RAISE NOTICE 'tekst=%, blok.tekst=%, liczba=%, liczba2=%', tekst, blok.tekst, liczba, liczba2;
        END;

        RAISE NOTICE 'tekst=%, liczba=%', tekst, liczba;
    END;
$$ LANGUAGE 'plpgsql';

SELECT zakresy();
