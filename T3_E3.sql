/*
    @Autor: Jorge Orellana (jorellanar@unah.hn)
    @Version: 0.1.0
    @Fecha: 5/10/22
*/


CREATE TABLE Departamento(
    Id NUMBER PRIMARY KEY NOT NULL,
    Nombre VARCHAR(30)
);

CREATE TABLE Empleado(
    DNI CHAR(15) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(30),
    Apellido VARCHAR(30),
    Num_dep NUMBER,
    
    FOREIGN KEY (Num_dep) REFERENCES Departamento(Id)
);

INSERT INTO Departamento VALUES(20,'Marketing');
INSERT INTO Departamento VALUES(30,'Desarrollo web');
INSERT INTO Departamento VALUES(40,'Desarrollo movil');

INSERT INTO Empleado VALUES('1010-1010-10101','Pablo','Marmol',30);
INSERT INTO Empleado VALUES('1011-1010-10101','Pedro','Picapiedra',30);
INSERT INTO Empleado VALUES('1014-1010-10101','Pedro2','Picapiedra2',30);
INSERT INTO Empleado VALUES('1012-1010-10101','Betty','Marmol',20);
INSERT INTO Empleado VALUES('1013-1010-10101','Vilma','Picapiedra',40);


DECLARE
    id_dep Departamento.Id%TYPE;
    CURSOR C1(id NUMBER) IS
        SELECT COUNT(Empleado.Num_dep) FROM Empleado WHERE Empleado.Num_dep = id;
BEGIN

    OPEN C1(30);
    LOOP
        FETCH C1 INTO id_dep;
        EXIT WHEN C1%notfound;
        dbms_output.put_line('El numero de empleados es: ' || id_dep);
    END LOOP;
    CLOSE C1;
END;
        
       