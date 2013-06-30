{*******************************************************************
 M¢dulo: HORADIGITAL
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 6/12/2003
 Descripci¢n: Unidad que contiene el tipo de datos horaDigital, y
              todas las operaciones que se pueden realizar con este
              tipo.
              [PRµCTICA 7]
 *******************************************************************}

UNIT horaTAD;

     INTERFACE

{**************************************************************************
**************************************************************************}

     TYPE
     {El tipo array lo vamos a implementar mediante un array de registros.
     El registro sera el tipo celda; con un campo elemento, y otro booleano
     que nos indica si en esa celda hay o no elemento}
         tHoras= 0..23;
         tMin= 0..59;
         tSeg= 0..59;

         tHora= RECORD
                 hora: tHoras;
                 min: tMin;
                 seg: tSeg;
                 END;

     {***** Operaciones constructoras-generadoras ****}

     PROCEDURE construirHora (horas: tHoras; min: tMin; seg: tSeg; VAR hora:tHora);

     {**** Operaciones observadoras-selectoras ****}

     FUNCTION dameHora (VAR hora: tHora): tHoras;
     FUNCTION dameMin (VAR hora:tHora) : tMin;
     FUNCTION dameSeg (VAR hora: tHora) : tSeg;

     {**** Operaciones constructoras-no generadoras ****}

     FUNCTION enPunto (VAR hora:tHora): boolean;
     FUNCTION distancia (VAR hora1,hora2 :tHora): integer;
     FUNCTION esPosterior (VAR hora1,hora2: tHora): boolean;

     {**** Operaciones observadoras-no selectoras ****}

     PROCEDURE segAHora (VAR nSeg: integer; VAR hora:tHora);
     PROCEDURE suma (VAR hora1,hora2, sumaHora: tHora);
     PROCEDURE incrementar (VAR hora:tHora; nSeg:integer);
{**************************************************************************
**************************************************************************}

     IMPLEMENTATION
     {A partir de aqu¡ va la implementacion en s¡ de los subprogramas
     que se anuncian en la cabecera}

     PROCEDURE construirHora (horas: tHoras; min: tMin; seg: tSeg; VAR hora:tHora);
     BEGIN
          hora.hora:=horas;
          hora.min:=min;
          hora.seg:=seg;
     END;

     FUNCTION dameHora (VAR hora:tHora): tHoras;
     BEGIN
          dameHora:= hora.hora;
     END;

     FUNCTION dameMin (VAR hora:tHora): tMin;
     BEGIN
          dameMin:= hora.min;
     END;

     FUNCTION dameSeg (VAR hora: tHora): tSeg;
     BEGIN
          dameSeg:= hora.seg;
     END;

     FUNCTION enPunto (VAR hora: tHora): boolean;
     BEGIN
          IF (dameMin(hora)=0) AND (dameSeg(hora)=0) THEN
             enPunto:= TRUE
          ELSE
             enPunto:= FALSE;
     END;

     FUNCTION distancia (VAR hora1,hora2 : tHora): integer;
     BEGIN
          distancia:= (dameHora(hora2) - dameHora(hora1))*3600 + (dameMin(hora2) - dameMin(hora1))*60 +
          (dameSeg(hora2) - dameSeg(hora1));
     END;

     FUNCTION esPosterior (VAR hora1,hora2: tHora): boolean;
     BEGIN
          IF distancia(hora1,hora2)>0 THEN
             esPosterior:=TRUE
          ELSE
              esPosterior:=FALSE;
     END;

     PROCEDURE segAHora (VAR nSeg: integer; VAR hora:tHora);
     BEGIN
          construirHora((nSeg DIV 3600) MOD 24, (nSeg DIV 60) MOD 60, (nSeg MOD 60),hora);

     END;

     PROCEDURE suma (VAR hora1,hora2, sumaHora:tHora);
     VAR
     segAcum: integer;
     BEGIN
          segAcum:= (dameHora(hora1)+dameHora(hora2))*3600;
          segAcum:= segAcum + (dameMin(hora1)+dameMin(hora2))*60;
          segAcum:= segAcum + (dameSeg(hora1) + dameSeg(hora2));
          writeln(segAcum);
          segAHora(segAcum, sumaHora);

     END;

     PROCEDURE incrementar(VAR hora:tHora; nSeg:integer);
     VAR
     segAcum:integer;
     BEGIN
          segAcum:= dameHora(hora) * 3600;
          segAcum:= segAcum + dameMin(hora)*60;
          segAcum:= segAcum + dameSeg(hora);
          segAcum:= segAcum + nSeg;

          segAHora(segAcum, hora);

     END;

END.