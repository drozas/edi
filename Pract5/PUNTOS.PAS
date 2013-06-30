{*******************************************************************
 M¢dulo: puntos
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 7/11/2003
 Descripci¢n: Unidad que contiene el tipo de datos puntos, y
              todas las operaciones que se pueden realizar con este
              tipo
 *******************************************************************}

UNIT puntos;

{**************************************************************************
**************************************************************************}

     INTERFACE
     {En esta parte van las cabeceras de los procedimientos, y los
     tipos de datos que vamos a utilizar}

     TYPE
         tPunto= RECORD
               coord1 : real;
               coord2 : real;
               END;
     {***** Operaciones constructoras-generadoras ****}

     PROCEDURE crearPunto (coord1,coord2 :real; VAR punto :tPunto);
     {La entrada son dos numeros reales; y devuelve la variable
     tipo punto; que se implementa a traves de un registro}

     {**** Operaciones observadoras-selectoras ****}

     FUNCTION abscisa (punto:tPunto):real;
     {La entrada es una variable de tipo punto; y devuelve su
     abscisa; es decir su primera coordenada; que es un real}

     FUNCTION ordenada (punto:tPunto):real;
     {La entrada es una variable de tipo punto; y devuelve su
     ordenada; es decir su segunda coordenada; que es un real}

     {**** Operaciones constructoras-no generadoras ****}

     FUNCTION distancia(punto1,punto2: tPunto):real;
     {La entrada son dos variables de tipo punto; y devuelve
     la distancia que hay entre ellos, que es un real}

     FUNCTION coordenadasEnteras (punto: tPunto):boolean;
     {La entrada es una variable de tipo punto; y devuelve
     un booleano que ¨¨¨se hace true si las dos son positivas???} {--->duda}

     {**** Operaciones observadoras-no selectoras ****}

     PROCEDURE origen (VAR punto:tPunto);
     {La entrada ¨¨¨¨¨¨es un punto?????; y devuelve el punto
     de origen (el de coordenadas 0,0} {-------> duda}

{**************************************************************************
**************************************************************************}

     IMPLEMENTATION
     {A partir de aqu¡ va la implementacion en s¡ de los subprogramas
     que se anuncian en la cabecera}

     PROCEDURE crearPunto (coord1,coord2 :real; VAR punto :tPunto);
     BEGIN
          punto.coord1:=coord1;
          punto.coord2:=coord2;
     END;

     FUNCTION abscisa (punto:tPunto):real;
     BEGIN
          abscisa:=punto.coord1;
     END;

     FUNCTION ordenada (punto:tPunto):real;
     BEGIN
          ordenada:=punto.coord2;
     END;

     FUNCTION distancia(punto1,punto2: tPunto):real;
     VAR
     distAux:real;
     BEGIN
          distAux:= sqr(abscisa(punto1)-abscisa(punto2));
          distAux:= distAux + sqr(ordenada(punto1)-ordenada(punto2));
          distancia:= sqrt(distAux);
     END;

     FUNCTION coordenadasEnteras (punto: tPunto):boolean;
     BEGIN
          IF (abscisa(punto) >=0) AND (ordenada(punto)>=0) THEN
             coordenadasEnteras:=true
          ELSE
             coordenadasEnteras:=false;

     END;

     PROCEDURE origen (VAR punto:tPunto);
     BEGIN
          punto.coord1:=0;
          punto.coord2:=0;
     END;

END.