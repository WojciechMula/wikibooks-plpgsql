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
