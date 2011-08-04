BEGIN;

\i studenci.sql

CREATE FUNCTION A(imie text) RETURNS text AS $$
--	#variable_conflict error
--	#variable_conflict use_variable
	#variable_conflict use_column
	BEGIN
		RETURN imie FROM studenci WHERE ocena = 5.0;
	END;
$$ LANGUAGE 'plpgsql';

SELECT A('Jan');

ROLLBACK;
