{*******************************************************************
 M¢dulo: comunTAD
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 29/11/2003
 Descripci¢n: Unidad que contiene el tipo de datos
              Forma parte de la PRACTICA 10
 *******************************************************************}
 UNIT tPilaPos;
      USES comunTad,tPosTad,tElementoTad;

 INTERFACE
          tElemento=tPosicion;
          tCursor=^tNodo;
          tNodo= RECORD
                 info:tElemento;
                 ant:tCursor;
                 END;
          Tpila=tCursor;


          {*Constructoras generadoras}

    PROCEDURE CrearPilaVacia (VAR pila:tPila);
    {PRE: TRUE}
    {POST: Devuelve una pila vac¡a}

    PROCEDURE Apilar (elem:tElemento; VAR pila:tPila);
    {PRE: TRUE}
    {POST: Introduce un elemento en la pila}


 IMPLEMENTATION


     PROCEDURE CrearPilaVacia (VAR pila:tPila);
     {O(t)=1}
     BEGIN
          pila:= NIL;
     END;

     PROCEDURE Apilar (elem:tElemento; VAR pila:tPila);
     {O(t)=1}
     VAR
     aux:tCursor;
     BEGIN
          NEW(aux);
          aux.^info:=elem;
          aux.^sig:=pila;
          pila.^sig:=aux.sig;
     END;

 END.
