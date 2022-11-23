COPY testtable(name,phone,email,address,postalZip,region,country)
FROM '/Users/aaronaguerrevere/Documents/projects/sqlexperiments/fake_data_for_testing.csv'
DELIMITER ','
CSV HEADER;