SELECT * FROM testtable tt
WHERE NOT EXISTS (
    SELECT *
    FROM testcopy tc
    WHERE tc.id=tt.id
)

SELECT * FROM testcopy tc
WHERE NOT EXISTS (
    SELECT *
    FROM testtable tt
    WHERE tt.id=tc.id
)