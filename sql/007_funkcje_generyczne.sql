CREATE OR REPLACE FUNCTION generic_swap(INOUT x anyelement, INOUT y anyelement) AS $$
	DECLARE
		t x%TYPE;
	BEGIN
		t := x;
		x := y;
		y := t;
	END
$$ LANGUAGE 'plpgsql';
