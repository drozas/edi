{*******************************************************************
 M¢dulo: practica4
 Tipo:   Programa(X)     Interfaz-Implementacion TAD()   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 7/11/2003
 Descripci¢n: Programa principal de la practica cuatro, que utiliza
              las unidades creadas: complejo y rcl
 ********************************************************************}

 PROGRAM pract4;
 {Llamada a las unidades complejo y rcl}
 USES complejo,rcl,CRT;

 VAR
 V0, frec, C, L, R: real;
 impC,impL,impR: tComplejo;
 intC,intR,intL,vComplejo:tComplejo;
 error:boolean;
 potC,potL,potR: tComplejo;
 opcion:integer;

 BEGIN
 REPEAT
      {Entrada de datos}
      CLRSCR;
      writeln('************************************************************');
      writeln('            Practica 4: Implementacion de TADs');
      writeln('************************************************************');
      writeln;
      writeln;
      writeln('                        R              C');
      writeln('      ---------------^^^^^^^----------/ /-----');
      writeln('      |                                      | ');
      writeln('      |                                      | ');
      writeln('      |               CIRCUITO               | ');
      writeln('     (V0)               RCL                  | ');
      writeln('      |                                      | ');
      writeln('      |                                      @');
      writeln('      |                                      @ L');
      writeln('      |                                      @');
      writeln('      |                                      |');
      writeln('      | --------------------------------------');
      writeln;
      writeln;
      writeln('Valores actuales:');
      writeln('=================');
      writeln('V0 = ', V0:2:2);
      writeln('W = ', frec:2:2);
      writeln('C = ', C:2:2);
      writeln('L = ', L:2:2);
      writeln('R = ', R:2:2);
      writeln;
      writeln;
      writeln;
      writeln(' 1. Dar [actualizar] los valores del circuito');
      writeln(' 2. Calcular las caidas de potencial en los elementos');
      writeln;
      writeln;
      writeln('***********');
      writeln(' 0. Salir');
      writeln('***********');
      writeln;
      writeln;
      REPEAT
            writeln('Escoja una opcion:');
            readln(opcion);
      UNTIL (opcion<=2) AND (opcion>=0);


      CASE opcion OF
      1:
      BEGIN
           writeln('Valor de V0?');
           readln(V0);
           writeln('Valor de la frecuencia?');
           readln(frec);
           frec:=FrecuenciaAngular(frec);
           writeln(' Valor de C?');
           readln(C);
           ImpedanciaC(frec,C,impC);
           writeln('Valor de R?');
           readln(R);
           ImpedanciaR(R,impR);
           writeln('Valor de L?');
           readln(L);
           ImpedanciaL(frec,L,impL);
           readln;
      END;

      2:
      BEGIN
      {C lculo de intensidades}
         CrearComplejo(V0,0, vComplejo);{????????????}

           Intensidad(vComplejo,impC,intC,error);
                IF error THEN
                  writeln('Operaci¢n incorrecta, divisi¢n por 0');

           Intensidad(vComplejo,impL,intL,error);
                IF error THEN
                  writeln('Operaci¢n incorrecta, divisi¢n por 0');

           Intensidad(vComplejo,impR,intR,error);
                IF error THEN
                  writeln('Operaci¢n incorrecta, divisi¢n por 0');

      {Y ahora el c lculo de las caidas de potenciales en cada elemento}

         CaidaPotencial(intC,impC,potC);
         CaidaPotencial(intL,impL,potL);
         CaidaPotencial(intR,impR,potR);

         IF NOT error THEN
         BEGIN
              writeln(' Las caidas de potencial son las siguientes...');
              writeln('Caida de potencial en C = ', ParteReal(potC):2:2, ' + ', ParteImaginaria(potC):2:2, ' j');
              writeln('Caida de potencial en L = ', ParteReal(potL):2:2, ' + ', ParteImaginaria(potL):2:2, ' j');
              writeln('Caida de potencial en R = ', ParteReal(potR):2:2, ' + ', ParteImaginaria(potR):2:2, ' j');
         END;
         readln;
      END;
     END;{CASE}

 UNTIL(opcion=0);
 END.