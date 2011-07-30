CREATE OR REPLACE FUNCTION domyslne(a text, b text = 'DRUGI', c text = 'TRZECI') RETURNS text AS $$
	BEGIN
		RETURN 'domyslne("' || a || '", "' || b || '", "' || c || '")';
	END;
$$ LANGUAGE 'plpgsql';

SELECT domyslne('pierwszy');
-- wynik: domyslne("pierwszy", "DRUGI", "TRZECI")

SELECT domyslne('pierwszy', 'drugi');
-- wynik: domyslne("pierwszy", "drugi", "TRZECI")

SELECT domyslne('pierwszy', 'trzeci');
-- wynik: domyslne("pierwszy", "trzeci", "TRZECI")

