SELECT table_name,table_catalog FROM information_schema.tables WHERE table_schema='public';

CREATE TABLE testcopy AS TABLE testtable;

SELECT * FROM information_schema.columns
WHERE table_schema = 'testdb'
AND table_name = 'testcopy';