CREATE OR REPLACE FUNCTION zwierzaczek(gatunek text, imie text, waga integer, sprytny boolean) RETURNS void AS $$
    BEGIN
        RAISE NOTICE '% % % %', $1, $2, $3, $4;
    END;
$$ LANGUAGE 'plpgsql';

-- argumenty pozycyjne
SELECT zwierzaczek('kot', 'Filemon', 3, true);

-- argumenty nazwane
SELECT zwierzaczek(sprytny := true, gatunek := 'kot', waga := 3, imie := 'Filemon');

-- argumenty mieszane
SELECT zwierzaczek('kot', 'Filemon', sprytny := true, waga := 3);
