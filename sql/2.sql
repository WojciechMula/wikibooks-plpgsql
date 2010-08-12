CREATE OR REPLACE FUNCTION test_immutable() RETURNS integer AS $$
	BEGIN
		RAISE NOTICE 'test_immutable()';
		RETURN 5;
	END
$$ LANGUAGE 'plpgsql'
   IMMUTABLE;

CREATE OR REPLACE FUNCTION test_stable() RETURNS integer AS $$
	BEGIN
		RAISE NOTICE 'test_stable()';
		RETURN 5;
	END
$$ LANGUAGE 'plpgsql'
   STABLE;

-- 1
SELECT i FROM generate_series(1, 10) g(i) WHERE i > test_immutable();

-- 2
SELECT i FROM generate_series(1, 10) g(i) WHERE i > test_stable();
