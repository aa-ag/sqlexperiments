\copy (SELECT * FROM teststaged) TO 'staged.csv' (FORMAT CSV, DELIMITER ',', HEADER ENCODING 'UTF-8');