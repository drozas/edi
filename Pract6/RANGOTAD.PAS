{*******************************************************************
 M¢dulo: circulos
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 29/11/2003
 Descripci¢n: Unidad que contiene el tipo de datos rango, y
              todas las operaciones que se pueden realizar con este
              tipo.
              Forma parte de la PRµCTICA 6.
 *******************************************************************}

UNIT RangoTAD;


{**************************************************************************
**************************************************************************}

     INTERFACE

     CONST
     INICIO=1;
     FIN=25;

     {En esta parte van las cabeceras de los procedimientos, y los
     tipos de datos que vamos a utilizar}

     TYPE
         tRango= INICIO..FIN;


     { **** Operaciones observadoras-selectoras ****}
     FUNCTION primero: tRango;
     FUNCTION ultimo: tRango;


     IMPLEMENTATION

     FUNCTION primero:tRango;
     BEGIN
          primero:=INICIO;
     END;

     FUNCTION ultimo: tRango;
     BEGIN
          ultimo:=FIN;
     END;

END.

