CREATE OR REPLACE FUNCTION bar(text, char, inout integer, out text) AS $$
	<<blok_1>>
	DECLARE
		i integer := 1;
	BEGIN
		<<blok_1>>
		DECLARE
			i integer := 2;
		BEGIN
			RAISE NOTICE '% %', i, blok_1.i;
		END;

		<<blok_1>>
		DECLARE
			i integer := 3;
		BEGIN
			RAISE NOTICE '% %', i, blok_1.i;
		END;
	END blok_1;
$$ LANGUAGE 'plpgsql';

select bar('a', 'b', 1);
