/*
    @Autor: Jorge Orellana (jorellanar@unah.hn)
    @Version: 0.1.0
    @Fecha: 5/10/22
*/

CREATE TABLE Employe(
    Id NUMBER PRIMARY KEY NOT NULL,
    Nombre VARCHAR(30),
    Apellido VARCHAR(30),
    Salario DECIMAL(8,2)
);

INSERT INTO Employe VALUES(1,'Pedro','Picapiedra',20000.50);
INSERT INTO Employe VALUES(2,'Vilma','Picapiedra',19000.50);
INSERT INTO Employe VALUES(3,'Pablo','Marmol',18000.50);
INSERT INTO Employe VALUES(4,'Steven','King',30000.50);
INSERT INTO Employe VALUES(5,'Betty','Marmol',17000.50);


SET SERVEROUTPUT ON
DECLARE
    c_nombre Employe.nombre%type; 
    c_apellido Employe.apellido%type; 
    c_salario Employe.salario%type; 
    
     CURSOR C1 IS
        SELECT Employe.Nombre, Employe.Apellido,Employe.Salario FROM Employe;
BEGIN
    OPEN C1; 
   LOOP 
   FETCH C1 into c_nombre, c_apellido, c_salario; 
   IF (c_nombre = 'Steven' AND c_apellido = 'King') THEN 
      RAISE_APPLICATION_ERROR(-20100,'El salario de '|| c_nombre ||' '|| c_apellido||' '||'no se puede visualizar');
    END IF; 
   
   END LOOP; 
   CLOSE C1; 
END;
