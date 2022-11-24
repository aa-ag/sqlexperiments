SELECT table_name,table_catalog FROM information_schema.tables WHERE table_schema='public';

CREATE TABLE testcopy AS TABLE testtable;

\x

\d+ testcopy

INSERT INTO testcopy 
(id,name,phone,email,address,postalZip,region,country)
    SELECT *
    FROM testtable
    WHERE NOT EXISTS(
        SELECT *
        FROM testcopy
        WHERE testcopy.email=testtable.email);