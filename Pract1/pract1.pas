PROGRAM pract1;
USES CRT;
CONST
MAXLIBROS= 3;
MAXALUMNOS= 20;

TYPE
    tNota=0..10;
    tCurso=1..5;
    tNumLibros= 1..MAXLIBROS;
    tNumAlumnos= 1..MAXALUMNOS;
    tArrayAsignaturas= ARRAY [1..10] of tNota;

    {Vamos a definir primero un registro que contendra la informacion
    de cada libro: num y titulo.
    Despues un array que contendra de 1 a MAXLIBROS.
    Y adem s un registro que contendra un tipo con este array; y
    un entero que controle el numero de libros}

    tFichaLibro= RECORD
                 num:integer;
                 titulo:string;
                 END;

    tArrayLibros= ARRAY[1..MAXLIBROS] of tFichaLibro;

    tListaLibros= RECORD
                   libro:tArrayLibros;
                   ult:tNumLibros;
                   END;

    {Del mismo modo definiremos los datos para almacenar la informacion
    de los alumnos:
    - Primero un tipo registro que contendra la informacion de cada alumno;
    que incluye un array con sus notas.
    - Despues un tipo array que contendra la informacion de todos los alumnos
    - Por ultimo un tipo registro, que contendra el tipo array anterior;
      mas una variable entera que controlara que no nos pasemos del tope}

    tFichaAlumno= RECORD
                  NIF:string[9];
                  nombre:string;
                  sexo:char;
                  edad:integer;
                  asignatura:tArrayAsignaturas;
                  curso:tCurso;
                  libros: tListaLibros;
                  END;

    tArrayAlumnos= ARRAY [1..MAXALUMNOS] OF tFichaAlumno;
    tColegio= RECORD
              alumno: tArrayAlumnos;
              ult: integer;
              END;
VAR
   alumnado: tColegio;
   opcion: integer;
   nAlumno:integer;
   media:real;
   i:integer;

{****************************************************************}

PROCEDURE EntradaAlumnos (VAR alumnado:tColegio);
{Procedimiento que permite la entrada de informacion de n alumnos controlados
por el usuario a nuestro array de registros}

VAR
n: integer; {num d nuevos alumnos}
i,j, z: integer;
respLibro:char;
nLibros:integer;
BEGIN{EntradaAlumnos}
     writeln('¨Cuantos alumnos desea inscribir?');
     readln(n);

     {Primero hay que comprobar que no nos hemos pasado del tope}
     IF (alumnado.ult + n) >= MAXALUMNOS THEN
     BEGIN
          writeln('No es posible escribir mas informacion, el cupo esta lleno!!!');
          readln;
     END{IF}
     ELSE
     BEGIN

          {El bucle recorrera desde el ultimo alumno que ingreso+1, hasta
          el nuevo numero de alumnos que queramos recorrer...posteriormente
          habra que actualizar el campo ult}
          FOR i:= (alumnado.ult +1) TO (alumnado.ult + n) DO  {REVISAR!!!!}
          BEGIN
               WITH alumnado.alumno[i] DO
               BEGIN
                    writeln('*****************************************************');
                    writeln('Introduzca la informacion del ', i , 'er/§ alumno...');
                    writeln('*****************************************************');
                    writeln;
                    writeln('NIF ?');
                    readln(NIF);
                    writeln('Nombre ?');
                    readln(nombre);
                    writeln('Sexo ? V o M ');
                    readln(sexo);
                    writeln('Edad ?');
                    readln(edad);
                            FOR j:=1 TO 10 DO
                            BEGIN
                                 writeln(' Nota de ', nombre, ' en asignatura ', j ,' ??');
                                 readln(asignatura[j]);
                            END;{FOR}

                    writeln('El alumno tiene reservado algun libro? S/N');
                    readln(respLibro);

                    IF (respLibro='S') OR (respLibro='s') THEN
                    BEGIN
                         writeln('Cuantos libros tiene reservado? MAX 3!');
                         readln(nLibros);
                               IF (nLibros<=3) AND (nLibros>=1) THEN
                               BEGIN
                                  FOR z:=1 to nLibros DO
                                  BEGIN
                                  writeln('****************************************');
                                  writeln('Introduzca la informacion del', z, 'er/§ libro:');
                                  writeln('****************************************');
                                  writeln;
                                  writeln('Numero del libro?');
                                  readln(libros.libro[z].num);
                                  writeln('Titulo del libro?');
                                  readln(libros.libro[z].titulo);
                                  END;{FOR}
                                  libros.ult:=nLibros; {Actualizamos el valor del numero de libros}
                               END;{IF}
                    END;{IF}

               END;{WITH}
           END;{FOR}



                  {Una vez que hemos salido del bucle, tenemos que actualizar
                  el numero de alumnos; para no sobrescribir informaciohn}

                  alumnado.ult:= alumnado.ult + n;
     END;{ELSE}
END; {EntradaAlumnos}

{*********************************************************}


PROCEDURE EscribirAlumnos (VAR alumnado: tColegio);
{Procedimiento que permite imprimir por pantalla toda la informacion
acerca de todos los alumnos}
VAR
i, j:integer;
BEGIN

        FOR i:= 1 to alumnado.ult DO
        BEGIN
             WITH alumnado.alumno[i] DO
             BEGIN
                  writeln('   ***********************************');
                  writeln('NIF : ', NIF);
                  writeln('Nombre : ', nombre);
                  writeln('Sexo : ', sexo);
                  writeln('Edad : ', edad);

                            FOR j:=1 TO 10 DO
                            BEGIN
                                 writeln(' Nota de ', nombre, ' en asignatura ', j, '.:  ', asignatura[j]);
                            END;{FOR}
                  writeln('   ************************************');
                  writeln;
                  writeln;
                  readln;{Para que tenga que pulsar enter despues de
                               cada ficha}
             END;{WITH}
     END;{FOR}
END;{EscribirAlumnos}
{**********************************************************}
FUNCTION CalcularMedia(VAR alumnoMedia:tFichaAlumno): real;
{Funcion que calcula la media de las notas del alumno. Le pasamos el registro
del Alumno correspondiente, cuyo numero sera preguntado en el programa
principal}
VAR
i:integer;
CalcularMediaAux:real;
BEGIN
     CalcularMediaAux:=0;
     {Hacemos el sumatorio...}
     FOR i:=1 TO 10 DO
     BEGIN
         CalcularMediaAux:= alumnoMedia.asignatura[i] + CalcularMediaAux;
     END;

     CalcularMedia:=CalcularMediaAux / 10;
END;{CalcularMedia}

{*******************************************************}

PROCEDURE ordenarLista (VAR alumnado:tColegio);
{Procedimiento que ordena una lista de alumnos, mediante metodo Burbuja}
VAR
i,j, nTotal: integer;
alumnoAux: tFichaAlumno;
BEGIN
     nTotal:=alumnado.ult;

     FOR i:=1 TO nTotal-1 DO
     BEGIN
          FOR j:=i TO nTotal-1 DO
          BEGIN
               IF alumnado.alumno[j].nombre > alumnado.alumno[j+1].nombre THEN
               BEGIN
                    alumnoAux:= alumnado.alumno[j];
                    alumnado.alumno[j]:=alumnado.alumno[j+1];
                    alumnado.alumno[j+1]:=alumnoAux;
               END;
          END;
     END;
END;

{***************************************************}

PROCEDURE InformacionBibliografica (VAR alumnoInfo:tFichaAlumno);
{Procedimiento cuya entrada es una ficha de alumno, cuyo numero hemos
preguntado en el programa principal.
Nos sacara por pantalla el numero de libros que tiene sacados dicho
alumno, y sus titulos}
VAR
i:integer;

BEGIN

     {Primero, vamos a controlar que el alumno tenga posesion de
     algun libro}
     IF alumnoInfo.libros.ult<= 0 THEN
        writeln('El alumno ', alumnoInfo.nombre,  ' no tiene reservado ningun libro')
     ELSE
     BEGIN
          writeln('Libros reservados por el alumno', alumnoInfo.nombre, ' :');
          writeln('====================================================');
          writeln;
          FOR i:=1 TO alumnoInfo.libros.ult DO
          BEGIN
          writeln('Titulo del libro ', i, ': ', alumnoInfo.libros.libro[i].titulo);
          writeln('Num de registro: ', alumnoInfo.libros.libro[i].num);
          END;

     END;
     readln;
END;{InformacionBibliografica}

{****************************************************************}

PROCEDURE menu;
{Procedimiento sin parametros ni variables, que muestra las opciones
posibles a realizar por el programa}
BEGIN
                writeln('             MENU PRINCIPAL');
                writeln('             ==============');
                writeln;
                writeln('1. Ordenar alfabeticamente lista de alumnos');
                writeln('2. Calcular la media de un alumno');
                writeln('3. Calcular la media de todos los alumnos');
                writeln('4. Consultar la informacion bibliografica de un alumno');
                writeln('5. Visualizar lista de alumnos ordenada alfabeticamente');
                writeln('6. Dar de alta a nuevos alumnos');
                writeln('0. Salir');
                writeln;
                writeln;
END;
{***************************************************************}
{***************************************************************}
BEGIN {PROG.PRINCIPAL}
      alumnado.ult:=0;{Inicializamos el numero de alumnos a 0}

REPEAT
      CLRSCR;
      media:=0; {Inicializamos la variable media cada vez...}
      menu; {LLamamos al procedimiento menu, para que muestre las opciones}
      REPEAT
      writeln('Escoja una opcion...');
      readln(opcion)
      UNTIL (opcion>=0) AND (opcion<=6);{Controlamos que la opcion est‚ dentro de los valores posibles}

      CASE opcion OF
      1: ordenarLista(alumnado);
      2: BEGIN
         writeln('          ==============================');
         writeln('              NOTA MEDIA DE UN ALUMNO');
         writeln('          ==============================');
         writeln;
         writeln('Introduzca el numero del alumno del que desea calcular la media');
         readln(nAlumno);
                  IF nAlumno> alumnado.ult THEN
                  writeln('No se tiene informacion del alumno con ese numero')
                  ELSE
                  BEGIN
                  media:= CalcularMedia(alumnado.alumno[nAlumno]);
                  writeln('La media de ', alumnado.alumno[nAlumno].nombre, ' es : ', media:2:2);
                  media:=0;
                  readln;
                  END;
         END;
      3: BEGIN
         writeln('          ===================================');
         writeln('            NOTA MEDIA DE TODOS LOS ALUMNOS');
         writeln('          ===================================');
         writeln;
                 FOR i:=1 TO alumnado.ult DO
                 BEGIN
                 media:= CalcularMedia(alumnado.alumno[i]);
                 writeln('La media de', alumnado.alumno[i].nombre, ' es:', media:2:2);
                 media:=0;
                 readln;
                 END;
         END;
      4: BEGIN
         writeln('          =========================================');
         writeln('            INFORMACION BIBLIOGRAFICA DE UN ALUMNO');
         writeln('          =========================================');
         writeln;
         writeln('Introduzca el numero del alumno del que desea ver su informacion bibliografica');
         readln(nAlumno);
                 IF (nAlumno>alumnado.ult) THEN
                 writeln('No se tiene informacion del alumno con ese numero')
                 ELSE
                 BEGIN
                 InformacionBibliografica(alumnado.alumno[nAlumno]);
                 END;
         END;
      5: BEGIN
         writeln('          =============================================');
         writeln('            VISUALIZACION ORDENADA DE LISTA DE ALUMNOS');
         writeln('          =============================================');
         writeln;
         ordenarLista(alumnado);
         escribirAlumnos(alumnado);
         END;
      6: BEGIN
         writeln('          ==============================');
         writeln('            DAR DE ALTA NUEVOS ALUMNOS');
         writeln('          ==============================');
         writeln;
         entradaAlumnos(alumnado);
         ordenarLista(alumnado); {Reordenamos la lista despues de cada nueva alta}
         END;
    END;{CASE}

UNTIL (opcion=0);
END.{P.PRINCIPAL}