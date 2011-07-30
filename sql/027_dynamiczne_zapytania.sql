CREATE OR REPLACE FUNCTION podwyzka(placa_minimalna numeric, wiek integer, podwyzka numeric) RETURNS void AS $$
    BEGIN
        EXECUTE
            'UPDATE osoby SET osoba_placa=osoba_placa + $1'
            ' WHERE osoba_wiek > $2 OR osoba_placa < $3'
        USING
            podwyzka,   -- $1
            wiek,       -- $2
            placa_minimalna -- $3
        ;
    END;
$$ LANGUAGE 'plpgsql';
