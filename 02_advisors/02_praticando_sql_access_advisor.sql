alter session set "_ORACLE_SCRIPT"=true;

CREATE USER userexample IDENTIFIED BY userexample;

GRANT DBA TO userexample;

CONNECT userexample/userexample;

CREATE TABLE TB AS SELECT * FROM ALL_OBJECTS;

SELECT DISTINCT OBJECT_ID FROM TB;

EXECUTE DBMS_ADVISOR.QUICK_TUNE(DBMS_ADVISOR.SQLACCESS_ADVISOR, 'TASK1', 'SELECT DISTINCT OBJECT_ID FROM TB');

SELECT * FROM USER_ADVISOR_ACTIONS;

CREATE DIRECTORY TUNE_SCRIPTS AS 'C:\tmp_oracle';

EXECUTE DBMS_ADVISOR.CREATE_FILE(DBMS_ADVISOR.GET_TASK_SCRIPT('TASK1'),'TUNE_SCRIPTS','TUNE.SQL');