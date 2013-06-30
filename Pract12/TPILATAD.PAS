(* Implementaci¢n DINAMICA del tipo PILA *)

{*******************************************************************
 M¢dulo: Pilas
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 29/11/2003
 Descripci¢n: Unidad que contiene el tipo de datos pila,
              y todas las operaciones que se pueden realizar con este
              tipo.
              [PRµCTICA 10]
 *******************************************************************}

UNIT tPilaTad;

     INTERFACE

     USES elemPilaTAD;
     {Otros lenguajes si permiten el paso de rango y elemento como parametros.
     Como pascal no lo permite, creamos un par de unidades que albergan
     el rango y el tipo de elemento del tad vector}
{**************************************************************************
**************************************************************************}

     TYPE
         tPila=^tNodo;
         tNodo= RECORD
                elem:tElemento;
                sig:tPila;
                END;

     {***** Operaciones constructoras-generadoras ****}

     PROCEDURE CrearPilaVacia (VAR p:tPila);
     {PRE: TRUE}
     {POST: devuelve un elemento de tipo pila}

     PROCEDURE Apilar (el:tElemento; VAR p:tPila);
     {PRE: TRUE}
     {POST: Introduce un elemento en la cima de la pila}

     {**** Operaciones observadoras-selectoras ****}

     FUNCTION Cima (p:tPila):tElemento;
     {PRE: Requiere que la pila tenga algun elemento}
     {POST: Devuelve una copia del elemento que hay en la cima}

     {**** Operaciones constructoras-no generadoras ****}

     PROCEDURE Desapilar (VAR p:tPila);
     {PRE: Requiere que la pila tenga algun elemento}
     {POST: Elimina el elemento que se encuentra en la cima de la pila}

     {**** Operaciones observadoras-no selectoras ****}

     FUNCTION EsPilaVacia (p:tPila):boolean;
     {PRE:TRUE}
     {POST: Devuelve true si la pila esta vacia, false en caso contrario}

{**************************************************************************
**************************************************************************}

     IMPLEMENTATION
     {A partir de aqu¡ va la implementacion en s¡ de los subprogramas
     que se anuncian en la cabecera}

          {***** Operaciones constructoras-generadoras ****}

     PROCEDURE CrearPilaVacia (VAR p:tPila);
     {O(T)=K}
     BEGIN
          p:=NIL;
     END;

     PROCEDURE Apilar (el:tElemento; VAR p:tPila);
     {O(t)=K}
     VAR
     pAux:tPila;
     BEGIN
          New(pAux);
          pAux^.elem:= el;
          pAux^.sig:=p;
          p:=pAux;
     END;


     {**** Operaciones observadoras-selectoras ****}

     FUNCTION Cima (p:tPila):tElemento;
     {O(t)=K}
     BEGIN
          IF NOT EsPilaVacia(p) THEN
             Cima:=p^.elem;
     END;

     {**** Operaciones constructoras-no generadoras ****}

     PROCEDURE Desapilar (VAR p:tPila);
     {O(t)=K}
     VAR
     pAux:tPila;
     BEGIN
          pAux:=p;
          p:=pAux^.sig;
          Dispose(pAux);
     END;


     {**** Operaciones observadoras-no selectoras ****}

     FUNCTION EsPilaVacia (p:tPila):boolean;
     {O(t)=K}
     BEGIN
          EsPilaVacia:=p=NIL;
     END;
END.



