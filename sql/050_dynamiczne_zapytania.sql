CREATE OR REPLACE FUNCTION lista_liczb(tabela text, kolumna text, min integer) RETURNS SETOF integer AS $$
	DECLARE
		liczba integer;
	BEGIN
		FOR liczba IN EXECUTE
			'SELECT ' || quote_ident(kolumna) || ' FROM ' || tabela::regclass ||
			' WHERE ' || quote_ident(kolumna) || ' > $1' USING min
		LOOP
			RETURN NEXT liczba;
		END LOOP;
	END;
$$ LANGUAGE 'plpgsql' STABLE;

SELECT lista_liczb('pg_class', 'oid', 10000);
