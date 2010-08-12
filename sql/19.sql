CREATE OR REPLACE FUNCTION petla_for(n integer, k integer) RETURNS void AS $$
	DECLARE
		i	integer := 123456;
	BEGIN
		RAISE NOTICE 'i=%', i;

		FOR i IN 1 .. n LOOP
			RAISE NOTICE 'pêtla g³ówna: i=%', i;
			FOR i IN REVERSE k .. 1 LOOP
				RAISE NOTICE 'pêtla zagnie¿d¿ona: i=%', i;
			END LOOP;
		END LOOP;

		RAISE NOTICE 'i=%', i;

		RETURN;
	END
$$ LANGUAGE 'plpgsql';

SELECT petla_for(2, 3);
-- wynik:
-- NOTICE:  i=123456
-- NOTICE:  pêtla g³ówna: i=1
-- NOTICE:  pêtla zagnie¿d¿ona: i=1
-- NOTICE:  pêtla zagnie¿d¿ona: i=2
-- NOTICE:  pêtla zagnie¿d¿ona: i=3
-- NOTICE:  pêtla g³ówna: i=2
-- NOTICE:  pêtla zagnie¿d¿ona: i=1
-- NOTICE:  pêtla zagnie¿d¿ona: i=2
-- NOTICE:  pêtla zagnie¿d¿ona: i=3
-- NOTICE:  i=123456

