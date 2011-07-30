BEGIN;

CREATE TABLE test (x integer);
INSERT INTO test (SELECT i FROM generate_series(1, 1000) AS i);

CREATE FUNCTION skasuj_losowe() RETURNS integer AS $$
	DECLARE
		n	integer;
	BEGIN
		DELETE FROM test WHERE random() > 0.9;

		GET DIAGNOSTICS n = ROW_COUNT;
		RETURN n;
	END;
$$ LANGUAGE plpgsql;

SELECT skasuj_losowe();

ROLLBACK;
