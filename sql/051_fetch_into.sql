CREATE OR REPLACE FUNCTION fetch_into() RETURNS VOID AS $$
	DECLARE
		kursor	REFCURSOR;
		ocena1	numeric;
		ocena2	numeric;

		napis1	text;
		napis2	text;
	BEGIN
		OPEN kursor FOR SELECT ocena FROM studenci ORDER BY nazwisko, imie;

		FETCH FIRST FROM kursor INTO ocena1;
		FETCH LAST FROM kursor INTO ocena2;

		CLOSE kursor;


		OPEN kursor FOR SELECT imie, nazwisko FROM studenci ORDER BY nazwisko;

		MOVE NEXT FROM kursor;
		FETCH FROM kursor INTO napis1, napis2;

		CLOSE kursor;

		RAISE NOTICE '%, %', ocena1, ocena2;
		RAISE NOTICE '%, %', napis1, napis2;
	END;
$$ LANGUAGE 'plpgsql';

SELECT fetch_into();
