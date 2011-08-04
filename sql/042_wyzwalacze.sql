create table dokumenty (
	uzytkownik text,
	czas_utworzenia timestamp without time zone,
	czas_aktualizacji timestamp without time zone,
	tytul text,
	zewnetrzny_id integer
);

CREATE OR REPLACE FUNCTION autor_czas() RETURNS TRIGGER AS $$
    BEGIN
        NEW.uzytkownik := current_user;

        IF TG_OP = 'INSERT' THEN
            NEW.czas_utworzenia := now();
        ELSIF TG_OP = 'UPDATE' THEN
            NEW.czas_aktualizacji := now();
        ELSE
            -- na wypadek przypadkowego użycia procedury
            -- w nieprzewidziany sposób
            RAISE 'Nie wiadomo co zrobić podczas operacji %', TG_OP;
        END IF;

        -- ok, zwracamy nowy rekord
        RETURN NEW;
    END;
$$ LANGUAGE 'plpgsql';

/*
CREATE TRIGGER uzupelnienie_danych
BEFORE UPDATE OR INSERT
    ON dokumenty
   FOR EACH ROW
EXECUTE PROCEDURE autor_czas();
*/

/*
insert into dokumenty (tytul) values ('Pan Tadeusz');
update dokumenty set tytul='Lalka';

CREATE TABLE spamerzy (
	nazwa	text
);

CREATE OR REPLACE FUNCTION czarna_lista() RETURNS TRIGGER AS $$
    BEGIN
        IF EXISTS(SELECT 1 FROM spamerzy WHERE nazwa = NEW.uzytkownik) THEN
            RETURN NULL;
        ELSE
            RETURN NEW;
		END IF;
    END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER bez_spamu
BEFORE UPDATE OR INSERT
    ON dokumenty
   FOR EACH ROW
EXECUTE PROCEDURE czarna_lista();

INSERT INTO spamerzy VALUES
	('Tanio!');

INSERT INTO dokumenty (tytul, uzytkownik) VALUES
	('Pan Tadeusz', 'Jaś'),
	('Taniej nie można! Kup teraz!!11', 'Tanio!');
*/

TRUNCATE dokumenty;

CREATE OR REPLACE FUNCTION zabezpieczenie() RETURNS TRIGGER AS $$
    BEGIN
        IF OLD.zewnetrzny_id <> NEW.zewnetrzny_id THEN
            RAISE 'Zmiana ID zewnętrznego rekordu spowoduje problemy!';
        END IF;

		RETURN NULL;
    END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER trig1
 AFTER UPDATE
    ON dokumenty
   FOR EACH ROW
EXECUTE PROCEDURE zabezpieczenie();

INSERT INTO dokumenty (tytul, zewnetrzny_id) VALUES
	('Pan Tadeusz', 120950),
	('Lalka', 100950);

UPDATE dokumenty SET
	zewnetrzny_id = CASE WHEN tytul='Pan Tadeusz!' THEN -1 ELSE zewnetrzny_id END;
