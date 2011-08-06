BEGIN;

CREATE OR REPLACE FUNCTION lista_tabel() RETURNS SETOF text AS $$
    DECLARE
        kursor CURSOR FOR SELECT relname FROM pg_class;
        nazwa  text;
    BEGIN
        OPEN kursor;
        LOOP
            FETCH FROM kursor INTO nazwa;
            EXIT WHEN NOT FOUND;

            RETURN NEXT nazwa;
        END LOOP;

        CLOSE kursor;
    END;
$$ LANGUAGE 'plpgsql' STABLE;

SELECT * FROM lista_tabel();

ROLLBACK;
