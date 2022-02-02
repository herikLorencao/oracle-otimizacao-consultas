DROP TABLE TEST_RANDOM;
Create table test_random 
as 
select /*+ append */ * from test_normal WHERE ROWNUM <= 100000 order by dbms_random.random;
UPDATE TEST_RANDOM SET FAIXA = 'baixa' WHERE SAL >= 1000 AND SAL <= 3000;
UPDATE TEST_RANDOM SET FAIXA = 'media' WHERE SAL > 3000 AND SAL <= 6000;
UPDATE TEST_RANDOM SET FAIXA = 'alta' WHERE SAL > 6000 AND SAL <= 7000;
COMMIT;

Begin 
For i in 1000000..1000200
Loop 
Insert into TEST_RANDOM 
values(to_char(i), dbms_random.string('U',30), dbms_random.value(1000,7000), 'ND'); 
If mod(i, 10000) = 0 then 
Commit; 
End if; 
End loop; 
End; 
 
UPDATE TEST_RANDOM SET FAIXA = 'minimo' WHERE SAL >= 1000 AND SAL <= 2000;
UPDATE TEST_RANDOM SET FAIXA = 'baixo' WHERE SAL > 2000 AND SAL <= 4000;
UPDATE TEST_RANDOM SET FAIXA = 'media' WHERE SAL > 4000 AND SAL <= 6000;
UPDATE TEST_RANDOM SET FAIXA = 'alta' WHERE SAL > 6000 AND SAL <= 7000;

COMMIT;