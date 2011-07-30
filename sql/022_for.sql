CREATE OR REPLACE FUNCTION for_test() RETURNS VOID
LANGUAGE 'plpgsql' AS $$
    BEGIN
        RAISE NOTICE 'przykład 1';
        FOR i IN 1 .. 5 LOOP
            RAISE NOTICE 'i=%', i;
        END LOOP;

        RAISE NOTICE 'przykład 2';
        FOR i IN 1 .. 5 BY 3 LOOP
            RAISE NOTICE 'i=%', i;
        END LOOP;

        RAISE NOTICE 'przykład 3';
        FOR i IN REVERSE 5 .. 1 LOOP
            RAISE NOTICE 'i=%', i;
        END LOOP;

        RAISE NOTICE 'przykład 4';
        FOR i IN REVERSE 5 .. 1 BY 3 LOOP
            RAISE NOTICE 'i=%', i;
        END LOOP;
    END;
$$;

CREATE OR REPLACE FUNCTION for_test2() RETURNS integer
LANGUAGE 'plpgsql' AS $$
    DECLARE
        i   integer;
    BEGIN
        i := 123;

        FOR i IN 1 .. 15 LOOP
            -- zmienna i z zewnętrznego bloku jest przysłaniana
            NULL;
        END LOOP;

        RETURN i; -- i = 123
    END;
$$;

