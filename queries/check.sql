SELECT * FROM testcopy tc
WHERE NOT EXISTS (
    SELECT *
    FROM testtable tt
    WHERE tt.id=tc.id
)