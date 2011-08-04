CREATE OR REPLACE FUNCTION kursor() RETURNS VOID AS $$
	DECLARE
		kursor	REFCURSOR;
	BEGIN
        RAISE NOTICE 'nazwa = %', kursor;
        kursor := 'wyniki';
		OPEN kursor FOR SELECT ocena FROM studenci ORDER BY nazwisko, imie;
        RAISE NOTICE 'nazwa = %', kursor;
        RAISE NOTICE 'nazwa = %', kursor;
        CLOSE kursor;
	END;
$$ LANGUAGE 'plpgsql';

SELECT kursor();
