UNIT COMUNTAD;
INTERFACE
CONST
  N= 3;  (* Num de componenentes que forman una solución *)
  M= 3;   (* Num de componentes candidatas en una etapa      *)
TYPE
   TipoRangoPermutacion = 1..N;
   TipoComponente = TipoRangoPermutacion;
   TipoPermutacion = ARRAY [TipoRangoPermutacion] OF
                                   TipoComponente;       (* Vector de componentes *)
   FUNCTION Distinto(p1,p2:TipoPermutacion):Boolean;

IMPLEMENTATION
   FUNCTION Distinto(p1,p2:TipoPermutacion):Boolean;
     VAR
        j:1..M+1;
        iguales:Boolean;
     BEGIN
        iguales:=TRUE;
        j:=1;
        WHILE (j<=M) AND iguales DO
         BEGIN
           iguales:=(p1[j]=p2[j]);
           j:=j+1
         END;
         Distinto:= NOT iguales
     END;
END.