UNIT POSTAD;
INTERFACE
         CONST MAX_ELEMENTOS = 1024;
TYPE
         TPosicion = 0 .. MAX_ELEMENTOS;

         FUNCTION IgualPosicion(p1,p2:Tposicion):Boolean;
         FUNCTION MenorPosicion(p1,p2:Tposicion):Boolean;
IMPLEMENTATION

         FUNCTION IgualPosicion(p1,p2:Tposicion):Boolean;
         BEGIN
              IgualPosicion:= p1 = p2;
         END;

         FUNCTION MenorPosicion(p1,p2:Tposicion):Boolean;
         BEGIN
              MenorPosicion := p1 < p2;
         END;
END.
