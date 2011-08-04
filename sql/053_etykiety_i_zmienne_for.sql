CREATE OR REPLACE FUNCTION forfor() RETURNS VOID AS $$
	BEGIN
        <<petla_1>>
        FOR i IN 1 .. 5 LOOP
            <<petla_2>>
            FOR i IN 6 .. 7 LOOP
                RAISE NOTICE 'i=%, i=%', petla_1.i, petla_2.i;
            END LOOP;
        END LOOP;
	END;
$$ LANGUAGE 'plpgsql';

SELECT forfor();
