(* Implementaci¢n DINAMICA del tipo COLA con nodos simplemente enlazados
y un registro con dos punteros, uno que apunta al primer elemento
y otro que apunta al ultimo elemento *)

{*******************************************************************
 M¢dulo: Colas
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 18/02/2004
 Descripci¢n: Unidad que contiene el tipo de datos cola,
              y todas las operaciones que se pueden realizar con este
              tipo.
              [PRµCTICA 12]
 *******************************************************************}

UNIT tColaTad;

     INTERFACE

     USES elemColaTAD;
     {Otros lenguajes si permiten el paso de rango y elemento como parametros.
     Como pascal no lo permite, creamos un par de unidades que albergan
     el rango y el tipo de elemento del tad vector}
{**************************************************************************
**************************************************************************}

     TYPE
         tCursor=^tNodo;

         tNodo= RECORD
                elem:tElemento;
                sig:tCursor;
                END;

         tCola = RECORD
               primero:tCursor;
               ultimo:tCursor;
               END;

     {***** Operaciones constructoras-generadoras ****}

     PROCEDURE CrearColaVacia (VAR c:tCola);
     {PRE: TRUE}
     {POST: devuelve un elemento de tipo cola}

     PROCEDURE Insertar (el:tElemento; VAR c:tCola);
     {PRE: TRUE}
     {POST: Introduce un elemento en la cola por el final}

     {**** Operaciones observadoras-selectoras ****}

     FUNCTION PrimeroCola (c:tCola):tElemento;
     {PRE: Requiere que la cola tenga algun elemento}
     {POST: Devuelve una copia del primer elemento de la cola}

     {**** Operaciones constructoras-no generadoras ****}

     PROCEDURE Eliminar (VAR c:tCola);
     {PRE: Requiere que la cola tenga algun elemento}
     {POST: Elimina el primer elemento de la cola}

     {**** Operaciones observadoras-no selectoras ****}

     FUNCTION EsColaVacia (c:tCola):boolean;
     {PRE:TRUE}
     {POST: Devuelve true si la cola esta vacia, false en caso contrario}

{**************************************************************************
**************************************************************************}

     IMPLEMENTATION
     {A partir de aqu¡ va la implementacion en s¡ de los subprogramas
     que se anuncian en la cabecera}

     {***** Operaciones constructoras-generadoras ****}

     PROCEDURE CrearColaVacia (VAR c:tCola);
     {O(t)=K}
     BEGIN
          c.primero:=NIL;
          c.ultimo:=NIL;
     END;


     PROCEDURE Insertar (el:tElemento; VAR c:tCola);
     {O(t):=K}
     VAR
        nodoAux:tCursor;
     BEGIN
          New(nodoAux);
          nodoAux^.elem:=el;
          nodoAux^.sig:=NIL;
          IF NOT EsColaVacia(c) THEN
             BEGIN
               c.ultimo^.sig:=nodoAux;
               c.ultimo:=nodoAux;
             END
          ELSE
             BEGIN
              c.primero:=nodoAux;
             END;
     END;

     {**** Operaciones observadoras-selectoras ****}

     FUNCTION PrimeroCola (c:tCola):tElemento;
     {O(t)=k)}
     BEGIN
          IF NOT esColaVacia(c) THEN
          BEGIN
               PrimeroCola:=c.primero^.elem;
          END;
     END;

     {**** Operaciones constructoras-no generadoras ****}

     PROCEDURE Eliminar (VAR c:tCola);
     {O(t)=k}
     VAR
     nodoAux:tCursor;
     BEGIN
          IF NOT esColaVacia(c) THEN
          BEGIN
               nodoAux:=c.primero;
               c.primero:= nodoAux^.sig;
               Dispose(nodoAux);
          END;

          {Por si ahora se quedo vacia...}
          IF c.primero =NIL THEN
             c.ultimo:=NIL;
     END;


     {**** Operaciones observadoras-no selectoras ****}

     FUNCTION EsColaVacia (c:tCola):boolean;
     {O(t):=K}
     BEGIN
          EsColaVacia:=c.primero=NIL;
     END;



END.



