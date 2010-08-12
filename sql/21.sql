CREATE OR REPLACE FUNCTION aliasy(tablica integer[][]) RETURNS void AS $$
	BEGIN
		FOR i IN array_lower(tablica, 1) .. array_upper(tablica, 1) LOOP
			FOR j IN array_lower(tablica, 2) .. array_upper(tablica, 2) LOOP
			DECLARE
				e	integer := tablica[i][j];
			BEGIN
				RAISE NOTICE 'tablica[%][%]=%', i, j, e;
			END;
			END LOOP;
		END LOOP;
	END
$$ LANGUAGE 'plpgsql';

SELECT aliasy(ARRAY[ARRAY[1,2,3,4], ARRAY[5,6,7,8], ARRAY[9,10,11,12]]);
