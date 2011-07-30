CREATE OR REPLACE FUNCTION test1() RETURNS void AS $$
    BEGIN
        DELETE FROM test where x % 2 = 0;
        DELETE FROM test;
    END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION test2() RETURNS void AS $$
    BEGIN
        DELETE FROM test where x % 2 = 0;
        RAISE 'wyjątek';
        DELETE FROM test;
    END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION test3() RETURNS void AS $$
    BEGIN
        DELETE FROM test where x % 2 = 0;

        <<rollback_to>>
        BEGIN
            DELETE FROM test;
            RAISE 'wyjątek';
        EXCEPTION
            WHEN OTHERS THEN
                -- zignorowanie wyjątku
                NULL;
        END;
    END;
$$ LANGUAGE 'plpgsql';


CREATE TABLE test (x integer);

TRUNCATE test;
INSERT INTO test (SELECT * FROM generate_series(1, 1000));
SELECT test1();
SELECT count(*) FROM test;

TRUNCATE test;
INSERT INTO test (SELECT * FROM generate_series(1, 1000));
SELECT test2();
SELECT count(*) FROM test;

TRUNCATE test;
INSERT INTO test (SELECT * FROM generate_series(1, 1000));
SELECT test3();
SELECT count(*) FROM test;
