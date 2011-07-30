CREATE OR REPLACE FUNCTION deklaracje(a integer) RETURNS void AS $$
	DECLARE
		x	integer DEFAULT 1;	-- wartość początkowa
		y	integer := 5;		-- wartość początkowa
		z	integer := a;		-- wartość początkowa z argumentu

		w	integer NOT NULL := a;
		k	CONSTANT integer := 9;

	BEGIN
		w := NULL;	-- błąd czasu wykonywania! 'w' nie może być NULL
		k := 8;		-- błąd kompilacji! 'k' oznaczone jako wartość stała
	END;
$$ LANGUAGE 'plpgsql';
