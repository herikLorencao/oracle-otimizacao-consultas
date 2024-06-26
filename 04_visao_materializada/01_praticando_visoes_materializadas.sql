SELECT * FROM TEST_RANDOM;

SELECT FAIXA, COUNT(*) AS NUM_FUNC, SUM(SAL) AS SOMA_SALARIO FROM TEST_RANDOM GROUP BY FAIXA;

CREATE MATERIALIZED VIEW LOG ON TEST_RANDOM WITH ROWID, SEQUENCE (FAIXA, SAL) INCLUDING NEW VALUES;

CREATE MATERIALIZED VIEW TEST_RANDOM_SUM REFRESH ON COMMIT ENABLE QUERY REWRITE AS
SELECT FAIXA, COUNT(*) AS NUM_FUNC, SUM(SAL) AS SOMA_SALARIO FROM TEST_RANDOM GROUP BY FAIXA;