{*******************************************************************
 M¢dulo: circulos
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 7/11/2003
 Descripci¢n: Unidad que contiene el tipo de datos puntos, y
              todas las operaciones que se pueden realizar con este
              tipo
 *******************************************************************}

UNIT circulos;

{**************************************************************************
**************************************************************************}

     INTERFACE

     USES puntos;
     {En esta parte van las cabeceras de los procedimientos, y los
     tipos de datos que vamos a utilizar}

     TYPE
         tCirculo= RECORD
               centro : tPunto;
               radio : real;
               END;
     {***** Operaciones constructoras-generadoras ****}

     PROCEDURE crearCirculo (punto:tPunto; r: real; VAR circulo:tCirculo);
     {Procedimiento que crea una variable de tipo circulo (que es un registro)
     a partir de una variable real y una de tipo punto (q es otro reg.)
     luego estamos creando un registro de registros}

     {**** Operaciones observadoras-selectoras ****}

     PROCEDURE centro (circulo:tCirculo; VAR punto:tPunto);
     {Procedimiento en que entra una variable de tipo circulo, y te
     devuelve su centro, que es de tipo punto}

     FUNCTION radio (circulo:tCirculo):real;
     {Funcion en que entra una variable de tipo circulo, y te devuelve
     su radio, que es una variable real}

     {**** Operaciones constructoras-no generadoras ****}

     { Este tipo de datos no lleva implementado ninguna
     funcion de este tipo...}


     {**** Operaciones observadoras-no selectoras ****}

     FUNCTION pertenece (punto: tPunto; circulo:tCirculo):boolean;
     {Funcion que recibe una variable de tipo punto y otra de
     tipo circulo, y nos devuelve una booleana; que ser  verdadera
     si el punto est  contenido dentro del area del circulo, y
     falsa en caso contrario}

{**************************************************************************
**************************************************************************}

     IMPLEMENTATION
     {A partir de aqu¡ va la implementacion en s¡ de los subprogramas
     que se anuncian en la cabecera}

     PROCEDURE crearCirculo (punto:tPunto; r: real; VAR circulo:tCirculo);
     BEGIN
          circulo.centro:=punto;
          circulo.radio:=r;
     END;

     PROCEDURE centro (circulo:tCirculo; VAR punto:tPunto);
     BEGIN
          punto.coord1:= ordenada(circulo.centro);
          punto.coord2:= abscisa(circulo.centro);
     END;

     FUNCTION radio (circulo:tCirculo):real;
     BEGIN
          radio:= circulo.radio;
     END;


     FUNCTION pertenece (punto: tPunto; circulo:tCirculo):boolean;
     VAR
     distAux:real;
     BEGIN
     distAux:= distancia(circulo.centro,punto);
               IF distAux< radio(circulo) THEN
                  pertenece:=true
               ELSE
                  pertenece:=false;
     END;


END.