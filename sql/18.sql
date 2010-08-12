CREATE OR REPLACE FUNCTION etykieta_petli(n integer, k integer, z integer) RETURNS void AS $$
	DECLARE
		licznik	integer := 0;
	BEGIN
		<<glowna>>
		FOR i IN 1 .. n LOOP
			FOR j IN 1 .. k LOOP
				EXIT glowna WHEN licznik >= z;

				licznik := licznik + 1;
			END LOOP;
		END LOOP glowna;

		RETURN;
	END
$$ LANGUAGE 'plpgsql';

SELECT etykieta_petli(10, 20, 77);
