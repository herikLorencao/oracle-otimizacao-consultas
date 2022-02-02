Create table test_normal (empno varchar2(10), ename varchar2(30), sal number(10), faixa varchar2(10)); 
 Begin 
 For i in 1..1000000 
 Loop 
 Insert into test_normal 
 values(to_char(i), dbms_random.string('U',30), dbms_random.value(1000,7000), 'ND'); 
 If mod(i, 10000) = 0 then 
 Commit; 
 End if; 
 End loop; 
 End; 
  / 
 Create table test_random 
 as 
 select /*+ append */ * from test_normal order by dbms_random.random; 