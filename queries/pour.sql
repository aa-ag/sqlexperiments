-- first, duplicate a table, without any source data
CREATE TABLE testcopy
AS TABLE testtable
WITH NO DATA;
-- second, create a temporary table with the original source data
COPY testcopy(name,phone,email,address,postalZip,region,country)
FROM '/Users/aaronaguerrevere/Documents/projects/sqlexperiments/fake_data_for_testing.csv'