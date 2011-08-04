CREATE OR REPLACE FUNCTION test_strict(integer, VARIADIC text[]) RETURNS integer AS $$
    BEGIN
        RETURN array_length($2, 1);
    END;
$$ LANGUAGE 'plpgsql'
   STRICT
;

SELECT test_strict(3, NULL, NULL, NULL);
SELECT test_strict(4, VARIADIC NULL::text[]);
