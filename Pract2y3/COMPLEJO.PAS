{*******************************************************************
 M¢dulo: complejo
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 7/11/2003
 Descripci¢n: Unidad que contiene el tipo de datos complejos, y
              todas las operaciones que se pueden realizar con este
              tipo
 *******************************************************************}

UNIT complejo;
     INTERFACE
     {En esta parte van las cabeceras de los procedimientos, y los
     tipos de datos que vamos a utilizar}
     TYPE
         tComplejo= RECORD
               parteReal : real;
               parteImaginaria: real;
               END;
     {Operaciones constructoras-generadoras}
     PROCEDURE CrearComplejo (pReal,pImaginaria: real; VAR num: tComplejo);

     {Operaciones observadoras-selectoras}
     FUNCTION ParteReal (VAR num1: tComplejo): real;
     FUNCTION ParteImaginaria (VAR num2: tComplejo):real;


     {Operaciones constructoras-no generadoras}
     PROCEDURE SumarComplejo (VAR num1,num2, res: tComplejo);
     PROCEDURE RestarComplejo (VAR num1, num2, res:tComplejo);
     PROCEDURE ProductoComplejo (VAR num1,num2, res:tComplejo);
     PROCEDURE DivisionComplejo (VAR num1,num2, res: tComplejo; VAR error :boolean);

     {Operaciones observadoras-no selectoras}
     PROCEDURE ModuloComplejo (VAR num1: tComplejo; VAR res: real);
     PROCEDURE ConjugadoComplejo (VAR num1: tComplejo);

     IMPLEMENTATION

     PROCEDURE CrearComplejo (pReal,pImaginaria: real; VAR num: tComplejo);
{Procedimiento que recoje los valores del numero complejo}
BEGIN
     num.parteReal:= pReal;
     num.parteImaginaria:= pImaginaria;
END;{CrearComplejo}


PROCEDURE SumarComplejo (VAR num1,num2, res: tComplejo);
{Procedimiento que suma dos numeros complejos, y mete el resultado en la
variable res}
BEGIN
     res.parteReal:=num1.parteReal + num2.parteReal;
     res.parteImaginaria:= num1.parteImaginaria + num2.parteImaginaria;
END;

PROCEDURE RestarComplejo (VAR num1, num2, res:tComplejo);
{Procedimiento que resta dos numeros complejos, y mete el resultado en la
variable res}
BEGIN
     res.parteReal:= num1.parteReal - num2.parteReal;
     res.parteImaginaria:= num1.parteReal -num2.parteImaginaria;
END;

PROCEDURE ProductoComplejo (VAR num1,num2, res:tComplejo);
{Procedimiento que calcula el producto de dos numeros complejos en la
variable res}
BEGIN
     res.parteReal:= (num1.parteReal * num2.parteReal) - (num1.parteImaginaria * num2.parteImaginaria);
     res.parteImaginaria:= (num1.parteImaginaria * num2.parteReal) + (num2.parteReal * num1.parteImaginaria);
END;

PROCEDURE DivisionComplejo (VAR num1,num2, res: tComplejo; VAR error :boolean);
{Procedimiento que calcula la division de dos numeros complejos en
la variable res}
VAR
controlador:real;
BEGIN
     controlador:= sqr(num2.parteReal) + sqr(num2.parteImaginaria);
     IF controlador<>0 THEN
     BEGIN
     res.parteReal:= ((num1.parteReal*num2.parteReal) + (num1.parteImaginaria * num2.parteImaginaria) ) /
     (sqr(num1.parteReal) + sqr(num2.parteReal) );
     res.parteImaginaria:= ((num1.parteImaginaria * num2.parteReal) - (num1.parteReal * num2.parteImaginaria) ) /
      ( sqr(num2.parteReal) + (sqr(num2.parteImaginaria)));
     error:=false;
     END
     ELSE
     error:=true;

END;


PROCEDURE ModuloComplejo (VAR num1: tComplejo; VAR res: real);
{Procedimiento que nos devuelve el modulo de un numero complejo en
la variable res}
BEGIN

     res:= sqrt( sqr(num1.parteReal) + sqr(num1.parteImaginaria));
END;

PROCEDURE ConjugadoComplejo (VAR num1: tComplejo);
{Procedimiento que nos devuelve el conjugado}
BEGIN
     num1.parteImaginaria:= num1.parteImaginaria * (-1);
END;

FUNCTION ParteReal (VAR num1: tComplejo): real;
{Funcion que nos devuelve la parte real de un numero conjugado}
BEGIN
     ParteReal:= num1.parteReal;
END;

FUNCTION ParteImaginaria (VAR num2: tComplejo):real;
BEGIN
     ParteImaginaria:= num2.parteImaginaria;
END;



END.