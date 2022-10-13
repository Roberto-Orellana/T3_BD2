/*
    @Autor: Jorge Orellana (jorellanar@unah.hn)
    @Version: 0.1.0
    @Fecha: 5/10/22
*/

CREATE TABLE EMPLOYEES(
    EMPLOYEE_ID NUMBER(6,0) PRIMARY KEY, 
    FIRST_NAME VARCHAR2(20 BYTE), 
    LAST_NAME VARCHAR2(25 BYTE), 
    EMAIL VARCHAR2(25 BYTE), 
    PHONE_NUMBER VARCHAR2(20 BYTE), 
    HIRE_DATE DATE, 
    JOB_ID VARCHAR2(10 BYTE), 
    SALARY NUMBER(8,2), 
    COMMISSION_PCT NUMBER(4,2), 
    MANAGER_ID NUMBER(6,0), 
    DEPARTMENT_ID NUMBER(4,0)
 );

INSERT INTO EMPLOYEES VALUES(1,'Pedro1','Picapiedra1','pedrop1@unah.hn','1234-5678','1/05/2022','1234',20000,50,34,1);
INSERT INTO EMPLOYEES VALUES(2,'Pedro2','Picapiedra2','pedrop2@unah.hn','2234-5678','1/04/2022','2234',20000,50,34,2);
INSERT INTO EMPLOYEES VALUES(3,'Pedro3','Picapiedra3','pedrop3@unah.hn','3234-5678','1/03/2022','3234',20000,50,34,3);
INSERT INTO EMPLOYEES VALUES(4,'Pedro4','Picapiedra4','pedrop4@unah.hn','4234-5678','1/02/2022','4234',20000,50,34,4);


CREATE TABLE EMPLOYEES_COPIA(
    EMPLOYEE_ID NUMBER(6,0) PRIMARY KEY, 
    FIRST_NAME VARCHAR2(20 BYTE), 
    LAST_NAME VARCHAR2(25 BYTE), 
    EMAIL VARCHAR2(25 BYTE), 
    PHONE_NUMBER VARCHAR2(20 BYTE), 
    HIRE_DATE DATE, 
    JOB_ID VARCHAR2(10 BYTE), 
    SALARY NUMBER(8,2), 
    COMMISSION_PCT NUMBER(4,2), 
    MANAGER_ID NUMBER(6,0), 
    DEPARTMENT_ID NUMBER(4,0)
 ); 

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE insercion
    IS
    CURSOR C1 IS SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,
                        JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID,DEPARTMENT_ID 
                        FROM EMPLOYEES;
    id_ NUMBER;
    nombre1 VARCHAR2(40);
    nombre2 VARCHAR2(40);
    email VARCHAR2(40);
    num_tel VARCHAR2(40);
    hire_date DATE;
    job_id VARCHAR2(40);
    salario NUMBER;
    comision NUMBER;
    id_manager NUMBER;
    id_departamento NUMBER;
    
BEGIN
        OPEN C1;
            LOOP
                 FETCH C1 INTO id_,nombre1,nombre2,email,num_tel,hire_date,job_id,
                                salario,comision,id_manager,id_departamento;
                 INSERT INTO EMPLOYEES_COPIA VALUES(id_,nombre1,nombre2,email,
                 num_tel,hire_date,job_id,salario,comision,id_manager,id_departamento);
                 EXIT WHEN C1%NOTFOUND; 
            END LOOP;
        CLOSE C1;
END;
 
EXECUTE insercion;
 


 
 
 
 
 
 
 
 
 
 