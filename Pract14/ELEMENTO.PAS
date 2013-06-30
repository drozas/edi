UNIT Elemento;
INTERFACE
USES PriTAD;

TYPE TipoElemento=RECORD
     clave:TipoPrioridad;
     info:Integer;
    END;

FUNCTION Prioridad (p:TipoPrioridad):TipoPrioridad;
PROCEDURE CrearElementoVacio (VAR e:TipoElemento);

IMPLEMENTATION

FUNCTION Prioridad (p:TipoPrioridad):TipoPrioridad;
BEGIN
     Prioridad := p;
END;

PROCEDURE CrearElementoVacio (VAR e:TipoElemento);
BEGIN
     e.clave := 0;
END;

END.