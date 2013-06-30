{*********************************************************************
*
*
*       Modulo: ArBinTAD
*
*       Tipo:   Programa()   Interfaz-Implementacion TAD (X)  Otros()  *
*       Autor:  EDI
*
*       Descripcion: Interfaz e Implementaci¢n del TAD Arbol Binario.
*
*
*********************************************************************}
UNIT ArBinTAD;
INTERFACE
        USES CharTAD;


   (* DECLARACION TIPO.  PRIVADO             *)
        TYPE
           TipoElemento= tipoCaracter;
	   TipoArbolBin = ^TipoNodo;
           TipoNodo = RECORD
                         hijoizq, hijodrch: TipoArbolBin;
                         raiz: TipoElemento;
                      END;
	   TipoArbolHuffman= TipoArbolBin;

   (*********************************************************************)
   (*    OPERACIONES PUBLICAS                                         *)

   (* OPERACIONES CONSTRUCTORAS GENERADORAS *)

   PROCEDURE CrearArbolBinVacio (VAR arbol:TipoArbolBin);
   {PRE: Cierto}
   {POST: Inicializa el arbol}

   PROCEDURE ConstruirArbolBin(izqdo:TipoArbolBin;
                                   e: TipoElemento;
                               drcho:TipoArbolBin;
                           VAR arbol:TipoArbolBin);
   {PRE: Hay espacio para almacenar elemento en el arbol}
   {POST: Construye un arbol con "e" como raíz del "arbol" e hijos "izqdo" y "drcho"
          La memoria reservada por "drcho" e "izqdo" pasan a ser propiedad de "arbin"}
   {EXCEPCION: "Memoria Agotada" si no queda espacio de almacenamiento}


   (* OPERACIONES OBSERVADORAS SELECTORAS *)

   {FUNCTION Raiz(arbol: TipoArbolBin): TipoElemento;}
   PROCEDURE Raiz (arbol: tipoArbolBin; VAR r:tipoElemento);
   {PRE: "arbol" no esta  vacio}
   {POST: devuelve la raiz del "arbol"}


   FUNCTION HijoIzdo(arbol: TipoArbolBin): TipoArbolBin;
   {PRE: "arbol" no esta  vacio}
   {POST: devuelve el hijo izquierdo del arbol}

   FUNCTION HijoDcho(arbol: TipoArbolBin): TipoArbolBin;
   {PRE: "arbol" no esta  vacio}
   {POST: devuelve el hijo derecho del arbol}


   (* OPERACIONES OBSERVADORAS NO SELECTORAS *)

   FUNCTION EsArbolBinVacio(arbol:TipoArbolBin):Boolean;
   {PRE: Cierto}
   {POST: devuelve TRUE si "arbol" esta  vacio}


   FUNCTION Igual(arbin1,arbin2:TipoArbolBin):Boolean;
   {PRE: Cierto}
   {POST: devuelve TRUE si "arbin1" y "arbin2" son iguales}


   (* OPERACIONES CONSTRUCTORAS NO GENERADORAS *)

   PROCEDURE Copiar( VAR destino :TipoArbolBin; origen:TipoArbolBin);
   {PRE: Hay espacio para copiar todos los elementos de "origen"}
   {POST: Devuelve en "destino" una copia completa de "origen"}
   {EXCEPCION: "Memoria Agotada" si no queda espacio de almacenamiento}


   (* OPERACION DESTRUCTORA *)

   PROCEDURE DestruirArbolBin(VAR arbol:TipoArbolBin);
   {PRE: Cierto}
   {POST: destruye todos los nodos de "arbol" y deja el arbol vacio}



   (*********************************************************************)
   (*    OPERACIONES PROTEGIDAS                                         *)

   FUNCTION CreaNodo (izqdo: TipoArbolBin; e: TipoElemento; dcho: TipoArbolBin):TipoArbolBin;
   {PRE: Cierto}
   {POST: Devuelve un arbol binario con raiz "e" e  hijos "izqdo", "dcho"}


   PROCEDURE LiberarNodo (VAR nodo: TipoArbolBin);
   {PRE: Cierto}
   {POST: Libera el espacio reservado por el nodo}


IMPLEMENTATION

   (*********************************************************************)
   (*    OPERACIONES PROTEGIDAS                                         *)

   FUNCTION CreaNodo (izqdo: TipoArbolBin; e: TipoElemento; dcho: TipoArbolBin):TipoArbolBin;
   {Complejidad: O(1)}
   VAR
      nuevo:TipoArbolBin;
   BEGIN
      New(nuevo);
      nuevo^.raiz:=e;
      nuevo^.hijoizq:=izqdo;
      nuevo^.hijodrch:=dcho;

      CreaNodo:= nuevo;
   END;


   PROCEDURE LiberarNodo (VAR nodo: TipoArbolBin);
   {Complejidad: O(1)}
   BEGIN
        Dispose(nodo);
   END;


   (*********************************************************************)
   (*    OPERACIONES PUBLICAS                                           *)

   (* OPERACIONES CONSTRUCTORAS GENERADORAS *)

   PROCEDURE CrearArbolBinVacio (VAR arbol:TipoArbolBin);
   {Complejidad: O(1)}
   BEGIN
      arbol := NIL;
   END;

   PROCEDURE ConstruirArbolBin(izqdo:TipoArbolBin;
                                   e: TipoElemento;
                               drcho:TipoArbolBin;
                           VAR arbol:TipoArbolBin);
   {Complejidad: O(1)}
   BEGIN

     IF (arbol <> izqdo) AND (arbol<> drcho) THEN
        DestruirArbolBin(arbol);

      arbol:= CreaNodo(izqdo,e,drcho);
   END;


   (* OPERACIONES OBSERVADORAS SELECTORAS *)

   PROCEDURE Raiz(arbol: TipoArbolBin; VAR r:tipoElemento);
   {Complejidad: O(1)}
   BEGIN
     IF NOT EsArbolBinVacio(arbol) THEN
        r:=arbol^.raiz
   END;


   FUNCTION HijoIzdo(arbol: TipoArbolBin): TipoArbolBin;
   {Complejidad: O(1)}
   BEGIN
     IF NOT EsArbolBinVacio(arbol) THEN
       HijoIzdo:=arbol^.hijoizq
   END;

   FUNCTION HijoDcho(arbol: TipoArbolBin): TipoArbolBin;
   {Complejidad: O(1)}
   BEGIN
     IF NOT EsArbolBinVacio(arbol) THEN
        HijoDcho:=arbol^.hijodrch
   END;


   (* OPERACIONES OBSERVADORAS NO SELECTORAS *)

   FUNCTION EsArbolBinVacio(arbol:TipoArbolBin):Boolean;
   {Complejidad: O(1)}
   BEGIN
        EsArbolBinVacio:= arbol = NIL;
   END;

   FUNCTION Igual(arbin1,arbin2:TipoArbolBin):Boolean;
   VAR
   rAux1,rAux2:tipoElemento;
   {Complejidad: O(min(num_nodos(arbin1), num_nodos(arbin2)}
   BEGIN
     IF EsArbolBinVacio (arbin1) AND EsArbolBinVacio (arbin2) THEN
        Igual:=TRUE
     ELSE IF EsArbolBinVacio(arbin1) OR EsArbolBinVacio(arbin2) THEN
        Igual:= FALSE
     ELSE (* ninguno de los dos es vacío *)

          {Raiz(arbin1,rAux1);
          Raiz(arbin2,rAux2);}
        Igual := (arbin1^.raiz.info = arbin2^.raiz.info) AND
                 Igual(HijoIzdo(arbin1), HijoIzdo(arbin2)) AND
                 Igual(HijoDcho(arbin1), HijoDcho (arbin2))
   END;


   (* OPERACION DESTRUCTORA *)

   PROCEDURE DestruirArbolBin(VAR arbol:TipoArbolBin);
   {Complejidad: O(n), siendo n el número de nodos de "arbol"}
   BEGIN

      IF NOT EsArbolBinVacio(arbol) THEN
        BEGIN
          DestruirArbolBin(arbol^.hijoizq);
          DestruirArbolBin(arbol^.hijodrch);
          LiberarNodo(arbol);
        END
   END;


   PROCEDURE Copiar( VAR destino :TipoArbolBin; origen:TipoArbolBin);
   {COMPLEJIDAD: O(max(num_nodos(origen), num_nodos(destino)) }
   VAR
     hi, hd: TipoArbolBin;
     raizAux,raizAux2:tipoElemento;
   BEGIN
    IF EsArbolBinVacio(origen) THEN
       DestruirArbolBin(destino)
    ELSE IF EsArbolBinVacio(destino) THEN
      BEGIN
       CrearArbolBinVacio(hi);
       CrearArbolBinVacio(hd);
       Copiar (hi, HijoIzdo(origen));
       Copiar (hd, HijoDcho(origen));
       Raiz(origen,raizAux);
       ConstruirArbolBin(hi, raizAux, hd, destino);
      END
    ELSE  (* reutiliza la memoria de destino  *)
      BEGIN
       Raiz(origen,raizAux2);
       destino^.raiz := raizAux2;
       Copiar (destino^.hijoizq, HijoIzdo(origen));
       Copiar (destino^.hijodrch, HijoDcho(origen));
      END;
  END;

END.
