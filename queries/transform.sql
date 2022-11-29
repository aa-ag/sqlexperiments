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
(SELECT id,UPPER(name),phone,email,
CONCAT(address,chr(10),postalZip,chr(10),region,chr(10),country) AS address
FROM testtable)

UPDATE teststaged
SET name = INITCAP(name)