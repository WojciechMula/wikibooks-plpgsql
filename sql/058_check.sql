BEGIN;

CREATE FUNCTION sprawdz_napis(napis text, min_dlugosc integer) RETURNS boolean AS $$
    BEGIN
        RAISE NOTICE '%, %', min_dlugosc, napis;
        IF napis IS NULL THEN
            -- pusty napis
            RETURN false; 
        ELSIF length(napis) < min_dlugosc THEN
            -- za krótki
            RETURN false; 
        ELSE
            RETURN true;
        END IF;
    END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE TABLE tabela (
    -- ...
    x integer,
    napis text CHECK(sprawdz_napis(napis, x))
    -- ...
);

INSERT INTO tabela VALUES (32, 'testowy');

ROLLBACK;
