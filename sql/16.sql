-- 1.
CREATE OR REPLACE FUNCTION zwierzaczki1(OUT gatunek text, OUT liczba integer) AS $$
	BEGIN
		gatunek	:= 'kotek';
		liczba	:= 3;
		RETURN;	-- mo¿na pomin±æ
	END;
$$ LANGUAGE 'plpgsql';

SELECT zwierzaczki1();
-- wynik: (kotek,3)

-- 2.
CREATE TYPE zwierzaczek_typ AS (gatunek text, liczba integer);

CREATE OR REPLACE FUNCTION zwierzaczki2(OUT zwierzaczek_typ) AS $$
	BEGIN
		$1.gatunek	:= 'kotek';
		$1.liczba	:= 3;
		RETURN;	-- mo¿na pomin±æ
	END;
$$ LANGUAGE 'plpgsql';

SELECT zwierzaczki2();
-- wynik: (kotek,3)

-- 3.
CREATE OR REPLACE FUNCTION zwierzaczki3() RETURNS zwierzaczek_typ AS $$
	DECLARE
		wynik	zwierzaczek_typ;
	BEGIN
		wynik.gatunek	:= 'kotek';
		wynik.liczba	:= 3;
		RETURN wynik;	-- MUSI wyst±piæ
	END;
$$ LANGUAGE 'plpgsql';

SELECT zwierzaczki3();
-- wynik: (kotek,3)
