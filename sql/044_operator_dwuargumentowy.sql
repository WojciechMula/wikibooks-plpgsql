BEGIN;

CREATE OR REPLACE FUNCTION powtorz(text, integer) RETURNS text AS $$
    DECLARE
        n   integer := $2;
        res text = '';
    BEGIN
        WHILE n > 0 LOOP
            res := res || $1;
            n := n - 1;
        END LOOP;
        RETURN res; 
    END;
$$ LANGUAGE 'plpgsql' IMMUTABLE;

CREATE OPERATOR &** (
    PROCEDURE   = powtorz,
    LEFTARG     = text,
    RIGHTARG    = integer
);

SELECT 'La ' &** 3 &** 2;

ROLLBACK;
