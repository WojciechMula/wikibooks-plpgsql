CREATE TYPE xyz AS (x integer, y integer, z integer);

CREATE OR REPLACE FUNCTION xyz_as_integer(r xyz) RETURNS integer AS $$
	BEGIN
		RAISE NOTICE 'xyz_as_integer()';
		RETURN r.x + r.y + r.z;
	END
$$ LANGUAGE 'plpgsql';

DROP CAST (xyz AS integer);

CREATE CAST (xyz AS integer)
	WITH FUNCTION xyz_as_integer(xyz)
--	AS ASSIGNMENT
--	AS IMPLICIT
;
