UNIT AlfaTAD;
INTERFACE
  USES CharTAD, priTAD;

  TYPE
  tipoAlfabeto=ARRAY[char] OF tipoCaracter;

  {Operaciones Constructoras Generadoras}
  PROCEDURE CrearAlfabetoVacio(VAR alfabeto:tipoAlfabeto);
  {PRE:TRUE}
  {POST: Devuelve un alfabeto con las probabilidades a 0}

  {Operaciones Observadora no selectora}
  PROCEDURE CalcularProbabilidad(VAR fichero:text; VAR alfabeto:tipoAlfabeto);
  {PRE:TRUE}
  {POST:Carga en el array de registros alfabeto la probabilidad con la
        que aparece ese caracter en el fichero}

  PROCEDURE EscribirAlfabeto(VAR alfabeto:tipoAlfabeto; VAR salida:text);
  {PRE:TRUE}
  {POST: Escribe en un fichero el contenido del alfabeto}


IMPLEMENTATION

  PROCEDURE CrearAlfabetoVacio(VAR alfabeto:tipoAlfabeto);
  {O(T)=N}
  VAR
  i:char;
  BEGIN
       FOR i:=CHR(0) TO CHR(255) DO
       BEGIN
            {Hacemos un bucle en el que recorremos todos los elementos
            y les vamos asignando la prioridad 0}
            ConstruirElemento(alfabeto[i], 0.0, i);
       END;
  END;

  PROCEDURE CalcularProbabilidad(VAR fichero:text; VAR alfabeto:tipoAlfabeto);
  {O(t)=N}
  VAR
  carAux:char;
  nElementos:integer;
  i:char;

  BEGIN
       RESET(fichero);
       CrearAlfabetoVacio(alfabeto);
       nElementos:=0;
       WHILE NOT EOF(fichero) DO
       BEGIN
            {Leemos el caracter del fichero y lo metemos en el aux}
            read(fichero,carAux);
            {Sumamos el numero de veces que lo hemos encontrado en el
            campo clave-prior}
            alfabeto[carAux].clave:= alfabeto[carAux].clave + 1;
            {Aumentamos el nElementos del fichero}
            nElementos:=nElementos+1;
       END;

       CLOSE(fichero);

       {Ahora s¢lo nos queda dividir las probabilidades por el nTotal
       en cada campo clave}

       FOR i:= CHR(0) TO CHR(255) DO
       BEGIN
            alfabeto[i].clave:=alfabeto[i].clave/nElementos;
       END;
  END;

  PROCEDURE EscribirAlfabeto(VAR alfabeto:tipoAlfabeto; VAR salida:text);
  VAR
  carAux:char;
  claveAux: real;
  i:char;
  BEGIN
       RESET(salida);
       FOR i:= CHR(0) TO CHR(255) DO
       BEGIN
            read(alfabeto[i].info, carAux);
            read(alfabeto[i].clave, claveAux);
            write(carAux, ' : ' );
            write(claveAux:2:2);
            writeln;
       END;
       CLOSE(salida);
  END;
END.

