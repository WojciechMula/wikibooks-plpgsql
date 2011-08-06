CREATE OR REPLACE FUNCTION binsearch(T integer[], x integer) RETURNS integer AS $$
    DECLARE
        a   integer;
        b   integer;
        c   integer;
        y   integer;
    BEGIN
        a := array_lower(T, 1);
        b := array_upper(T, 1);

        IF a IS NULL OR b IS NULL THEN
            RETURN NULL;
        END IF;

        WHILE a <= b LOOP
            c := (a + b) / 2;
            y := T[c];

            IF x = y THEN
                -- znaleziono!
                RETURN c;
            ELSIF x < y THEN
                -- wybór przedziału [a, c - 1]
                b := c - 1;
            ELSE
                -- wybór przedziału [c + 1, b]
                a := c + 1;
            END IF;
        END LOOP;

        RETURN NULL;
    END;
$$ LANGUAGE 'plpgsql'
    STRICT
    IMMUTABLE
;

/*
SELECT binsearch(ARRAY[1, 2, 3, 4, 5, 7], -100);
SELECT binsearch(ARRAY[1, 2, 3, 4, 5, 7], 0);
SELECT binsearch(ARRAY[1, 2, 3, 4, 5, 7], 1);
SELECT binsearch(ARRAY[1, 2, 3, 4, 5, 7], 2);
SELECT binsearch(ARRAY[1, 2, 3, 4, 5, 7], 3);
SELECT binsearch(ARRAY[1, 2, 3, 4, 5, 7], 4);
SELECT binsearch(ARRAY[1, 2, 3, 4, 5, 7], 5);
SELECT binsearch(ARRAY[1, 2, 3, 4, 5, 7], 6);
SELECT binsearch(ARRAY[1, 2, 3, 4, 5, 7], 7);
SELECT binsearch(ARRAY[1, 2, 3, 4, 5, 7], 100);
*/
