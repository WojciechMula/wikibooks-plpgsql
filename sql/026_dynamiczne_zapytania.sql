CREATE OR REPLACE FUNCTION dynamiczne_zapytania(tabela text, kolumna text, wartosc integer) RETURNS integer AS $$
    DECLARE
        wynik   integer;
    BEGIN
        EXECUTE 'SELECT ' || quote_ident(kolumna) ||
                 ' FROM ' || quote_ident(tabela) ||
                ' WHERE ' || quote_ident(kolumna) || '=' || quote_nullable(wartosc)
        INTO wynik;

        RETURN wynik;
    END;
$$ LANGUAGE 'plpgsql';

