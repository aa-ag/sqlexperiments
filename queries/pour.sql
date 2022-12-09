-- COPY testtable(name,phone,email,address,postalZip,region,country)
-- FROM '/Users/aaronaguerrevere/Documents/projects/sqlexperiments/fake_data_for_testing.csv' 
-- DELIMITER ','
-- ENCODING 'UTF8'
-- CSV HEADER;

-- first, create a temporary table identical to the table you'll pour data into
CREATE TEMP TABLE temporary_table(
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

-- second, copy data from the csv to said temporary table
COPY temporary_table(name,phone,email,address,postalZip,region,country,custom_fields)
-- FROM '/Users/aaronaguerrevere/Documents/projects/sqlexperiments/fake_data_for_testing.csv' 
FROM '/Users/aaronaguerrevere/Documents/projects/sqlexperiments/copy.csv'
DELIMITER ','
CSV HEADER;

-- third, and last, insert/upsert the data copied into the temporary table into your target table
-- query does nothing on conflicting rows, which means no dupes are created at insert
INSERT INTO testtable(id,name,phone,email,address,postalZip,region,country,custom_fields)
SELECT *
FROM temporary_table
ON CONFLICT DO NOTHING;