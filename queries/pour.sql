-- first, duplicate a table, without any source data
CREATE TABLE testcopy
AS TABLE testtable
WITH NO DATA;