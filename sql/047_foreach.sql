CREATE OR REPLACE FUNCTION for_each1() RETURNS VOID AS $$
    DECLARE
        tablica integer[];
        element integer;
    BEGIN
        tablica := ARRAY[10,20,30,40];
        FOREACH element IN ARRAY tablica
        -- lub
        -- FOREACH element SLICE 0 IN ...
        LOOP
            RAISE NOTICE '%', element;
        END LOOP;
    END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION for_each2() RETURNS VOID AS $$
    DECLARE
        tablica integer[][][];
        --element integer;       -- dla SLICE 0
        --element integer[];     -- dla SLICE 1
        --element integer[][];     -- dla SLICE 2
        element integer[][][]; -- dla SLICE 3
    BEGIN
        -- wymiary tablicy [3,3,3]
        tablica := ARRAY[
            ARRAY[ARRAY[1,2,3], ARRAY[4,5,6], ARRAY[7,8,9]],
            ARRAY[ARRAY[11,12,13], ARRAY[14,15,16], ARRAY[17,18,19]],
            ARRAY[ARRAY[21,22,23], ARRAY[24,25,26], ARRAY[27,28,29]]
        ];

        --FOREACH element SLICE 0 IN ARRAY tablica LOOP
        --FOREACH element SLICE 1 IN ARRAY tablica LOOP
        --FOREACH element SLICE 2 IN ARRAY tablica LOOP
        FOREACH element SLICE 3 IN ARRAY tablica LOOP
            RAISE NOTICE '%', element;
        END LOOP;
    END;
$$ LANGUAGE 'plpgsql';

SELECT for_each1();
SELECT for_each2();
