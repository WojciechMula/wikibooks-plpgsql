CREATE TABLE studenci (
    imie        text,
    nazwisko    text,
    ocena       numeric(2,1)
);

CREATE OR REPLACE FUNCTION wyniki_egzaminu() RETURNS SETOF studenci AS $$
    DECLARE
        stud    studenci%ROWTYPE;
    BEGIN
        stud.imie     := 'Max';
        stud.nazwisko := 'Debeściak';
        stud.ocena    := 6.0;
        RETURN NEXT stud;

        RETURN QUERY
            SELECT * FROM studenci ORDER BY nazwisko, imie;

        stud.imie     := 'Zero';
        stud.nazwisko := 'Niemożliwe';
        stud.ocena    := 2.0;
        RETURN NEXT stud;

        RETURN; -- koniec, można pominąć
    END;
$$ LANGUAGE 'plpgsql';

INSERT INTO studenci (imie, nazwisko, ocena) VALUES
    ('Jan', 'Kowalski', 4.5),
    ('Tomasz', 'Nowak', 3.0),
    ('Anna', 'Wysocka', 5.0),
    ('Katarzyna', 'Kot', 4.0)
;

SELECT * FROM wyniki_egzaminu();
