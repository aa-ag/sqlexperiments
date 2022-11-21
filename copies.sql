CREATE PROCEDURE copy_table(tbl text)
LANGUAGE SQL
AS $$
    CREATE TABLE tbl_backup AS
    TABLE tbl;
$$;