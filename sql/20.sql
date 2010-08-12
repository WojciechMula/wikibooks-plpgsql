CREATE OR REPLACE FUNCTION zakresy() RETURNS void AS $$
	DECLARE
		tekst	text := 'tekst';
	BEGIN
		RAISE NOTICE 'tekst=%', tekst;
		
		DECLARE
			tekst	text := 'zagnie¿d¿ony';
		BEGIN
			RAISE NOTICE 'tekst=%', tekst;
		END;

		RAISE NOTICE 'tekst=%', tekst;
	END
$$ LANGUAGE 'plpgsql';

SELECT zakresy();
