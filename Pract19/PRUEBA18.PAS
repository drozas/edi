PROGRAM prueba18;
USES tGrafoTAD;
VAR
grafo:tipoGrafo;
i,j:integer;
BEGIN

     FOR i:=1 TO 5 DO
     BEGIN
          InsertarNodo(grafo,i);
     END;

     FOR i:=1 TO 30 DO
     BEGIN
          IF cjto3.Pertenece(grafo.mis_nodos,i) THEN
             writeln('Existe el nodo ', i);
     END;



     InsertarArista(grafo,1,2);
     InsertarArista(grafo,1,5);
     InsertarArista(grafo,1,3);
     InsertarArista(grafo,2,3);
     InsertarArista(grafo,3,4);
     InsertarArista(grafo,6,8);
     InsertarArista(grafo,3,5);
     QuitarArista(grafo,3,5);

     FOR i:=1 TO 30 DO
     BEGIN
          IF cjto3.Pertenece(grafo.mis_nodos,i) THEN
          BEGIN
             FOR j:=1 TO 30 DO
             BEGIN
                 IF listpTAd.Pertenece(j, grafo.grafo[i]) THEN
                    writeln('Hay una arista entre', i, ' y ', j);
             END;
          END;
     END;


END.