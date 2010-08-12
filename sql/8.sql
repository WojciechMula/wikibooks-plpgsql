CREATE OR REPLACE FUNCTION pairs(n integer, OUT x integer, OUT p real) RETURNS SETOF record AS $$
	BEGIN
		FOR i IN 1 .. n LOOP
			x := i;		-- przygotowanie
			p := random();	-- ... rekordu

			RETURN NEXT;	-- zwróæenie nastêpnego rekordu
		END LOOP;

		RETURN; -- koniec iterowania
	END
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION pairs(n integer, minp real) RETURNS TABLE(x integer, p real) AS $$
	BEGIN
		RETURN QUERY SELECT * FROM pairs(n) AS tab WHERE tab.p > minp;
	END
$$ LANGUAGE 'plpgsql';


