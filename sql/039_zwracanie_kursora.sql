CREATE OR REPLACE FUNCTION kursor(nazwa_kursora text) RETURNS refcursor AS $$
	DECLARE
		c	refcursor := nazwa_kursora;
	BEGIN
		OPEN c FOR SELECT * FROM pracownicy;
		RETURN c;
	END;
$$ LANGUAGE 'plpgsql';

BEGIN;

SELECT kursor('nasz kursor');

-- uwaga, tutaj nazwa kursora to nazwa kolumny!
FETCH ALL IN "nasz kursor";

ROLLBACK;
