CREATE TABLE studenci (
    imie        text,
    nazwisko    text,
    ocena       numeric(2,1)
);

TRUNCATE studenci;
INSERT INTO studenci (imie, nazwisko, ocena) VALUES
    ('Jan', 'Kowalski', 4.5),
    ('Tomasz', 'Nowak', 3.0),
    ('Anna', 'Wysocka', 5.0),
    ('Katarzyna', 'Kot', 4.0)
;

CREATE OR REPLACE FUNCTION kursor1() RETURNS SETOF text AS $$
	DECLARE
		c refcursor;
		t text;
	BEGIN
		OPEN c SCROLL FOR SELECT DISTINCT imie FROM studenci ORDER BY imie;

		FETCH c INTO t;
		RETURN NEXT t;

		FETCH LAST IN c INTO t;
		RETURN NEXT t;

		CLOSE c;
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM kursor1();

CREATE OR REPLACE FUNCTION kursor2() RETURNS SETOF text AS $$
	DECLARE
		c CURSOR FOR SELECT DISTINCT imie FROM studenci ORDER BY imie;
		t text;
	BEGIN
		FOR t IN C LOOP
			RETURN NEXT t;
		END LOOP;
	END;
$$ LANGUAGE plpgsql;

SELECT x::text FROM kursor2() AS x;
