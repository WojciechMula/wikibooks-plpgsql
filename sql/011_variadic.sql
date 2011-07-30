CREATE OR REPLACE FUNCTION average(VARIADIC args real[]) RETURNS real AS $$
	BEGIN
		RAISE NOTICE 'liczba argumentów=% %', COALESCE(array_length(args, 1), 0), pg_typeof(args);
		RETURN AVG(args[i]) FROM generate_subscripts(args, 1) AS i;
	END;
$$ LANGUAGE 'plpgsql';
