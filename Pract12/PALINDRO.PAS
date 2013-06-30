{*******************************************************************
 M¢dulo: Pal¡ndromo
 Tipo:   Programa(x)     Interfaz-Implementacion TAD()   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 18/02/2004
 Descripci¢n: Programa que utiliza los tipos cola y pila, para ver
              si una frase es o no palindroma.
              [PRµCTICA 12]
 *******************************************************************}
 PROGRAM pract12;
    USES CRT, TCOLATAD, TPILATAD;

 VAR
 frase:string;


 FUNCTION EsPalindroma(frase:string):boolean;
 VAR
 pila:tPila;
 cola:tCola;
 pos:integer;
 sigue:boolean;
 letraPila,letraCola:char;

 BEGIN
      CrearPilaVacia(pila);
      CrearColaVacia(cola);
      sigue:=TRUE;
      {Primero...insertamos las letras pasando de los espacios en cada
      estructura}
      FOR pos:=1 to LENGTH(frase) DO
      BEGIN
           IF frase[pos]<>' ' THEN
           BEGIN
                Insertar(frase[pos], cola);
                Apilar(frase[pos], pila);
           END;
      END;

      {Y ahora un bucle que se ejecute mientras no hallamos llegado al final
      o mientras sean iguales los caracteres comparados}
      WHILE sigue AND NOT (esPilaVacia(pila)) DO
      BEGIN
           letraCola:=PrimeroCola(cola);
           letraPila:=Cima(pila);

            IF letraCola<>letraPila THEN
               sigue:=FALSE
            ELSE
            BEGIN
                Eliminar(cola);
                Desapilar(pila);
            END;

      END;

      EsPalindroma:=sigue;
 END;


 BEGIN

      writeln('*******************************************');
      writeln;
      writeln('Introduce una frase, para ver si es o no palindroma : ');
      readln(frase);
      writeln;
      writeln;
      IF EsPalindroma(frase) THEN
           writeln(' La frase que has introducido es palindroma!!!')
      ELSE
          writeln(' La frase que has introducido no es palindroma!!!');
      readln;
 END.



