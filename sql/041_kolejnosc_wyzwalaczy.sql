CREATE TABLE studenci (
    imie        text,
    nazwisko    text,
    ocena       numeric(2,1)
);

CREATE OR REPLACE FUNCTION wyzwalacz() RETURNS TRIGGER AS $$
	BEGIN
		RAISE NOTICE 'nazwa = %, kiedy = %, poziom = %', TG_NAME, TG_WHEN, TG_LEVEL;
		IF TG_LEVEL = 'ROW' THEN
			RAISE NOTICE E'\t\tdane = %', NEW;
		END IF;

		RETURN NEW;
	END;
$$ LANGUAGE 'plpgsql';

DROP TRIGGER t1 ON studenci;
DROP TRIGGER t2 ON studenci;
DROP TRIGGER t3 ON studenci;
DROP TRIGGER t4 ON studenci;

CREATE TRIGGER t1 BEFORE INSERT
	ON studenci 
	FOR EACH ROW
	EXECUTE PROCEDURE wyzwalacz();
	
CREATE TRIGGER t2 BEFORE INSERT
	ON studenci 
	FOR EACH STATEMENT
	EXECUTE PROCEDURE wyzwalacz();

CREATE TRIGGER t3 AFTER INSERT
	ON studenci 
	FOR EACH ROW
	EXECUTE PROCEDURE wyzwalacz();
	
CREATE TRIGGER t4 AFTER INSERT
	ON studenci 
	FOR EACH STATEMENT
	EXECUTE PROCEDURE wyzwalacz();

INSERT INTO studenci (imie, nazwisko, ocena) VALUES
    ('Jan', 'Kowalski', 4.5),
    ('Tomasz', 'Nowak', 3.0),
    ('Anna', 'Wysocka', 5.0),
    ('Katarzyna', 'Kot', 4.0)
;

