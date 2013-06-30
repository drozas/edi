{*******************************************************************
 M¢dulo: grafoTAD
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 29/11/2003
 Descripci¢n: Unidad que contiene el tipo de datos
              Forma parte de la PRACTICA 18
 *******************************************************************}
 UNIT tGrafoTAD;
INTERFACE
      USES listpTAD, Cjto3;



TYPE
        (*TipoElemento=TipoPermutacion;
        TipoCursor=^TipoNodo;
        TipoNodo = RECORD
                 info: TipoElemento;
                 sig:  TipoCursor;
                 END;

        TipoLista = TipoCursor*)
        tNodo=TipoLista;
        tipoGrafo= RECORD
               grafo: ARRAY[1..N_NODOS] OF tNodo;
               mis_nodos: tipoConjunto;
               END;

PROCEDURE CrearGrafoVacio (VAR grafo:tipoGrafo);
PROCEDURE InsertarNodo (VAR grafo: tipoGrafo; nodo:tipoElemento);
PROCEDURE QuitarNodo (VAR grafo: tipoGrafo; nodo:tipoElemento);
PROCEDURE InsertarArista (VAR grafo: tipoGrafo; nodo1,nodo2: tipoElemento);
PROCEDURE QuitarArista (VAR grafo: tipoGrafo; nodo1,nodo2: tipoElemento);

IMPLEMENTATION

 PROCEDURE CrearGrafoVacio (VAR grafo:tipoGrafo);
 VAR
 i:integer;
 BEGIN

      FOR i:=1 TO N_NODOS DO
      BEGIN
           DestruirLista(grafo.grafo[i]^.sig);
           grafo.grafo[i]^.info:=i;
      END;

 END;

PROCEDURE InsertarNodo (VAR grafo: tipoGrafo; nodo:tipoElemento);
BEGIN
   Poner(grafo.mis_nodos,nodo);
END;

PROCEDURE QuitarNodo (VAR grafo: tipoGrafo; nodo:tipoElemento);
VAR
i:integer;
BEGIN
     IF Cjto3.Pertenece(grafo.mis_nodos,nodo) THEN
     BEGIN
        FOR i:=1 TO N_NODOS DO
        BEGIN
             IF listPTAD.Pertenece(nodo, grafo.grafo[i]) THEN
                BorrarElemento(grafo.grafo[i],nodo);
        END;
        Quitar(grafo.mis_nodos,nodo);
     END
     ELSE
         writeln('El nodo no existe, asinque no lo puedo quitar');
END;

PROCEDURE InsertarArista (VAR grafo: tipoGrafo; nodo1,nodo2: tipoElemento);
BEGIN
     IF Cjto3.Pertenece(grafo.mis_nodos, nodo1) AND Cjto3.Pertenece(grafo.mis_nodos, nodo2) THEN
     BEGIN
          InsertaFinal(nodo1, grafo.grafo[nodo2]);
          InsertaFinal(nodo2, grafo.grafo[nodo1]);
     END
     ELSE
         writeln('Alguno de los nodos, o los dos, no existen');
END;

PROCEDURE QuitarArista (VAR grafo: tipoGrafo; nodo1,nodo2: tipoElemento);

BEGIN
     IF listPTAD.Pertenece(nodo1, grafo.grafo[nodo2]) AND
     Cjto3.Pertenece(grafo.mis_nodos, nodo1) AND
     Cjto3.Pertenece(grafo.mis_nodos, nodo2) THEN
     BEGIN
          BorrarElemento(grafo.grafo[nodo1],nodo2);
          BorrarElemento(grafo.grafo[nodo2],nodo1);
     END
     ELSE
         writeln('O no existe la arista, o no existe alguno de los nodos');
END;


END.