TRUNCATE pracownicy;
CREATE TABLE pracownicy (
	imie		text,
	nazwisko	text,
	tajny		boolean
);

INSERT INTO pracownicy (imie, nazwisko, tajny) VALUES
	('Jan',    'Kowalski', false),
	('Tomasz', 'Nowak',    false),
	('Anna',   'Kot',      false),
	('James',  'Bond',     true)
;

CREATE FUNCTION lista_pracownikow() RETURNS TABLE(imie text, nazwisko text)
	LANGUAGE SQL
AS $$
	SELECT imie, nazwisko
	  FROM pracownicy
	 WHERE tajny = false;
$$
	SECURITY DEFINER
;

CREATE ROLE uzytkownik WITH LOGIN UNENCRYPTED PASSWORD '123';
REVOKE ALL PRIVILEGES ON TABLE pracownicy FROM uzytkownik;

SELECT current_user;
SELECT * FROM pracownicy;
SELECT * FROM lista_pracownikow();
