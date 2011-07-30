CREATE TABLE osoby (imie text, nazwisko text, wiek integer);
CREATE TABLE zwierzatka (gatunek text, imie text, kolor text);

CREATE FUNCTION test_record() RETURNS void AS $$
	DECLARE
		r	record;
	BEGIN
		-- r jest nieokre¶lony

		SELECT INTO r * FROM osoby;
		-- r udostêpnia teraz pola imie, nazwisko, wiek
		RAISE NOTICE 'imiê=%, nazwisko=%, wiek=%', r.imie, r.nazwisko, r.wiek;

		SELECT INTO r * FROM zwierzatka;
		-- r udostêpnia teraz gatunek, imie, kolor
		RAISE NOTICE 'gatunek=%, imie=%, kolor=%', r.gatunek, r.imie, r.kolor;
	END
$$ LANGUAGE 'plpgsql';
