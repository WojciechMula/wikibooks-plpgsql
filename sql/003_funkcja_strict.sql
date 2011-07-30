CREATE OR REPLACE FUNCTION test_null1(x integer, y integer) RETURNS integer AS $$
	BEGIN
		RAISE NOTICE 'test_null1()';
		RETURN x + y;
	END
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION test_null2(x integer, y integer) RETURNS integer AS $$
	BEGIN
		RAISE NOTICE 'test_null2()';
		RETURN x + y;
	END
$$ LANGUAGE 'plpgsql'
   STRICT;
