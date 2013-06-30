{*******************************************************************
 M¢dulo: vectores
 Tipo:   Programa()     Interfaz-Implementacion TAD(X)   Otros()
 Autor/es: David Rozas
 Fecha de actualizaci¢n: 29/11/2003
 Descripci¢n: Unidad que contiene el tipo de datos vectores, y
              todas las operaciones que se pueden realizar con este
              tipo.
              [PRµCTICA 6]
 *******************************************************************}

UNIT vectores;

     INTERFACE

     USES elemTAD, rangoTAD;
     {Otros lenguajes si permiten el paso de rango y elemento como parametros.
     Como pascal no lo permite, creamos un par de unidades que albergan
     el rango y el tipo de elemento del tad vector}
{**************************************************************************
**************************************************************************}

     TYPE
     {El tipo array lo vamos a implementar mediante un array de registros.
     El registro sera el tipo celda; con un campo elemento, y otro booleano
     que nos indica si en esa celda hay o no elemento}

         tCelda= RECORD
                 elem: tElemento;
                 lleno: boolean;
                 END;

         tVector= ARRAY [tRango] OF tCelda;


     {***** Operaciones constructoras-generadoras ****}

     PROCEDURE VectorVacio (VAR vector:tVector);
     {PRE: true}
     {POST: Devuelve un vector vacio}

     PROCEDURE Asignar (VAR vector:tVector; pos:tRango; el:tElemento);
     {PRE: true}
     {POST: Asigna el elemento el en la posicion pos del vector}

     {**** Operaciones observadoras-selectoras ****}

     FUNCTION Valor (VAR vector:tVector; pos:tRango): tElemento;
     {PRE: que la celda este llena}
     {POST: devuelve el valor de esa celda}

     {**** Operaciones constructoras-no generadoras ****}

     FUNCTION Existe (VAR vector:tVector; pos:tRango):boolean;
     {PRE: true}
     {POST: devuelve true si la celda esta llena, y false si esta vacia}

     {**** Operaciones observadoras-no selectoras ****}

     PROCEDURE Modificar (VAR vector:tVector; modificaElemento:tFuncionModificar);
     {PRE: true}
     {POST: modifica los valores de todos los elementos existentes si la
     celda esta llena. El tipo de modificacion se pasa en el programa
     principal; YA QUE ESTAMOS USAND0 UN PROCEDIMIENTO COMO PARAMETRO}
{**************************************************************************
**************************************************************************}

     IMPLEMENTATION
     {A partir de aqu¡ va la implementacion en s¡ de los subprogramas
     que se anuncian en la cabecera}

     PROCEDURE VectorVacio (VAR vector:tVector);
     {O(t)=n}
     VAR
     i:integer;
     BEGIN
          FOR i:= INICIO TO FIN DO
          BEGIN
               vector[i].lleno:= FALSE;
          END;
     END;


     PROCEDURE Asignar (VAR vector:tVector; pos:tRango; el:tElemento);
     {O(t)=1}
     BEGIN
          {Introducimos el elemento}
          vector[pos].elem:=el;
          {E indicamos que esa celda esta ocupada}
          vector[pos].lleno:=true;
     END;

     FUNCTION Valor (VAR vector:tVector; pos:tRango): tElemento;
     {O(t)=1}
     BEGIN
          IF Existe(vector,pos) THEN
             Valor:=vector[pos].elem;
     END;

     FUNCTION Existe (VAR vector:tVector; pos:tRango):boolean;
     {O(t)=1}
     BEGIN
          {Si esta lleno devolvera true, si no false}
          Existe:= vector[pos].lleno;
     END;

     PROCEDURE Modificar (VAR vector:tVector; modificaElemento:tFuncionModificar);
     {Le pasamos una funcion/procedimiento COMO PARAMETRO!!!}
     {O(t)=n}
     VAR
     i:integer;
     BEGIN
          FOR i:=INICIO TO FIN DO
          BEGIN
               IF Existe(vector,i) THEN
                  modificaElemento(vector[i].elem);
          END;
     END;

END.