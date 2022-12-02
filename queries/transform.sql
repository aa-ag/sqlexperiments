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

UPDATE teststaged
SET name = INITCAP(name)

SELECT REGEXP_REPLACE(phone,'[^0-9]+','','g') FROM testtable;
SELECT * FROM testtable WHERE phone ILIKE '1-%';
SELECT REGEXP_REPLACE(SUBSTR(phone, 3),'[^0-9]+','','g') FROM testtable WHERE phone ILIKE '1-%';

SELECT REGEXP_REPLACE(
    REGEXP_REPLACE(
        SUBSTR(phone, 3),'[^0-9]+','','g'
    ),
    '(\d{3})(\d{3})(\d{4})', '(\1) \2-\3'
) clean_phone FROM testtable
WHERE phone ILIKE '1-%';

UPDATE testtable
SET phone = REGEXP_REPLACE(
    REGEXP_REPLACE(
        SUBSTR(phone, 3),'[^0-9]+','','g'
    ),
    '(\d{3})(\d{3})(\d{4})', '(\1) \2-\3'
) WHERE phone ILIKE '1-%';

INSERT INTO teststaged (
    SELECT
        id,
        INITCAP(name),
        phone,
        email,
        CONCAT(address,chr(10),postalZip,chr(10),region,chr(10),country) AS address
    FROM testtable
)