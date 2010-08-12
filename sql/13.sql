CREATE OR REPLACE FUNCTION ile_argumentow(napis text, VARIADIC argumenty integer[]) RETURNS text AS $$
	BEGIN
		RETURN napis || ': ' || COALESCE(array_length(argumenty, 1), 0);
	END;
$$ LANGUAGE 'plpgsql';

-- 1
-- SELECT ile_argumentow('Liczba argument�w');

-- 2
SELECT ile_argumentow('Liczba argument�w', 1);

-- 3
SELECT ile_argumentow('Liczba argument�w', 1, 12, 51, 31, 111);

-- 4
-- SELECT ile_argumentow('Liczba argument�w', ARRAY[1, 2]);

-- 5
SELECT ile_argumentow('Liczba argument�w', VARIADIC ARRAY[1, 2]);
