BEGIN;
DROP TABLE IF EXISTS test;
COMMIT;

BEGIN;
CREATE TABLE test(
    name VARCHAR(100)
);
COMMIT;


BEGIN;
SELECT * FROM test;
COMMIT;
