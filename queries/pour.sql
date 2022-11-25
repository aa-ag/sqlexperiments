-- COPY testtable(name,phone,email,address,postalZip,region,country)
-- FROM '/Users/aaronaguerrevere/Documents/projects/sqlexperiments/fake_data_for_testing.csv' 
-- DELIMITER ','
-- ENCODING 'UTF8'
-- CSV HEADER;

CREATE TEMP TABLE temporary_table(
    id SERIAL PRIMARY KEY,
    name TEXT,
    phone TEXT,
    email TEXT, 
    address TEXT,
    postalZip TEXT,
    region TEXT,
    country TEXT
);

COPY temporary_table(name,phone,email,address,postalZip,region,country)
FROM '/Users/aaronaguerrevere/Documents/projects/sqlexperiments/fake_data_for_testing.csv' 
DELIMITER ','
CSV HEADER;

INSERT INTO testtable(id,name,phone,email,address,postalZip,region,country)
SELECT *
FROM temporary_table
ON CONFLICT DO NOTHING;