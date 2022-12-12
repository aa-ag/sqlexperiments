-- CREATE DATABASE testdb OWNER aaronaguerrevere ENCODING UTF8;
CREATE TABLE IF NOT EXISTS teststaged(
    id SERIAL PRIMARY KEY,
    name TEXT,
    phone TEXT,
    email TEXT, 
    address TEXT,
    custom_fields JSONB
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

ALTER TABLE teststaged DROP COLUMN postalZip;
ALTER TABLE teststaged DROP region,DROP country;

SELECT email, COUNT(*)
FROM teststaged
GROUP BY email
HAVING COUNT(*) > 1;

SELECT * 
FROM (
    SELECT *,COUNT(1)
    OVER (PARTITION BY email) AS isthere
    FROM teststaged
) as t
WHERE isthere > 1;

SELECT * 
FROM teststaged
WHERE id IN (
    SELECT id
    FROM (
        SELECT 
            id, 
            ROW_NUMBER() OVER(
                PARTITION BY email ORDER BY id
            ) r
        FROM teststaged
    ) t 
    WHERE t.r < 1
);

SELECT id
FROM teststaged a
JOIN teststaged b
ON a.email=b.email
WHERE a.id > b.id
AND a.email=b.email;

UPDATE teststaged
SET email = CONCAT(email,'2')
WHERE id IN (
    SELECT a.id
    FROM teststaged a
    JOIN teststaged b
    ON a.email=b.email
    WHERE a.id > b.id
    AND a.email=b.email
);

SELECT
    SUBSTR(trans_date,1,7) as month,
    country,
    COUNT(*) as trans_count,
    SUM(CASE WHEN state="approved" THEN 1 ELSE 0 END) as approved_count,
    SUM(amount) as trans_total_amount,
    SUM(CASE WHEN state="approved" THEN amount ELSE 0 END) as approved_total_amount
FROM Transactions
GROUP BY month,country;

SELECT RTRIM(
    REGEXP_REPLACE(
        custom_fields::text,
        '[\\n]+',
        ' ',
        'g'
    )
    , ' "}]') || '"}]' custom_fields
FROM testcopy;

-- GET DATA FROM COPY TO STAGE
INSERT INTO teststaged (
    SELECT
        id,
        INITCAP(name),
        CASE
            WHEN phone ILIKE '1-%' THEN REGEXP_REPLACE(
                REGEXP_REPLACE(
                    SUBSTR(phone, 3),'[^0-9]+','','g'),
                '(\d{3})(\d{3})(\d{4})', '(\1) \2-\3')
            ELSE phone
        END,
        email,
        CONCAT(address,chr(10),postalZip,chr(10),region,chr(10),country) AS address,
        (RTRIM(REGEXP_REPLACE(custom_fields::text,'[\\n]+',' ','g'), ' "}]') || '"}]')::JSONB
    FROM testtable
);
-- GET DATA FROM COPY TO STAGE