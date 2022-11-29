-- CREATE DATABASE testdb OWNER aaronaguerrevere ENCODING UTF8;
CREATE TABLE IF NOT EXISTS teststaged(
    id SERIAL PRIMARY KEY,
    name TEXT,
    phone TEXT,
    email TEXT, 
    address TEXT,
    postalZip TEXT,
    region TEXT,
    country TEXT
);

INSERT INTO teststaged 
(SELECT id,UPPER(name) FROM testtable)

UPDATE teststaged
SET name = INITCAP(name)