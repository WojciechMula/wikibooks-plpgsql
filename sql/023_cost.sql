BEGIN;

CREATE OR REPLACE FUNCTION predykat_szybki(integer) RETURNS boolean
	LANGUAGE 'plpgsql'
	COST 0.01
AS $$
	BEGIN
		RETURN $1 > 90;
	END;
$$;

CREATE OR REPLACE FUNCTION predykat_powolny(integer) RETURNS boolean
	LANGUAGE 'plpgsql'
	COST 1000
AS $$
	BEGIN
		RETURN $1 > 90;
	END;
$$;


CREATE TABLE test (x integer);
INSERT INTO test (SELECT 100*random() FROM generate_series(1, 1000));

EXPLAIN ANALYZE SELECT COUNT(*) FROM test
 WHERE predykat_szybki(x) AND x > 30;

EXPLAIN ANALYZE SELECT COUNT(*) FROM test
 WHERE predykat_powolny(x) AND x > 30;

ROLLBACK;
