CREATE OR REPLACE FUNCTION test_arg1(x integer, y integer = 5) RETURNS integer AS $$
	DECLARE
		result	integer NOT NULL DEFAULT 0;
	BEGIN
		result := x + y;
		RETURN result;
	END
$$ LANGUAGE 'plpgsql';
