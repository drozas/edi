{*******************************************************************
 M¢dulo: listas simples dinamicas
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 9/1/2004
 Descripci¢n: Unidad que contiene el tipo de datos lista simple
              dinamica, y todas las operaciones que se pueden
              realizar con este tipo.
              [PRµCTICA 9]
 *******************************************************************}

 UNIT listaSE
      INTERFACE
      USES elemTAD
     {Otros lenguajes si permiten el paso de rango y elemento como parametros.
     Como pascal no lo permite, creamos un par de unidades que albergan
     el rango y el tipo de elemento del tad vector}
{**************************************************************************
**************************************************************************}

     TYPE
         tLista= ^tNodo;
         tNodo= RECORD
                info: tElemento;
                sig: tCursor;
                END;

     {***** Operaciones constructoras-generadoras ****}

     PROCEDURE CrearVacia (VAR l:tLista);
     {PRE: true}
     {POST: Crear una lista vacia}

     PROCEDURE Construir (el: tElemento; VAR l:tLista);
     {PRE: true}
     {POST: Introduce un elemento en la lista por el principio}

     {**** Operaciones observadoras-selectoras ****}

     FUNCTION Primero (VAR l:tLista): tElemento;
     {PRE: que la lista no este vacia}
     {POST: devuelve el primer valor de la lista}

     PROCEDURE Resto (VAR l:tLista; VAR res:tLista);
     {PRE: que la lista tengo al menos dos elementos}
     {POST: devuelve toda la lista excepto el primer elemento}

     {**** Operaciones constructoras-no generadoras ****}

     FUNCTION EsVacia (VAR l:tLista):boolean;
     {PRE: true}
     {POST: devuelve true si la lista es vacia, y false si no lo est }

     FUNCTION Longitud (VAR l:tLista):integer;
     {PRE: true}
     {POST: Devuelve el numero de elementos de la lista}

     FUNCTION Ultimo (VAR l: tLista): tElemento;
     {PRE: que la lista no sea vacia}
     {POST: devuelve el ultimo elemento de la lista}

     FUNCTION Pertenece (el:tElemento; VAR: l:tLista):boolean;
     {PRE: true}
     {POST: devuelve true si el elemento esta dentro de la lista
     y false en caso contrario}
     {POST: devuelve true si el elemento pertenece a la lista;
            y false en caso contrario}

     {**** Operaciones observadoras-no selectoras ****}

     PROCEDURE Concatenar (VAR l1,l2:tLista);
     {PRE: true}
     {POST: Devuelve el resultado de unir las dos listas. Se devuelve la
     concatenacion en la l1}

     PROCEDURE BorrarElemento (el: tElemento; VAR l:tLista);
     {PRE: true}
     {POST: Borramos un elemento de la lista si existe}

     PROCEDURE InsertarFinal (el: tElemento; VAR l:tLista);
     {PRE: true}
     {POST: Introduce un elemento en la lista por el final}


{**************************************************************************
**************************************************************************}

     IMPLEMENTATION
     {A partir de aqu¡ va la implementacion en s¡ de los subprogramas
     que se anuncian en la cabecera}

     FUNCTION CrearNodo (el:tElemento, sig:tCursor):tCursor;
     VAR
     pAux: tCursor;
     BEGIN
          New(pAux);
          pAux^.info:=el;
          pAux^.sig:=sig;
     END;



     PROCEDURE CrearVacia (VAR l:tLista);
     {O(t)=1}
     BEGIN
          l:=NIL
     END;


     PROCEDURE Construir (el: tElemento; VAR l:tLista);
     {O(t)=1}
     VAR
     pAux: tLista;
     BEGIN
          pAux:= CrearNodo(el, NIL);



     {PRE: true}
     {POST: Introduce un elemento en la lista por el principio}
