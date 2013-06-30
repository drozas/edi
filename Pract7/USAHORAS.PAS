PROGRAM UsaTadHora;

USES horaTAD;

VAR
hora1, hora2, sumaHora: tHora;
horas1, horas2:tHoras;
min1,min2: tMin;
seg1,seg2: tSeg;
segAux:integer;

BEGIN
     writeln('Introduzca la hora 1 ...');
     writeln('Hora: ');
     readln(horas1);
     writeln('Min: ');
     readln(min1);
     writeln('Seg: ');
     readln(seg1);

     writeln('Introduzca la hora 2 ...');
     writeln('Hora: ');
     readln(horas2);
     writeln('Min: ');
     readln(min2);
     writeln('Seg: ');
     readln(seg2);
{Prueba de constructoras generadoras}
        construirHora(horas1,min1,seg1,hora1);
        construirHora(horas2,min2,seg2,hora2);

{Prueba de observadoras  selectoras...}
     writeln('**********************************************');
     writeln(' HORA 1 : ', dameHora(hora1), ' : ', dameMin(hora1), ' : ', dameSeg(hora1));
     writeln(' HORA 2 : ', dameHora(hora2), ' : ', dameMin(hora2), ' : ', dameSeg(hora2));
     writeln('**********************************************');
{Prueba de observadoras no selectoras...}
        IF enPunto(hora1) THEN
           writeln('La hora 1 es en punto')
        ELSE
            writeln('La hora 1 no es en punto');

        IF enPunto(hora2) THEN
           writeln('La hora 2 es en punto')
        ELSE
            writeln('La hora 2 no es en punto');

        segAux:= distancia(hora1,hora2);
                 writeln('La distancia en seg entre hora1 y hora 2 es : ',segAux);
        segAux:=0;

        IF esPosterior(hora1,hora2) THEN
           writeln('La hora 2 es posterior a la hora 1 ')
        ELSE
            writeln('La hora 1 es posterior a la hora 2');

{Prueba de constructoras no generadoras}
        suma(hora1,hora2,sumaHora);

     writeln(' LA SUMA DE LAS HORAS ES : ', dameHora(sumaHora), ' : ', dameMin(sumaHora), ' : ', dameSeg(sumaHora));

     readln;
END.
