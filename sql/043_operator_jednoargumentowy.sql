BEGIN;

CREATE OR REPLACE FUNCTION kwadrat(numeric) RETURNS numeric AS $$
    BEGIN
        RETURN $1 * $1;
    END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OPERATOR ## (
    PROCEDURE   = kwadrat,
    RIGHTARG    = numeric
);

SELECT ## 5.0;
SELECT ## 1.7;

ROLLBACK;
