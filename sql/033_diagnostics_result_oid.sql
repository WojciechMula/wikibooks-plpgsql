BEGIN;

CREATE TABLE test (x integer)
	WITH OIDS; --<--

CREATE FUNCTION wstaw_kilka_wierszy() RETURNS oid AS $$
	DECLARE
		n	integer;
		id	oid;
	BEGIN
		n := CAST(random() * 10 AS integer);
		FOR i in 1 .. n LOOP
			INSERT INTO test VALUES (i);
		END LOOP;

		GET DIAGNOSTICS id = RESULT_OID;
		RETURN id;
	END;
$$ LANGUAGE plpgsql;

SELECT wstaw_kilka_wierszy();
SELECT wstaw_kilka_wierszy();

ROLLBACK;
