PROGRAM pract2y3;
USES CRT;
TYPE
    tComplejo= RECORD
               parteReal : real;
               parteImaginaria: real;
               END;

VAR
num1,num2, res: tComplejo;
auxReal : real;
opcion: integer;
pReal, pImaginaria: real;
error1:boolean;
{Variables para los procedimientos de la practica 3}
impL, impC, impR :tComplejo;
R,C,L:real;
auxComp: tComplejo;
error2 :boolean;
opcElemento: char;
frecAux,frecAngular:real;


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
     ParteImaginaria:= num1.parteImaginaria;
END;

{*************************************************************}
{*************************************************************}

{ SUBPROGRAMAS DE LA PRACTICA 3}

PROCEDURE ImpedanciaL (frec, induc : real; VAR impL:tComplejo);
{Recibe dos reales: frec e inductancia, y devuelve un complejo impL.
Solo modificamos su parte imaginaria}
BEGIN
     CrearComplejo(0, frec * induc, impL);
END;

{***********************************************************}

PROCEDURE ImpedanciaR (res: real; VAR impR: tComplejo);
{Recibe un real, y devuelve un complejo.
Solo modificamos su parte real}
BEGIN
     CrearComplejo(res, 0, impR);
END;

{************************************************************}

PROCEDURE ImpedanciaC (frec, cap: real; VAR impC: tComplejo);
{Recibe dos reales, y devuelve un numero complejo}
BEGIN
     CrearComplejo(0, (-1 / (frec*cap)), impC);
END;

{*************************************************************}

PROCEDURE ImpedanciaTotal (impL, impR, impC: tComplejo; VAR impTotal:tComplejo);
{Recibe tres numeros complejos, y devuelve complejo}
BEGIN
     SumarComplejo(impL, impR, impTotal);
     SumarComplejo(impC, impTotal, impTotal);
END;

{**************************************************************}

PROCEDURE Intensidad (v,z:tComplejo; VAR intensidad:tComplejo; VAR error :boolean);
{Recibe dos numeros complejos y devuelve otro. Ademas una variable error
para controlar la division}
BEGIN
     DivisionComplejo(v,z,intensidad,error);
END;

{**************************************************************}

PROCEDURE CaidaPotencial(i,z:tComplejo; VAR v: tComplejo);
{Recibe dos complejos, y devuelve otro}
BEGIN
     ProductoComplejo(i,z,v);
END;

{**************************************************************}

FUNCTION FrecuenciaAngular (frec:real):real;
BEGIN
     FrecuenciaAngular:= frec * 2 * 3.1416;
END;



{**************************************************************}
BEGIN{P. principal}

REPEAT
      CLRSCR;
      writeln('           **********************************************');
      writeln('           Practica 2 : Operaciones con numeros complejos');
      writeln('           **********************************************');
      writeln;
      writeln;
      writeln(' 1. Crear un numero complejo');
      writeln(' 2. Sumar dos numeros complejos');
      writeln(' 3. Restar dos numeros complejos');
      writeln(' 4. Multiplicar dos numeros complejos');
      writeln(' 5. Dividir dos numeros complejos');
      writeln(' 6. Modulo de un numero complejo');
      writeln(' 7. Conjugado de un numero complejo');
      writeln(' 8. Parte real de un numero complejo');
      writeln(' 9. Parte imaginaria de un numero complejo');
      writeln;
      writeln;
      writeln;
      writeln;
      writeln('           *********************************************');
      writeln('                    Practica 3 : Circuito RCL');
      writeln('           *********************************************');
      writeln;
      writeln;
      writeln(' 10. Dar [o actualizar] valores a elementos del  circuito');
      writeln(' 11. Calcular la impedancia de un solo elemento');
      writeln(' 12. Calcular la caida de potencial en un solo elemento');
      writeln(' 13. Informacion general del circuito RCL');
      writeln;
      writeln;
      writeln('************');
      writeln(' 0. Salir');
      writeln('************');
      writeln;
      writeln;
      REPEAT
            writeln('Escoja una opcion');
            readln(opcion);
      UNTIL (opcion >=0) AND (opcion <= 13);

      CASE opcion OF
      1:
         BEGIN
          writeln('          **************************************');
          writeln('              Crear un numero complejo');
          writeln('          **************************************');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
          CrearComplejo(pReal, pImaginaria, num1);
          writeln('Resultado.: ' , num1.parteReal, ',', num1.parteImaginaria, ' j');
         END;
      2: BEGIN
         writeln('Suma de complejos:');
         writeln('******************');
         writeln;
         writeln('Introduzca el valor del primer numero complejo:');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num1);
         writeln('Introduzca el valor del segundo complejo:');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num2);
         SumarComplejo(num1,num2,res);
         writeln('Resultado.:', res.parteReal, ',', res.parteImaginaria);
         readln;
         END;
      3: BEGIN
         writeln('Resta de complejos:');
         writeln('******************');
         writeln;
         writeln('Introduzca el valor del primer numero complejo:');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num1);
         writeln('Introduzca el valor del segundo complejo:');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num2);
         RestarComplejo(num1,num2,res);
         writeln('Resultado.:', res.parteReal, ',', res.parteImaginaria);
         readln;
         END;
      4: BEGIN
         writeln('Producto de complejos:');
         writeln('**********************');
         writeln;
         writeln('Introduzca el valor del primer numero complejo:');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num1);
         writeln('Introduzca el valor del segundo complejo:');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num2);
         ProductoComplejo(num1,num2,res);
         writeln('Resultado.:', res.parteReal, ',', res.parteImaginaria);
         readln;
         END;
      5: BEGIN
         writeln('Division de complejos:');
         writeln('******************');
         writeln;
         writeln('Introduzca el valor del primer numero complejo:');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num1);
         writeln('Introduzca el valor del segundo complejo:');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num2);
         DivisionComplejo(num1,num2,res, error1);
                  IF NOT error1 THEN
                  BEGIN
                  writeln('Resultado.:', res.parteReal, ',', res.parteImaginaria);
                  readln;
                  END
                  ELSE
                  BEGIN
                  writeln ('Operacion no posible');
                  END;

         END;
      6: BEGIN
         writeln('Modulo de complejos:');
         writeln('*********************');
         writeln;
         writeln('Introduzca el valor del  numero complejo:');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria,num1);
         ModuloComplejo(num1, auxReal);
         writeln('Resultado.: ', auxReal);
         readln;
         END;
      7:
         BEGIN
         writeln('Conjugado de un complejo:');
         writeln('*************************');
         writeln;
         writeln('Introduzca el valor del numero complejo');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num1);
         ConjugadoComplejo(num1);
         writeln('Resultado.:', num1.parteREal, ',', num1.parteImaginaria);
         readln;
         END;
      8:
         BEGIN
         writeln('Parte real de un complejo:');
         writeln('**************************');
         writeln;
         writeln('Introduzca el valor del numero complejo:');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num1);
         auxReal:= parteReal(num1);
         writeln('Resultado.: ', auxReal);
         readln;
         END;
      9:
        BEGIN
         writeln('Parte imaginaria de un complejo:');
         writeln('*********************************');
         writeln;
         writeln('Introduzca el valor del complejo');
          writeln(' Parte real del numero: ');
          readln(pReal);
          writeln(' Parte Imaginaria');
          readln(pImaginaria);
         CrearComplejo(pReal, pImaginaria, num1);
         auxReal:= parteImaginaria(num1);
         writeln('Resultado.: ', auxReal);
         readln;
         END;

      10:
         BEGIN
         writeln('Introduccion de datos al Circuito RCL');
         writeln('*************************************');
         writeln;
         writeln;
         writeln('Resistencia : ');
         readln(R);
         writeln('Capacidad del condensador : ');
         readln(C);
         writeln('Capacidad de inductancia: ');
         readln(L);
         writeln('Frecuencia: ');
         readln(frecAux);
         frecAngular:= FrecuenciaAngular(frecAux);
         END;
      11:
         BEGIN
         writeln('Escoja el elemento del que quiere calcular la impedancia : R, C  o L');
         readln(opcElemento);
                            CASE opcElemento OF
                            'R', 'r' :
                                BEGIN
                                ImpedanciaR(R,impR);
                                writeln('La impedancia de R es : ', impR.parteReal, ' + ', impR.parteImaginaria, ' j');
                                END;
                            'C', 'c':
                                BEGIN
                                ImpedanciaC(frecAngular,C,impC);
                                writeln('La impedancia de C es : ', impC.parteReal, ' + ', impC.parteImaginaria, ' j');
                                END;
                            'L', 'l':
                                BEGIN
                                ImpedanciaL(frecAngular,L,impL);
                                writeln('La impedancia de L es : ', impL.parteReal, ' + ', impL.parteImaginaria, ' j');
                                END;
                            ELSE
                                writeln('Opcion no valida...');
                            END;{CASE}

                            readln;

         END;
      12:
         BEGIN
{         writeln('Escoja el elemento del que quiere calcular la caida de potencial : R, C  o L');
         readln(opcElemento);
                            CASE opcElemento OF
                            'R', 'r' :
                                BEGIN
                                ImpedanciaR(R,impR);
                                writeln('La impedancia de R es : ', impR.parteReal, ' + ', impR.parteImaginaria, ' j');
                                END;
                            'C', 'c':
                                BEGIN
                                ImpedanciaC(frecAngular,C,impC);
                                writeln('La impedancia de C es : ', impC.parteReal, ' + ', impC.parteImaginaria, ' j');
                                END;
                            'L', 'l':
                                BEGIN
                                ImpedanciaL(frecAngular,L,impL);
                                writeln('La impedancia de L es : ', impL.parteReal, ' + ', impL.parteImaginaria, ' j');
                                END;
                            ELSE
                                writeln('Opcion no valida...');
                            END}
                            writeln('Opcion no disponible');
                            readln;
         END;

      13:
         BEGIN
         writeln('Opcion no disponible');
         readln;
         END;

      END;{CASE}
UNTIL (opcion=0);
END.{P.principal}