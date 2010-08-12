CREATE TYPE min_max_t AS (min integer, max integer);

CREATE OR REPLACE FUNCTION min_max_agg(state min_max_t, x integer, INOUT result min_max_t) AS $$
	BEGIN
		IF x > state.max THEN
			result.min := state.min;
			result.max := x;
		ELSIF x < state.min THEN
			result.min := x;
			result.max := state.max;
		END IF;
	END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION min_max_distance(x min_max_t) RETURNS integer AS $$
	BEGIN
		RETURN x.max - x.min;
	END;
$$ LANGUAGE 'plpgsql';

DROP AGGREGATE min_max(integer);
CREATE AGGREGATE min_max(integer) (
	SFUNC = min_max_agg,
	STYPE = min_max_t,
	INITCOND = '(0,0)'
);

DROP AGGREGATE distance(integer);
CREATE AGGREGATE distance(integer) (
	SFUNC = min_max_agg,
	STYPE = min_max_t,
	FINALFUNC = min_max_distance,
	INITCOND = '(0,0)'
);
