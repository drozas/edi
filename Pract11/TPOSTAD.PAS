{*******************************************************************
 M¢dulo: comunTAD
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 29/11/2003
 Descripci¢n: Unidad que contiene el tipo de datos
              Forma parte de la PRACTICA 10
 *******************************************************************}
 UNIT tPosTad;
      USES comunTad;

 INTERFACE
          TYPE
              tPosicion= RECORD
                         fila: 1..NUM_FILAS;
                         col: 1.. NUM_COLUMNAS;
                         END;

 {*Operaciones generadoras constructoras*}

    PROCEDURE crearPosicion (fila,col: integer; VAR pos:tPosicion);
    {PRE: TRUE}
    {POST: Devuelve una posicion vacia}

 {*Observadoras selectoras*}
    FUNCTION dameFila (VAR pos:tPosicion): integer;
    {PRE: TRUE}
    {POST: devuelve la fila de esa posicion}

    FUNCTION dameCol (VAR pos:tPosicion):integer;
    {PRE: TRUE}
    {POST: devuelve la columna de esa posicion}


 IMPLEMENTATION

    PROCEDURE crearPosicion (VAR pos:tPosicion);
    {O(T)=1}
    BEGIN
         pos.fila:= fila;
         pos.col:= col;
    END;

    FUNCTION dameFila (VAR pos:tPosicion): integer;
    {O(t)=1}
    BEGIN
         dameFila:=pos.fila;
    END;

    FUNCTION dameCol (VAR pos:tPosicion):integer;
    {O(t)=1}
    BEGIN
         dameCol:=pos.col;
    END;


 END.
