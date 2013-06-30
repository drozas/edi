{*********************************************************************
*
*
*       M¢dulo: ListaTAD
*
*       Tipo:   Programa()   Interfaz-Implementacion TAD (X)  Otros()  *
*       Autor:  EDI
*
*       Descripci¢n: Interfaz e Implementaci¢n del TAD Lista.
*
*
*********************************************************************}
UNIT ListPTAD;
INTERFACE
CONST
N_NODOS=100;


        TYPE
        TipoElemento=1..N_NODOS;
        TipoCursor=^TipoNodo;
        TipoNodo = RECORD
        info: TipoElemento;
      sig:  TipoCursor;
   END;

        TipoLista = TipoCursor;
        TipoListaPermutacion = TipoLista;
   (* OPERACIONES CONSTRUCTORAS GENERADORAS *)

   PROCEDURE CrearVacia(VAR lista:TipoLista);
   {PRE: Cierto}
   {POST: La lista est  vac¡a, si tiene nodos se destruyen}

   PROCEDURE Construir(elemento: TipoElemento; VAR lista:TipoLista);
   {PRE: Hay espacio para almacenar elemento en la lista}
   {POST: "elemento" queda almacenado al principio de "lista"}
   {EXCEPCION: "Memoria Agotada" si no queda espacio de almacenamiento}

   (* OPEARCIONES OBSERVADORAS SELECTORAS *)

   PROCEDURE Primero(lista: TipoLista; VAR elem: TipoElemento);
   {PRE: "lista" no est  vac¡a}
   {POST: devuelve el primer elemento que contiene "lista"}
   {EXCEPCION: "ListaVacia" si "lista" est  vac¡a}

   PROCEDURE Resto(lista: TipoLista; VAR restante: TipoLista);
   {PRE: "lista" no est  vac¡a y queda suficiente memoria para crear "restante"}
   {POST: devuelve en "restante" una copia de "lista" excepto el primer nodo}
   {EXCEPCION: "ListaVac¡a" si "lista" est  vac¡a;
                        "MemoriaAgotada" si no queda memoria}

   (* OPERACIONES OBSERVADORAS NO SELECTORAS *)

   FUNCTION EsVacia(lista:TipoLista):Boolean;
   {PRE: Cierto}
   {POST: devuelve TRUE si "lista" est  vac¡a}

   FUNCTION Longitud(lista:TipoLista):Integer;
   {PRE: Cierto}
   {POST: devuelve el n£mero de elementos de la lista}

   PROCEDURE Ultimo(lista: TipoLista; VAR elem: TipoElemento; VAR error:Boolean);
   {PRE: "lista" no est  vac¡a}
   {POST: devuelve el £ltimo elemento que contiene "lista"}
   {EXCEPCION: "ListaVacia" si "lista" est  vac¡a}

   FUNCTION Pertenece(elem:TipoElemento; lista: TipoLista): Boolean;
   {PRE: Cierto}
   {POST: devuelve TRUE si "lista" contiene a "elemento"}

   PROCEDURE Concatenar(l1,l2: TipoLista; VAR listaResul:TipoLista);
   {PRE: Queda suficiente memoria para crear "listaResul"}
   {POST: devuelve en "listaResul" la concatenaci¢n de "l1" y "l2"}
   {EXCEPCION: "MemoriaAgotada" si no queda memoria para crear "listaResul"}

   PROCEDURE BorrarElemento(VAR lista: TipoLista; elem: TipoElemento);
   {PRE: Cierto}
   {POST: Elimina la primera aparici¢n de "elemento" en "lista"}

   PROCEDURE InsertaFinal(elem:TipoElemento; VAR lista: TipoLista);
        {PRE: Queda suficiente memoria para insertar "elemento" en "lista"}
   {POST: el £ltimo elemento de "lista" es "elemento"}
   {EXCEPCION: "MemoriaAgotada" si no queda memoria para insertar "elemento"}


   (* OPERACIONES PROTEGIDAS  *)

   FUNCTION PrimerCursor(lista:TipoLista):TipoCursor;
   FUNCTION EsCursorValido(lista:TipoLista;cursor:TipoCursor):Boolean;
   PROCEDURE Elemento(lista: TipoLista; cursor: TipoCursor; VAR elem:TipoElemento);
   FUNCTION Siguiente(lista: TipoLista; cursor:TipoCursor):TipoCursor;
   FUNCTION UltimoCursor(lista:TipoLista):TipoCursor;
   PROCEDURE DestruirLista(VAR lista:TipoLista);
   PROCEDURE LiberarNodo(VAR cursor:TipoCursor);
   FUNCTION CrearNodo(elemento: TipoElemento; sig:TipoCursor):TipoCursor;
   PROCEDURE Reemplazar(VAR lista:TipoLista; cursor: TipoCursor; elem: TipoElemento);
   FUNCTION EsPrimero(lista:TipoLista;cursor:TipoCursor):Boolean;
   FUNCTION EsUltimo(lista:TipoLista; cursor:TipoCursor):Boolean;
   FUNCTION Anterior(lista: TipoLista; cursor:TipoCursor):TipoCursor;
   PROCEDURE Insertar(VAR lista:TipoLista; cursor:TipoCursor; elem:TipoElemento; detras: Boolean);
   PROCEDURE Eliminar(VAR lista: TipoLista; cursor:TipoCursor);
   PROCEDURE Copiar(lista1: TipoLista; VAR lista2: TipoLista);
   PROCEDURE InsertarDelante(VAR lista: TipoLista; cursor, nodo:TipoCursor);
   PROCEDURE InsertarDetras(VAR lista: TipoLista; cursor, nodo: TipoCursor);


IMPLEMENTATION

        (* OPERACIONES PROTEGIDAS (MANEJO DE CURSORES, OTRAS
           CONSTRUCTORAS,...) *)

   FUNCTION EsCursorValido(lista:TipoLista;cursor:TipoCursor):Boolean;
   {Complejidad: O(1)}
   {No tenemos en cuenta lista pero otra posible implementaci¢n s¡ lo har¡a}
   BEGIN
        EsCursorValido := cursor <> NIL;
   END;

        PROCEDURE Elemento(lista: TipoLista; cursor: TipoCursor; VAR elem:TipoElemento);
   {Complejidad: O(1)}
   BEGIN
        IF EsCursorValido(lista, cursor) THEN
        elem := cursor^.info
      ELSE
        Writeln('Cursor no v lido');
   END;

   FUNCTION Siguiente(lista: TipoLista; cursor:TipoCursor):TipoCursor;
   {Complejidad: O(1)}
   BEGIN
        IF EsCursorValido(lista, cursor) THEN
                        Siguiente := cursor^.sig
      ELSE
        Siguiente := cursor
   END;

   FUNCTION PrimerCursor(lista:TipoLista):TipoCursor;
   {Complejidad: O(1)}
   BEGIN
        PrimerCursor := lista;
   END;

   FUNCTION UltimoCursor(lista:TipoLista):TipoCursor;
   {Complejidad: O(N)}
   VAR
        auxCur:TipoCursor;
   BEGIN
                IF lista<>NIL THEN
      BEGIN
        auxCur:=lista;
        WHILE EsCursorValido(lista,auxCur^.sig) do
		     auxCur:=auxCur^.sig;

        UltimoCursor:=auxCur
      END
      ELSE
        UltimoCursor:=lista
   END;

        PROCEDURE DestruirLista(VAR lista:TipoLista);
   {Complejidad: O(N)}
   VAR
        pAux: TipoCursor;
   BEGIN
                pAux := lista;
      WHILE EsCursorValido(lista, pAux) DO
      BEGIN
        pAux := Siguiente(lista, pAux);
        Dispose(lista);
        lista:= pAux
      END
   END;

   PROCEDURE LiberarNodo(VAR cursor:TipoCursor);
   {Complejidad: O(1)}
   BEGIN
        Dispose(cursor);
   END;

   FUNCTION CrearNodo(elemento: TipoElemento; sig:TipoCursor):TipoCursor;
   {Complejidad: O(1)}
   VAR
        pAux: TipoCursor;
   BEGIN
        New(pAux);
      pAux^.info := elemento;
      pAux^.sig := sig;
      CrearNodo := pAux;
   END;

   PROCEDURE Reemplazar(VAR lista:TipoLista; cursor: TipoCursor; elem:
TipoElemento);
   {Complejidad: O(1)}
        BEGIN
                IF NOT EsCursorValido(lista,cursor) THEN
        Writeln('Cursor no valido')
      ELSE
                        cursor^.info := elem;
   END;

   FUNCTION EsPrimero(lista:TipoLista;cursor:TipoCursor):Boolean;
   {Complejidad: O(1)}
   BEGIN
        IF EsCursorValido(lista,cursor) THEN
        EsPrimero:=PrimerCursor(lista)=cursor
      ELSE
      BEGIN
        Writeln('No es cursor v lido');
         EsPrimero:=FALSE
      END
   END;

   FUNCTION EsUltimo(lista:TipoLista; cursor:TipoCursor):Boolean;
   {Complejidad: O(1)}
   BEGIN
        IF EsCursorValido(lista,cursor) THEN
        EsUltimo:= cursor^.sig = NIL
      ELSE
      BEGIN
        Writeln('No es cursor v lido');
         EsUltimo:=FALSE
      END;
   END;

   FUNCTION Anterior(lista: TipoLista; cursor:TipoCursor):TipoCursor;
   {Complejidad: O(N)}
   VAR
        auxCur:TipoCursor;
   BEGIN
        IF NOT EsCursorValido(lista,cursor) THEN
        Writeln('No es cursor v lido')
      ELSE
      BEGIN
         auxCur:=lista;
         WHILE EsCursorValido(lista,auxCur^.sig) AND (auxCur^.sig<>cursor) DO
			    auxCur:=auxCur^.sig;
         Anterior:=auxCur
      END
   END;

   PROCEDURE InsertarDelante(VAR lista: TipoLista; cursor, nodo:TipoCursor);
   {POST: Inserta el nodo apuntado por "nodo" en la posici¢n anterior de la
                                apuntada por "cursor" en la "lista"}
   {Complejidad: O(N)}
   BEGIN
      {Caso especial: no hay ningun nodo insertado}
      IF (cursor=NIL) AND (lista=NIL) THEN
      BEGIN
         lista    := nodo;
         nodo^.sig:= NIL
      END
      ELSE
      {Caso especial: el cursor apunta al primer nodo}
         IF (cursor=lista) THEN
         BEGIN
            nodo^.sig:=cursor;
            lista    :=nodo
         END
         ELSE
      {Caso general: el cursor apunta a cualquier nodo menos el primero}
      { En este caso buscamos el anterior e insertamos detras}
            InsertarDetras(lista,Anterior(lista,cursor),nodo)
   END;

   PROCEDURE InsertarDetras(VAR lista: TipoLista; cursor, nodo: TipoCursor);
   {POST: Inserta el nodo apuntado por "nodo" en la posici¢n posterior de la
                                apuntada por "cursor" en la "lista"}
   {Complejidad: O(1)}
   BEGIN
      {Caso especial: no hay ningun nodo insertado}
      IF (cursor = NIL) AND (lista = NIL) THEN
      BEGIN
        lista    := nodo;
         nodo^.sig:= NIL
      END
      ELSE
      BEGIN
                nodo^.sig:= cursor^.sig;
        cursor^.sig:=nodo
      END
   END;

   PROCEDURE Insertar(VAR lista:TipoLista; cursor:TipoCursor;

elem:TipoElemento; detras: Boolean);
   {Complejidad: O(1)}
   VAR
        nodoAux: TipoCursor;
   BEGIN
        IF NOT EsCursorValido(lista,cursor) THEN
        InsertaFinal(elem,lista)
      ELSE
      BEGIN
                        nodoAux:=CrearNodo(elem, NIL);
         IF detras THEN
                InsertarDetras(lista, cursor, nodoAux)
         ELSE
                InsertarDelante(lista, cursor, nodoAux);
      END;
   END;

   PROCEDURE Eliminar(VAR lista: TipoLista; cursor:TipoCursor);
   {Complejidad: O(N)}
   VAR
        curAux:TipoCursor;
   BEGIN
        IF NOT EsCursorValido(lista,cursor) THEN
        Writeln('No es cursor v lido')
      ELSE
      BEGIN
         {Caso especial: eliminamos el primer elemento}
         IF lista=cursor THEN
                lista:=cursor^.sig
              ELSE
         {Caso general: eliminamos cualquier elemento que no es el primero}
                        Anterior(lista,cursor)^.sig:=cursor^.sig;
         LiberarNodo(cursor)
        END
   END;

   PROCEDURE Copiar(lista1: TipoLista; VAR lista2: TipoLista);
   {Complejidad: O(N)}
   VAR
                pAux1, pAux2: TipoCursor;
      elem: TipoElemento;
   BEGIN
        IF EsVacia(lista1) THEN
        CrearVacia(lista2)
      ELSE
      BEGIN
        pAux1 := PrimerCursor(lista1);
         pAux2 := PrimerCursor(lista2);
                WHILE EsCursorValido(lista1,pAux1) DO
         BEGIN
                IF EsCursorValido(lista2,pAux2) THEN
            BEGIN
               Elemento(lista1,pAux1,elem);
                Reemplazar(lista2,pAux2,elem)
            END
            ELSE
            BEGIN
               Elemento(lista1,pAux1,elem);
                Insertar(lista2,pAux2,elem,TRUE)
                                END;

            IF EsCursorValido(lista2,pAux2) THEN
                pAux2 := Siguiente (lista2, pAux2);

            pAux1:=Siguiente(lista1,pAux1)
                        END;

         IF EsCursorValido(lista2,pAux2) THEN
         BEGIN
                Anterior(lista2,pAux2)^.sig := NIL;
            DestruirLista(pAux2)
         END
      END
   END;

{************************************************************************}
   (* OPERACIONES CONSTRUCTORAS GENERADORAS *)

   PROCEDURE CrearVacia(VAR lista:TipoLista);
   {Complejidad: O(N)}
   BEGIN
{                DestruirLista(lista);}
      lista := NIL;
   END;

   PROCEDURE Construir(elemento: TipoElemento; VAR lista:TipoLista);
        {Complejidad: O(1)}
   VAR
        pAux: TipoCursor;
   BEGIN
                pAux := CrearNodo(elemento, NIL);
      InsertarDelante(lista,PrimerCursor(lista),pAux)
   END;

   (* OPEARCIONES OBSERVADORAS SELECTORAS *)

   PROCEDURE Primero(lista: TipoLista; VAR elem: TipoElemento);
   {Complejidad: O(1)}
        BEGIN
        IF EsVacia(lista) THEN
        Writeln('La lista est  vac¡a')
      ELSE
        Elemento(lista, PrimerCursor(lista),elem);
   END;

   PROCEDURE Resto(lista: TipoLista; VAR restante: TipoLista);
        {Complejidad: O(N)}
   VAR
        auxPrimero: TipoCursor;
   BEGIN
        IF EsVacia(lista) THEN
        Writeln('La lista est  vac¡a')
      ELSE
      BEGIN
        Copiar(restante, lista);
         auxPrimero := PrimerCursor(restante);
         Eliminar(restante, auxPrimero);
      END;
   END;

   (* OPERACIONES OBSERVADORAS NO SELECTORAS *)

   FUNCTION EsVacia(lista:TipoLista):Boolean;
   {PRE: Cierto}
   {POST: devuelve TRUE si "lista" est  vac¡a}
   BEGIN
        EsVacia:= lista = NIL;
   END;

   FUNCTION Longitud(lista:TipoLista):Integer;
   {Complejidad: O(N)}
   VAR
           long: Integer;
        curAux: TipoCursor;
   BEGIN
        long:=0;
      curAux:=PrimerCursor(lista);
      WHILE EsCursorValido(lista,curAux) DO
      BEGIN
        long:=long+1;
         curAux:=Siguiente(lista,curAux);
      END;
      Longitud:=long;
   END;

   PROCEDURE Ultimo(lista: TipoLista; VAR elem: TipoElemento;VAR
error:Boolean);
   {Complejidad: O(1)}
   BEGIN
        IF EsVacia(lista) THEN
      BEGIN
        error:=TRUE;
        Writeln('Lista Vac¡a')
      END
      ELSE
      BEGIN
        Elemento(lista,UltimoCursor(lista),elem);
         error:=FALSE;
      END;
   END;

   FUNCTION Pertenece(elem:TipoElemento; lista: TipoLista): Boolean;
   {Complejidad: O(N)}
   VAR
        curAux:TipoCursor;
      elemAux:TipoElemento;
   BEGIN
        curAux:=PrimerCursor(lista);
      WHILE EsCursorValido(lista,curAux) DO
      BEGIN
         Elemento(lista,curAux,elemAux);
              IF (elemAux<>elem) THEN {"Distinto" es operacion
gen‚rica}
                        curAux:=Siguiente(lista,curAux);
      END;
      Pertenece:=EsCursorValido(lista,curAux);
   END;


   PROCEDURE Concatenar(l1,l2: TipoLista; VAR listaResul:TipoLista);
        {Complejidad: O(max(longitud(l1),longitud(l2))=O(N)}
   VAR
        copia_l2,copiaResul:TipoLista;
   BEGIN
      IF EsVacia(l1) THEN
        Copiar(l2,listaResul)
      ELSE
        BEGIN
           CrearVacia(copiaResul);
           Copiar(l1,copiaResul);
           IF NOT EsVacia(l2) THEN
             BEGIN
                CrearVacia(copia_l2);
                Copiar(l2,copia_l2);
                UltimoCursor(copiaResul)^.sig:=PrimerCursor(copia_l2);
             END;
             Copiar(copiaResul,listaResul);
             DestruirLista(copiaResul);
      END;
   END;

   PROCEDURE BorrarElemento(VAR lista: TipoLista; elem: TipoElemento);
   {Complejidad: O(N)}
   VAR
        curAux: TipoCursor;
      elemAux: TipoElemento;
   BEGIN
                curAux:=PrimerCursor(lista);
      WHILE EsCursorValido(lista,curAux) DO
      BEGIN
        Elemento(lista,curAux,elemAux);
         IF (elemAux<>elem) THEN {"Distinto" operacion gen‚rica}
                                curAux:=Siguiente(lista,curAux);
      END;

      IF EsCursorValido(lista,curAux) THEN
        Eliminar(lista,curAux);
   END;

   PROCEDURE InsertaFinal(elem:TipoElemento; VAR lista: TipoLista);
   {Complejidad: O(N)}
   VAR
        nodoAux: TipoCursor;
   BEGIN
                nodoAux:=CrearNodo(elem,NIL);
      InsertarDetras(lista,UltimoCursor(lista),nodoAux)
   END;
END.
