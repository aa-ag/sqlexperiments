-- https://stackoverflow.com/questions/10705616/table-name-as-a-postgresql-function-parameter
CREATE PROCEDURE copy_tables()
LANGUAGE SQL
AS $$
    CREATE TABLE x_backup AS
    TABLE x_table;
$$;