(* Implementaci¢n con ARRAY de Booleanos del tipo Conjunto *)

{*******************************************************************
 M¢dulo: TConjuntoTAD
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 29/02/2004
 Descripci¢n: Unidad que contiene el tipo de datos conjunto,
              y todas las operaciones que se pueden realizar con este
              tipo.
              [PRµCTICA 13]
 *******************************************************************}

UNIT tConjTad;

     INTERFACE

     USES ElTad;
     {Otros lenguajes si permiten el paso de rango y elemento como parametros.
     Como pascal no lo permite, creamos un par de unidades que albergan
     el rango y el tipo de elemento del tad vector}
{**************************************************************************
**************************************************************************}

     TYPE

         tConj= ARRAY[TElem] OF Boolean;

     {***** Operaciones constructoras-generadoras ****}

     PROCEDURE CrearConjVacio (VAR c:tConj);
     {PRE: TRUE}
     {POST: devuelve un elemento de tipo conj}

     PROCEDURE Poner (el:tElem; VAR c:tConj);
     {PRE: TRUE}
     {POST: Introduce un elemento en el conjunto}

     {**** Operaciones observadoras-selectoras ****}

{     PROCEDURE Elegir (el:tElem; VAR c:tConj; VAR error:boolean );  }
     {PRE: Requiere que el conj tenga algun elemento}
     {POST: Devuelve un elemento del conj elegido aleatoriamente}

     {**** Operaciones constructoras-no generadoras ****}

     PROCEDURE Quitar (el: tElem; VAR c:tConj);
     {PRE: TRUE}
     {POST: Elimina dicho elemento de el conjunto, si esta}

     PROCEDURE Union (c1,c2: tConj; VAR cRes:tConj);
     {PRE: TRUE}
     {POST: Devuelve la union de c1 y c2 en cRes}

     PROCEDURE Interseccion (c1,c2: tConj; VAR cRes:tConj);
     {PRE: TRUE}
     {POST: Devuelve la interseccion de c1 y c2 en cRes}

     PROCEDURE Diferencia (c1,c2: tConj; VAR cRes:tConj);
     {PRE: TRUE}
     {POST: Devuelve la diferencia de c1 y c2 en cRes}


     {**** Operaciones observadoras-no selectoras ****}

     FUNCTION EsCjtoVacio (c:tConj):boolean;
     {PRE:TRUE}
     {POST: Devuelve true si el conj es vacia, false en caso contrario}

     FUNCTION Cardinal (c:tConj):integer;
     {PRE:TRUE}
     {POST: Devuelve el numero de elementos de ese conjunto}

     FUNCTION EsSubconjunto (c1,c2: tConj):boolean;
     {PRE:TRUE}
     {POST: Devuelve true si C1 es subconj de C2}

     FUNCTION Pertenece (el:tElem; c:tConj):boolean;
     {PRE:TRUE}
     {POST: Devuelve true si el pertenece al connjunto}

{**************************************************************************
**************************************************************************}

     IMPLEMENTATION
     {A partir de aqu¡ va la implementacion en s¡ de los subprogramas
     que se anuncian en la cabecera}

     {***** Operaciones constructoras-generadoras ****}

     PROCEDURE CrearConjVacio (VAR c:tConj);
     {O(t)=K}
     VAR
     i:tElem;
     BEGIN
          FOR i:=PRIMERELEM TO ULTIMOELEM DO
              c[i]:=FALSE;

          Randomize; {Para utilizarlo luego en Elegir}
     END;


     PROCEDURE Poner (el:tElem; VAR c:tConj);
     {O(T)=k}
     BEGIN
          c[el]:=TRUE;
     END;

     {**** Operaciones observadoras-selectoras ****}

     PROCEDURE Elegir(c:tConj; VAR el:tElem; VAR error:boolean);
     (* COMPLEJIDAD: O(n) *)
     VAR
       posicion,i,cont: Integer;
     BEGIN
        cont:=1;
        IF esConjVacio(c) THEN
           error:=TRUE
        ELSE
        BEGIN

          REPEAT
           posicion:=RANDOM(Ord(UltimoElemento)-Ord(PrimerElemento)+1);
           elemento:= ElTad(Ord(PrimerElemento)+posicion);
           cont:=cont+1
           UNTIL Pertenece(conjunto,elemento) OR (cont=400)
        END;
     END;


     PROCEDURE EscribirCjto (c:tConj);
     {O(t)=k}
     VAR
     elAux:tElem;
     BEGIN


     {**** Operaciones constructoras-no generadoras ****}

     PROCEDURE Quitar (el: tElem; VAR c:tConj);
     {O(t)=K}
     BEGIN
          c[el]:=FALSE;
     END;

     PROCEDURE Union (c1,c2: tConj; VAR cRes:tConj);
     {O(T)=Cardinal}
     VAR
     i:tElem;
     BEGIN
          FOR i:=PRIMERELEM TO ULTIMOELEM DO
          BEGIN
               IF c1[i]=TRUE OR c2[i]=TRUE THEN
                  cRes[i]:=TRUE;
          END;
     END;

     PROCEDURE Interseccion (c1,c2: tConj; VAR cRes:tConj);
     {O(T)=K}
     VAR
     i:tElem;
     BEGIN
          FOR i:=PRIMERELEM TO ULTIMOELEM DO
          BEGIN
               IF c1[i]=TRUE AND c2[i]=TRUE THEN
                  cRes[i]:=TRUE;
          END;
     END;

     PROCEDURE Diferencia (c1,c2: tConj; VAR cRes:tConj);
     {O(T)=cArdinal}
     VAR
     i:tElem;
     BEGIN
          FOR i:=PRIMERELEM TO ULTIMOELEM DO
          BEGIN
               IF c1[i]=TRUE AND c2[i]=FALSE THEN
                  cRes:=TRUE;
          END;

     {**** Operaciones observadoras-no selectoras ****}

     FUNCTION EsCjtoVacio (c:tConj):boolean;
     {O(T)=Cardinal}
     VAR
     i:tElem;
     hayAlguno:tElem;
     BEGIN
          hayAlguno:=FALSE;
          i:=PRIMERELEM;
          WHILE NOT hayAlguno AND i<=ULTIMOELEM DO
          BEGIN
               IF c[i]=TRUE THEN
                  hayAlguno:=TRUE;

               i:=succ(i);
          END;

     END;

     FUNCTION Cardinal (c:tConj):integer;
     {O(t)=n}
     VAR
     nAux, i:integer;
     BEGIN
          nAux:=0;

          {PRIMERELEM Y ULTIMOELEM  son constantes albergadas en TElemConj;
          recorremos todo el rango de ese tipo y comparamos todos con todos
          porque dentro de ese tipo si hay una ordinalidad}

          FOR i:= PRIMERELEM TO ULTIMOELEM DO
          BEGIN
               IF c[i]=TRUE THEN
                  nAux:=nAux+1;
          END;

          Cardinal:=nAux;
     END;

     FUNCTION EsSubconjunto (c1,c2: tConj):boolean;
     {O(t)=n}
     VAR
     estaEseEl:boolean;
     BEGIN
          estaEseEl:=TRUE;

          FOR i:=PRIMERELEM TO ULTIMOELEM DO
              IF c2[i]=TRUE AND c1[i]=FALSE THEN
                 estaEseEl:=FALSE;

          EsSubconjunto:=EstaEseEl;
     END;

     FUNCTION Pertenece (el:tElem; c:tConj):boolean;
     {O(t)=k)  }
     BEGIN
          Pertenece:= c[el];
     END;

END.