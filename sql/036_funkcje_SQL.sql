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

CREATE OR REPLACE FUNCTION srednia_ocen(text, numeric) RETURNS numeric
	LANGUAGE SQL AS
$$
	SELECT AVG(ocena) FROM studenci
	 WHERE nazwisko LIKE $1
	   AND ocena >= $2;
$$;

CREATE OR REPLACE FUNCTION test1() RETURNS SETOF studenci
	LANGUAGE SQL AS
$$
	-- aktualizacja wierszy
	UPDATE studenci SET nazwisko = upper(nazwisko);
	-- wynik zapytania
	SELECT * FROM studenci ORDER BY nazwisko, ocena;
$$;

CREATE OR REPLACE FUNCTION test2() RETURNS studenci
	LANGUAGE SQL AS
$$
	-- wynik zapytania - tylko jeden wiersz
	SELECT * FROM studenci ORDER BY nazwisko, ocena;
$$;

CREATE OR REPLACE FUNCTION test3() RETURNS SETOF studenci
	LANGUAGE SQL AS
$$
	-- wynik zapytania
	UPDATE studenci SET nazwisko = upper(nazwisko)
		RETURNING *;
$$;

SELECT test1();
SELECT test2();
SELECT test3();
