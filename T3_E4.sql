/*
    @Autor: Jorge Orellana (jorellanar@unah.hn)
    @Version: 0.1.0
    @Fecha: 5/10/22
*/


SET SERVEROUT ON
DECLARE
    CURSOR C1 IS
        SELECT ID,SALARIO FROM EMPLOYE;
        C1_sal EMPLOYE.SALARIO%TYPE;
        C1_id EMPLOYE.ID%TYPE;
BEGIN
    OPEN C1;
        LOOP
            FETCH C1 INTO C1_id,C1_sal;
                IF C1_sal >8000 THEN
                    UPDATE EMPLOYE SET SALARIO = (C1_sal+((C1_sal*2)/100)) WHERE ID = C1_id;
                ELSIF C1_sal < 800 THEN
                    UPDATE EMPLOYE SET SALARIO = (C1_sal+((C1_sal*3)/100)) WHERE ID = C1_id;
                END IF;
            EXIT WHEN C1%NOTFOUND;
        END LOOP;
    CLOSE C1;
END;
