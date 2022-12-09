SELECT table_name,table_catalog FROM information_schema.tables WHERE table_schema='public';

-- CREATE TABLE testcopy AS TABLE testtable;
CREATE TABLE IF NOT EXISTS testcopy(
    id SERIAL PRIMARY KEY,
    name TEXT,
    phone TEXT,
    email TEXT, 
    address TEXT,
    postalZip TEXT,
    region TEXT,
    country TEXT,
    custom_fields JSONB
);

\x

\d+ testcopy

INSERT INTO testcopy 
(id,name,phone,email,address,postalZip,region,country)
    SELECT *
    FROM testtable
    WHERE NOT EXISTS(
        SELECT *
        FROM testcopy);


INSERT INTO testcopy 
(SELECT * FROM testtable tt
WHERE NOT EXISTS (
    SELECT *
    FROM testcopy tc
    WHERE tc.id=tt.id
))