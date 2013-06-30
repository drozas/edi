{********************************************************************
*                                                                   *
* Módulo: ColaPH                                                    *
* Tipo:	  Programa()  Interfaz-Implementacion TAD (X) Otros()      *
* Descripción: Interfaz e Implementación del TAD Cola con prioridad *
* implementada con HEAPs(monticulos)                                *
*                                                                   *
*********************************************************************}
UNIT ColaPH;

INTERFACE

USES ELEMENTO;

CONST
 MAX_ELEMENTO=1024;

TYPE TipoColaPrioridad=RECORD
 tam:Integer;
 elem: ARRAY[0..MAX_ELEMENTO] OF TipoElemento;
END;

 (* CONSTRUCTORAS GENERADORAS *)

 PROCEDURE CrearColaVacia(VAR c:TipoColaPrioridad);
 (* POST: "Crea una cola sin elementos" *)

 PROCEDURE Insertar(VAR c:TipoColaPrioridad; e:TipoElemento);
 (* PRE: "La cola no esta llena"
    POST: "Construye una cola, con elemento como ultimo *)

 (* OBSERVADORAS NO SELECTORAS *)

 FUNCTION EsColaVacia(VAR c:TipoColaPrioridad): Boolean;
 (* POST: resultado = "Decide si una cosa es o no vacia"*)

 (* OBSERVADORAS SELECTORAS *)

 PROCEDURE PrimeroCola(VAR c:TipoColaPrioridad;VAR e:TipoElemento);
 (* PRE: NOT EsColaVacia(cola)
    POST: resultado= "Primer elemento de la cola" *)

 (* CONSTRUCTORAS NO GENERADORAS *)

 PROCEDURE Eliminar(VAR c:TipoColaPrioridad);
 (* PRE: NOT ESColaVacia(cola)
    POST: "Devuelve la cosa resultante de eliminar su primer elemento *)


IMPLEMENTATION

 (* CONSTRUCTORAS GENERADORAS *)

 PROCEDURE CrearColaVacia(VAR c:TipoColaPrioridad);
 (* Complejidad: O(1) *)
 BEGIN
  c.tam:=0;
  c.elem[0].clave:=0;
 END;

 PROCEDURE Insertar(VAR c:TipoColaPrioridad; e:TipoElemento);
 (* Complejidad: O(log(n)) *)
 VAR
  i:Integer;
 BEGIN
      IF c.tam= MAX_ELEMENTO THEN
         Writeln('Insertar: Cola llena')
      ELSE
      BEGIN
           c.tam:=c.tam+1;
           i:=c.tam;
           WHILE (c.elem[i div 2].clave > e.clave) DO
           BEGIN
                c.elem[i]:=c.elem[i div 2];
                i:=i div 2
           END; (*WHILE*)
           c.elem[i]:=e
      END (*ELSE*)
 END;

 (* OBSERVADORAS NO SELECTORAS *)

 FUNCTION EsColaVacia(VAR c:TipoColaPrioridad): Boolean;
 (* Complejidad: O(1) *)
 BEGIN
  EsColaVacia:= c.tam=0
 END;

 (* OBSERVADORAS SELECTORAS *)

 PROCEDURE PrimeroCola(VAR c:TipoColaPrioridad;VAR e:TipoElemento);
 (* Complejidad: O(1) *)
 BEGIN
  IF NOT EsColaVacia(c) THEN
   e:=c.elem[1]
  ELSE
   Writeln('PrimeroCola: Cola vacia')
  END;

 (* CONSTRUCTORAS NO GENERADORAS *)

 PROCEDURE Eliminar(VAR c:TipoColaPrioridad);
 (* Complejidad: O(log(n)) *)
 VAR
  i,hijo: Integer;
  ultimoElem: TipoElemento;
  pararFilt:Boolean;
 BEGIN
      IF c.tam=0 THEN
           Writeln('Eliminar: Cola vacia')
      ELSE
      BEGIN
           ultimoElem:=c.elem[c.tam];
           c.tam:=c.tam-1;
           i:=1;
           pararFilt:=FALSE;
           WHILE (i*2<=c.tam) AND NOT pararFilt DO
           BEGIN
                hijo:=i*2; {buscamos hijo menor}
                IF hijo<>c.tam THEN
                   IF c.elem[hijo+1].clave<c.elem[hijo].clave THEN
                      hijo:=hijo+1;

                IF ultimoElem.clave>c.elem[hijo].clave THEN {filtrar}
                BEGIN
                     c.elem[i]:=c.elem[hijo];
                     i:=hijo
                END
                ELSE {fuerza la salida del while}
                     pararFilt:=true
           END; {WHILE}
           c.elem[i]:=ultimoElem;
      END; {IF}
 END;

END.