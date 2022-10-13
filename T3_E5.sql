/*
    @Autor: Jorge Orellana (jorellanar@unah.hn)
    @Version: 0.1.0
    @Fecha: 5/10/22
*/

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE calculadora( opcion IN VARCHAR,num1 IN DECIMAL, num2 IN DECIMAL)
      IS
        resultado DECIMAL;
      BEGIN
        CASE opcion
        WHEN 'SUMA' THEN 
          resultado := num1+num2;
          DBMS_OUTPUT.PUT_LINE('La suma es: '||resultado);
        WHEN 'RESTA' THEN 
          resultado := num1-num2;
          DBMS_OUTPUT.PUT_LINE('La resta es: '|| resultado);
        WHEN 'MULTIPLICACION' THEN 
          resultado := num1*num2;
          DBMS_OUTPUT.PUT_LINE('La multiplicación es: '|| resultado); 
        WHEN 'DIVISION' THEN 
          resultado := num1/num2;
          DBMS_OUTPUT.PUT_LINE('La división es: '|| resultado);
       ELSE 
          DBMS_OUTPUT.PUT_LINE('La opción no esta disponible');
       END CASE;
       EXCEPTION 
           WHEN ZERO_DIVIDE THEN
           DBMS_OUTPUT.PUT_LINE('No se puede hacer división con ceros');
       
END calculadora;


/*Ejemplo de suma*/
EXECUTE calculadora('SUM',4,1);

/*Ejemplo al ingresar una opción inexistente*/
EXECUTE calculadora('SUM',4,1);

/*Ejemplo de excepcion al dividir con cero*/
EXECUTE calculadora('DIVISION',4,0);
      
 