CREATE OR REPLACE FUNCTION incA(IN x integer) RETURNS integer AS $$
	BEGIN
		RETURN x + 1;
	END
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION incB(IN y integer, OUT y integer) AS $$
	BEGIN
		y := x + 1;
	END
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION incC(INOUT x integer) AS $$
	BEGIN
		x := x + 1;
	END
$$ LANGUAGE 'plpgsql';

