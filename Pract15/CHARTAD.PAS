UNIT CharTAD;

INTERFACE

     USES PriTAD;

     TYPE
         tipoCaracter= RECORD
                    clave:tipoPrioridad;
                    info:char;
                    END;

     {Constructoras Generadoras}
     PROCEDURE ConstruirElemento (VAR car:tipoCaracter; clave:tipoPrioridad; info:char);
     {PRE:true}
     {PRE: Construye un elem de tipo caracter con su campo clave
           y su campo de info}

IMPLEMENTATION

     PROCEDURE ConstruirElemento (VAR car:tipoCaracter; clave:tipoPrioridad; info:char);
     {O(t)=1}
     BEGIN
          car.clave:=clave;
          car.info:=info;
     END;

     FUNCTION Prioridad (p:TipoPrioridad):TipoPrioridad;
     BEGIN
     Prioridad := p;
     END;

END.



