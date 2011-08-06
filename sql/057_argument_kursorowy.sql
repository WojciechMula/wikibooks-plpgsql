CREATE OR REPLACE FUNCTION co_czwarty(K REFCURSOR) RETURNS SETOF text AS $$
    DECLARE
        nazwa   text;
    BEGIN
        LOOP
            FETCH NEXT FROM K INTO nazwa;
            EXIT WHEN NOT FOUND;

            RETURN NEXT nazwa;
            MOVE +3 FROM K;
        END LOOP;
    END;
$$ LANGUAGE 'plpgsql';

BEGIN;

-- stworzenie kursora
DECLARE kursor CURSOR FOR SELECT relname FROM pg_class ORDER BY relname;

SELECT co_czwarty('kursor');

ROLLBACK;
