UNIT THeapAux;


INTERFACE

USES ELEMENTO,PRITAD,POSTAD;

CONST
MAX_ELEMENTO=1024;

TYPE TipoHeapAux=RECORD
     tam:Integer;
     elem: ARRAY[0..MAX_ELEMENTO] OF TipoElemento;
    END;

PROCEDURE CrearHeapVacio(VAR c:TipoHeapAux);

FUNCTION EsHeapVacio(VAR c:TipoHeapAux):Boolean;

FUNCTION EsHeapLleno(VAR c:TipoHeapAux): Boolean;

FUNCTION TieneHijosNodoPos(VAR c:TipoHeapAux;i:TPosicion):Boolean;

FUNCTION TieneHermanoNodoPos(VAR c:TipoHeapAux;i:TPosicion):Boolean;

PROCEDURE InsertarUltimoNodo(VAR c:TipoHeapAux;e:TipoElemento);

PROCEDURE EliminarUltimoNodo(VAR c:TipoHeapAux);

FUNCTION DamePosNodoUltimo(VAR c:TipoHeapAux):TPosicion;

FUNCTION DamePosNodoPrimero(VAR c:TipoHeapAux):TPosicion;

FUNCTION DamePosNodoPadre(VAR c:TipoHeapAux;i:TPosicion):TPosicion;

FUNCTION DamePosNodoHijoIzq(VAR c:TipoHeapAux;i:TPosicion):TPosicion;

FUNCTION DamePosNodoHijoDer(VAR c:TipoHeapAux;i:TPosicion):TPosicion;

PROCEDURE DameValorNodo(VAR c:TipoHeapAux;i:TPosicion;VAR e:TipoElemento);

PROCEDURE DameValorPrimerNodo(VAR c:TipoHeapAux;VAR e:TipoElemento);

PROCEDURE PonValorNodo(VAR c:TipoHeapAux;i:TPosicion;e:TipoElemento);

IMPLEMENTATION
PROCEDURE CrearHeapVacio(VAR c:TipoHeapAux);
BEGIN
     {c.elem[0].clave:=0}
     CrearElementoVacio(c.elem[0]);
     c.tam:=0;
END;

FUNCTION EsHeapVacio(VAR c:TipoHeapAux):Boolean;
BEGIN
     EsHeapVacio := c.tam = 0;
END;

FUNCTION EsHeapLleno(VAR c:TipoHeapAux): Boolean;
BEGIN
     EsHeapLleno := c.tam = MAX_ELEMENTO;
END;

FUNCTION TieneHijosNodoPos(VAR c:TipoHeapAux;i:TPosicion):Boolean;
BEGIN
     TieneHijosNodoPos := (i*2) <= c.tam;
END;

FUNCTION TieneHermanoNodoPos(VAR c:TipoHeapAux;i:TPosicion):Boolean;
BEGIN
{Si tiene hermano lo tiene q tener en la siguiente posicion}
{Los impares siempre tienen hermanos}
    if i mod 2 = 0 then
        TieneHermanoNodoPos := (i+1) <= c.tam
    else
        TieneHermanoNodoPos := TRUE;
END;

PROCEDURE InsertarUltimoNodo(VAR c:TipoHeapAux;e:TipoElemento);
BEGIN
     if c.tam < MAX_ELEMENTO THEN
     BEGIN
          c.elem[c.tam+1]:=e;
          c.tam := c.tam + 1;
     END
     ELSE
         Writeln('El arbol esta totalmente completo');

END;

PROCEDURE EliminarUltimoNodo(VAR c:TipoHeapAux);
BEGIN
     if Not EsHeapVacio(c) THEN
        {CrearElementoVacio(c.elem[c.tam]);}
        c.tam := c.tam - 1;
END;

FUNCTION DamePosNodoUltimo(VAR c:TipoHeapAux):TPosicion;
BEGIN
     DamePosNodoUltimo := c.tam;
END;

FUNCTION DamePosNodoPrimero(VAR c:TipoHeapAux):TPosicion;
BEGIN
     IF NOT esHeapVacio(c) then
        DamePosNodoPrimero:=1
     else
         writeln('El arbol esta vacio');
END;


FUNCTION DamePosNodoPadre(VAR c:TipoHeapAux;i:TPosicion):TPosicion;
BEGIN
     IF NOT esHeapVacio(c) then
          DamePosNodoPadre:= i DIV 2
     ELSE
         writeln('El arbol esta vacio');
END;


FUNCTION DamePosNodoHijoIzq(VAR c:TipoHeapAux;i:TPosicion):TPosicion;
BEGIN
     IF NOT esHeapVacio(c) then
          DamePosNodoHijoIzq := 2*i
     ELSE
         writeln('El arbol esta vacio');

END;


FUNCTION DamePosNodoHijoDer(VAR c:TipoHeapAux;i:TPosicion):TPosicion;
BEGIN
     IF NOT esHeapVacio(c) then
             DamePosNodoHijoDer := 2 * i + 1
     ELSE
         writeln('El arbol esta vacio');


END;


PROCEDURE DameValorNodo(VAR c:TipoHeapAux;i:TPosicion;VAR e:TipoElemento);
BEGIN
     IF (i >= 0) AND (i <= c.tam) THEN
        e := c.elem[i];
END;


PROCEDURE DameValorPrimerNodo(VAR c:TipoHeapAux;VAR e:TipoElemento);
BEGIN
     IF NOT esHeapVacio(c) THEN
        e := c.elem[1];
END;


PROCEDURE PonValorNodo(VAR c:TipoHeapAux;i:TPosicion;e:TipoElemento);
BEGIN
     IF (i >=0) AND (i <= c.tam) THEN
        c.elem[i]:= e;
END;


END.