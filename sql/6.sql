CREATE OR REPLACE FUNCTION swap(INOUT x integer, INOUT y integer) AS $$
	DECLARE
		t integer;
	BEGIN
		t := x;
		x := y;
		y := t;
	END
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION incA(IN x integer) RETURNS void AS $$
	DECLARE
	BEGIN
		x := x + 1;
	END
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION incB(OUT x integer) AS $$
	DECLARE
	BEGIN
		x := x + 1;
	END
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION incC(INOUT x integer) AS $$
	DECLARE
	BEGIN
		x := x + 1;
	END
$$ LANGUAGE 'plpgsql';

