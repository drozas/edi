{*******************************************************************
 M¢dulo: rcl
 Tipo:   Programa()     Interfaz-Implementacion TAD()   Otros(X)
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 7/11/2003
 Descripci¢n: Unidad que contiene las operaciones que podemos
              realizar con circuitos RCL
 *******************************************************************}
 UNIT rcl;

 INTERFACE
      {En esta parte van los tipos de datos, las llamadas a otras
      unidades, y las cabeceras de los programas}


      USES complejo;
      {LLamada a la unidad complej}


      PROCEDURE ImpedanciaL (frec, induc : real; VAR impL:tComplejo);
      PROCEDURE ImpedanciaR (res: real; VAR impR: tComplejo);
      PROCEDURE ImpedanciaC (frec, cap: real; VAR impC: tComplejo);
      PROCEDURE ImpedanciaTotal (impL, impR, impC: tComplejo; VAR impTotal:tComplejo);
      PROCEDURE Intensidad (v,z:tComplejo; VAR intensidad:tComplejo; VAR error :boolean);
      PROCEDURE CaidaPotencial(i,z:tComplejo; VAR v: tComplejo);
      FUNCTION FrecuenciaAngular (frec:real):real;

IMPLEMENTATION

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


END.