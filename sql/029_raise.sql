CREATE OR REPLACE FUNCTION test(integer) RETURNS VOID AS $$
	DECLARE
		x	CONSTANT	integer := 5;
		y	CONSTANT	integer := 9;
	BEGIN
		CASE $1
			WHEN 1 THEN
				RAISE NO_DATA_FOUND;

			WHEN 2 THEN
				RAISE SQLSTATE 'AA000';
				RAISE SQLSTATE '23505';

			WHEN 3 THEN
				RAISE 'Treść wyjątku';
			
			WHEN 4 THEN
				RAISE 'x = %, y = %', x, y;

			WHEN 5 THEN
				RAISE USING
						MESSAGE	= 'Treść komunikatu',
						DETAIL	= 'Szczegóły',
						HINT	= 'Podpowiedź',
						ERRCODE	= 'unique_violation'
				;

		END CASE;
	END;
$$ LANGUAGE 'plpgsql';

--SELECT test(1);
SELECT test(2);
--SELECT test(3);
--SELECT test(4);
SELECT test(5);
