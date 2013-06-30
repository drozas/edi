{*******************************************************************
 M¢dulo: elementoTAD
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 29/11/2003
 Descripci¢n: Unidad que contiene el tipo de datos elemento.
              Forma parte de la PRACTICA 6
 *******************************************************************}

UNIT elemTAD;

{**************************************************************************
**************************************************************************}

     INTERFACE

     USES rangoTAD;
     {En esta parte van las cabeceras de los procedimientos, y los
     tipos de datos que vamos a utilizar}

     TYPE
         tElemento= integer;
         tFuncionModificar= PROCEDURE (VAR elem:tElemento);
     {***** Operaciones constructoras-no generadora ****}

     PROCEDURE asignarElemento (el1: tElemento; VAR el2:tElemento);
     {PRE : cierto}
     {POST: asigna valor al elemento mediante funcion interna}

     PROCEDURE doble (VAR el2:tElemento);
     {PRE: cierto}
     {POST: duplica el valor del elemento mediante funcion interna}

     PROCEDURE triple (VAR el3:tElemento);
     {PRE: cierto}
     {POST: triplica el valor del elemento mediante funcion interna}
{**************************************************************************
**************************************************************************}

     IMPLEMENTATION
     {A partir de aqu¡ va la implementacion en s¡ de los subprogramas
     que se anuncian en la cabecera}

     PROCEDURE asignarElemento (el1:tElemento; VAR el2:tElemento);
     {Complejidad O(1)}
     BEGIN
          el2:=el1;
     END;

     PROCEDURE doble (VAR el2:tElemento);
     {Complejidad O(1)}
     BEGIN
          el2:=el2*2;
     END;

     PROCEDURE triple (VAR el3 :tElemento);
     {Complejidad O(1)}
     BEGIN
          el3:= el3*3;
     END;

END.