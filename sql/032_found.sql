CREATE OR REPLACE FUNCTION dodaj_lub_zaktualizuj(id integer, text, text, int)
RETURNS void AS $$
	BEGIN
		UPDATE osoby SET
			imie = $2,
			nazwisko = $3,
			wiek = $4
		WHERE
			osoby.id = $1
		;

		IF NOT FOUND THEN
			INSERT INTO osoby VALUES (id, $2, $3, $4);
		END IF;
	END;
$$ LANGUAGE plpgsql;
