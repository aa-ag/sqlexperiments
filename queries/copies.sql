SELECT table_name,table_catalog FROM information_schema.tables WHERE table_schema='public';

CREATE TABLE testcopy AS TABLE testtable;

\x

\d+ testcopy

INSERT INTO testcopy SELECT * FROM testtable;