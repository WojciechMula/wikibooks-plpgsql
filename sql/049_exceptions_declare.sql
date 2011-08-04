BEGIN;

CREATE OR REPLACE FUNCTION test() RETURNS text AS $$
    DECLARE
        k integer := 1/0;
    BEGIN
        RETURN 'ok';
    EXCEPTION
        WHEN division_by_zero THEN
            RETURN 'Dzielenie przez zero!';
    END;
$$ LANGUAGE 'plpgsql';

SELECT test();

ROLLBACK;
