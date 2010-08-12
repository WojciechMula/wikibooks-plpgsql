CREATE FUNCTION test(integer, integer) RETURNS text AS $$
	BEGIN
		RETURN CAST($1 + $2*4 AS text);
	END
$$ LANGUAGE 'plpgsql';
