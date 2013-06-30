PROGRAM UsaVector;

USES Vectores, RangoTAD, ElemTAD;

VAR
v:tVector;

BEGIN

     {Primero creamos el vector}
     VectorVacio(v);
     {Probamos funciones de asignacion}
     Asignar(v,3,1);
     Asignar(v,1,2);
     writeln(Valor(v,3));
     writeln(Valor(v,1));
     Modificar(v,doble);
     Modificar(v,triple);
     writeln(Valor(v,3));
     writeln(Valor(v,1));
     readln;
END.