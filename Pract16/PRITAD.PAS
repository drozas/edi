UNIT PriTAD;

INTERFACE
TYPE
    TipoPrioridad = real;{enumerados no admiten subrangos de reales}

    FUNCTION IgualPrioridad(p1,p:TipoPrioridad):Boolean;

    FUNCTION MenorPrioridad(p1,p:TipoPrioridad):Boolean;

IMPLEMENTATION

FUNCTION IgualPrioridad(p1,p:TipoPrioridad):Boolean;
BEGIN
     IgualPrioridad := p1 = p;
END;

FUNCTION MenorPrioridad(p1,p:TipoPrioridad):Boolean;
BEGIN
     MenorPrioridad := p1 < p;
END;


END.

