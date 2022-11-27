-- CREATE DATABASE testdb OWNER aaronaguerrevere ENCODING UTF8;
CREATE TABLE IF NOT EXISTS testtable(
    id SERIAL PRIMARY KEY,
    name TEXT,
    phone TEXT,
    email TEXT, 
    address TEXT,
    postalZip TEXT,
    region TEXT,
    country TEXT
);