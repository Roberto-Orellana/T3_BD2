/*
    @Autor: Jorge Orellana (jorellanar@unah.hn)
    @Version: 0.1.0
    @Fecha: 5/10/22
*/

CREATE TABLE Region(
    id NUMBER NOT NULL PRIMARY KEY,
    nombre VARCHAR(30)
);

INSERT INTO Region VALUES (1,'America del norte');
INSERT INTO Region VALUES (2,'America Central');
INSERT INTO Region VALUES (3,'America del sur');
INSERT INTO Region VALUES (4,'Europa');


CREATE OR REPLACE FUNCTION CREAR_REGION(reg IN VARCHAR2)
RETURN  NUMBER IS
    id_reg NUMBER;
BEGIN
    SELECT id INTO id_reg FROM Region ORDER BY id DESC FETCH FIRST 1 ROWS ONLY;
    id_reg := id_reg +1;
    INSERT INTO Region VALUES(id_reg,reg);
    RETURN id_reg;
END;

set serveroutput on
DECLARE
  Nombre_region VARCHAR2(30);
  Id_region NUMBER;
begin
 Nombre_region := 'Africa';
 Id_region := CREAR_REGION(Nombre_region);
 DBMS_OUTPUT.PUT_LINE('Nomnbre de nueva region codigo de nueva region: '||Nombre_region||' -- '||Id_region );
END;
 