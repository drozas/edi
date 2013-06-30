UNIT Cjto3;

INTERFACE

  CONST
     MAX_ELEM=30;
  TYPE
     TipoElemento = Integer;
     TipoConjunto = RECORD
                      vector: ARRAY[1..MAX_ELEM] OF TipoElemento;
                      cardinalidad: 0..MAX_ELEM;
                    END;
                 

  (* CONSTRUCTORAS GENERADORAS *)

     PROCEDURE CrearConjuntoVacio(VAR conjunto:TipoConjunto); 
     (* POST: conjunto = { } *)

     PROCEDURE Poner (VAR conjunto:TipoConjunto; elemento: TipoElemento);
     (* POST: conjunto = conjunto v {elemento} *)


  (* OBSERVADORAS SELECTORAS *)

     PROCEDURE Elegir(conjunto:TipoConjunto; VAR elemento:TipoElemento);
     (* PRE: NOT EsConjuntoVacio(conjunto) *)
     (* POST: resultado = elemento y Pertenece(elemento,conjunto) *)

  (* OBSERVADORAS NO SELECTORAS *)

     FUNCTION EsConjuntoVacio(conjunto:TipoConjunto): BOOLEAN;
     (* POST: resultado = (conjunto = { }) *)

     FUNCTION Pertenece(conjunto:TipoConjunto; elemento: TipoElemento): BOOLEAN;
     (* POST: resultado = elemento E conjunto *)

     FUNCTION Incluido(conjunto, conjunto2:TipoConjunto): BOOLEAN;
     (* POST: resultado = conjunto subconjunto de conjunto2 *)

(* CONSTRUCTORAS NO GENERADORAS *)

     PROCEDURE Quitar (VAR conjunto:TipoConjunto; elemento: TipoElemento);
     (* POST: conjunto = conjunto - {elemento} *)


     PROCEDURE Union (conjunto, conjunto2: TipoConjunto;VAR conj_final: TipoConjunto);
     (* POST: conj-final = conjunto U conjunto2  *)

     PROCEDURE Interseccion (conjunto, conjunto2: TipoConjunto;VAR conj_final: TipoConjunto);
     (* POST: conj_final = conjunto n conjunto2 *)

     PROCEDURE Diferencia (conjunto, conjunto2: TipoConjunto;VAR conj_final: TipoConjunto);
     (* POST: conj-final = conjunto - conjunto2  *)


IMPLEMENTATION

  (* CONSTRUCTORAS GENERADORAS *)

     PROCEDURE CrearConjuntoVacio(VAR conjunto:TipoConjunto);
     (* COMPLEJIDAD: O(1) *)
     BEGIN
      conjunto.cardinalidad:=0;
      Randomize;
     END;

     PROCEDURE Poner (VAR conjunto:TipoConjunto; elemento: TipoElemento);
     (* COMPLEJIDAD: O(cardinalidad) *)
     VAR
       i: 0..MAX_ELEM;
       encontrado: Boolean;
     BEGIN
           encontrado:=FALSE;
           i:=0;
           
           WHILE (i < conjunto.cardinalidad) AND NOT encontrado DO
            BEGIN
              i:= i + 1;
              encontrado:= conjunto.vector[i]=elemento
            END;
            
           IF NOT encontrado AND (conjunto.cardinalidad< MAX_ELEM) THEN
            BEGIN
              conjunto.cardinalidad:=conjunto.cardinalidad+1;
              conjunto.vector[conjunto.cardinalidad]:=elemento
            END
     END;

  (* OBSERVADORAS SELECTORAS *)

     PROCEDURE Elegir(conjunto:TipoConjunto; VAR elemento:TipoElemento);
     (* COMPLEJIDAD: O(1) *)
     BEGIN
         elemento:=conjunto.vector[RANDOM(conjunto.cardinalidad) +1]
     END;

     FUNCTION Incluido(conjunto, conjunto2:TipoConjunto): BOOLEAN;
     (* COMPLEJIDAD: O(cardinalidad(conjunto)*cardinalidad(conjunto2))  *)
     VAR
       i:0..MAX_ELEM;
       encontradoEn2:Boolean;
     BEGIN
        encontradoEn2:=TRUE;
        i:=0;
        WHILE (i< conjunto.cardinalidad) AND encontradoEn2 DO
         BEGIN
          i:=i+1;
          IF NOT Pertenece(conjunto2,conjunto.vector[i]) THEN
 	           encontradoEn2:= FALSE
         END;
         
        Incluido:=encontradoEn2
     END;


  (* OBSERVADORAS NO SELECTORAS *)

     FUNCTION EsConjuntoVacio(conjunto:TipoConjunto): BOOLEAN;
     (* COMPLEJIDAD: O(1) *)
     BEGIN
        EsConjuntoVacio:= conjunto.cardinalidad=0
     END;

     FUNCTION Pertenece(conjunto:TipoConjunto; elemento: TipoElemento): BOOLEAN;
     (* COMPLEJIDAD: O(cardinalidad) *)
     VAR
       i:0..MAX_ELEM;
       encontrado:Boolean;
     BEGIN
        encontrado:=FALSE;
        i:=0;
        WHILE (i< conjunto.cardinalidad) AND NOT encontrado DO
         BEGIN
          i:=i+1;
          encontrado:= conjunto.vector[i]=elemento
         END;
	    
	 Pertenece:= encontrado
     END;


  (* CONSTRUCTORAS NO GENERADORAS *)

     PROCEDURE Quitar (VAR conjunto:TipoConjunto; elemento: TipoElemento);
     (* COMPLEJIDAD: O(cardinalidad) *)
     VAR
       i:0..MAX_ELEM;
       encontrado:Boolean;
     BEGIN
        encontrado:=FALSE;
        i:=0;
        WHILE (i< conjunto.cardinalidad) AND NOT encontrado DO
         BEGIN
          i:=i+1;
          encontrado:= conjunto.vector[i]=elemento
         END;
	    
        IF encontrado THEN
         BEGIN
           conjunto.vector[i]:=conjunto.vector[conjunto.cardinalidad];
           conjunto.cardinalidad:=conjunto.cardinalidad -1
         END
     END;


     PROCEDURE Union (conjunto, conjunto2: TipoConjunto;VAR conj_final: TipoConjunto);
(* COMPLEJIDAD: O(cardinalidad(conjunto2)*Max(cardinalidad(conjunto),cardinalidad(conjunto2)))  *)
     VAR
       i:1..MAX_ELEM;
       encontradoEn2:Boolean;
     BEGIN
        CrearConjuntoVacio(conj_final);

        FOR i:= 1 TO conjunto.cardinalidad DO
          conj_final.vector[i]:= conjunto.vector[i];

        conj_final.cardinalidad:= conjunto.cardinalidad;

        FOR i:= 1 TO conjunto2.cardinalidad DO
          Poner(conj_final, conjunto2.vector[i]);

     END;

     PROCEDURE Interseccion (conjunto, conjunto2: TipoConjunto;VAR conj_final: TipoConjunto);
     (* O(cardinalidad(conjunto)*cardinalidad(conjunto2)  *)
     VAR
       i:1..MAX_ELEM;
     BEGIN
        CrearConjuntoVacio(conj_final);

        FOR i:= 1 TO conjunto.cardinalidad DO
          IF Pertenece(conjunto2, conjunto.vector[i]) THEN
              Poner(conj_final, conjunto.vector[i]);
     END;

     PROCEDURE Diferencia (conjunto, conjunto2: TipoConjunto;VAR conj_final: TipoConjunto);
     (*COMPLEJIDAD: O(cardinalidad(conjunto)*Max(cardinalidad(conjunto),cardinalidad(conjunto2)))  *)
     VAR
       i:1..MAX_ELEM;
     BEGIN
        CrearConjuntoVacio(conj_final);

        FOR i:= 1 TO conjunto.cardinalidad DO
          IF NOT Pertenece(conjunto2, conjunto.vector[i]) THEN
              Poner(conj_final, conjunto.vector[i]);
     END;

END.
