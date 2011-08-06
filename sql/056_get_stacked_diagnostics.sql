CREATE OR REPLACE FUNCTION funkcja_a() RETURNS void AS $$
    BEGIN
        RAISE 'Błąd' USING DETAIL = 'Szczegóły', HINT = 'Podpowiedź';
    END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION funkcja_b() RETURNS void AS $$
    BEGIN
        PERFORM funkcja_a();
    END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION test() RETURNS text AS $$
    BEGIN
        PERFORM funkcja_b();
        RETURN 'ok';
    EXCEPTION
        WHEN OTHERS THEN
            DECLARE
                state   text;
                msg     text;
                detail  text;
                hint    text;
                context text;
            BEGIN
                GET STACKED DIAGNOSTICS
                    state   = RETURNED_SQLSTATE,
                    msg     = MESSAGE_TEXT,
                    detail  = PG_EXCEPTION_DETAIL,
                    hint    = PG_EXCEPTION_HINT,
                    context = PG_EXCEPTION_CONTEXT;

                RETURN 'RETURNED_SQLSTATE = '    || state  || E'\n' ||
                       'MESSAGE_TEXT = '         || msg    || E'\n' ||
                       'PG_EXCEPTION_DETAIL = '  || detail || E'\n' ||
                       'PG_EXCEPTION_HINT = '    || hint   || E'\n' ||
                      E'PG_EXCEPTION_CONTEXT = \n' || context;
            END;
    END;
$$ LANGUAGE 'plpgsql';

SELECT test();
