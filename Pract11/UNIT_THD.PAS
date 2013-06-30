{***************************************************************************
*															*
*	Modulo:	TipoHoraDigital									*
*	Tipo:	Programa()	Interfaz-Implementacion TAD(X)	Otros()	*
*	Autor/es: Jos‚ Mar¡a Ant¢n Santos								*
*	Fecha de actualizaci¢n:	05/12/03								*
*	Descripci¢n:	Unidad que define el TAD HoraDigital				*
*															*
***************************************************************************}
UNIT UNIT_THD;
INTERFACE
     TYPE
          THora=0..23;
          TipoMS=0..59;
     	TipoHD = RECORD
          	h:THora;
			m:TipoMS;
			s:TipoMS;
          END;
          TNatural=0..MAXLONGINT;
     {*OPERACIONES CONSTRUCTORAS GENERADORAS*}
     PROCEDURE ConstruirHora (hh,mm,ss:integer; VAR hora:TipoHD);
     {PRE: }
     {POST: devuelve una hora de tipo digital}

     {*OPERACIONES OBSERVADORAS SELECTORAS*}
     FUNCTION Horas (hora:TipoHD):THora;
     {PRE: }
     {POST: devuelve la hora de HORA}

     FUNCTION Minutos (hora:TipoHD):TipoMS;
     {PRE: }
     {POST: devuelve los minutos de HORA}

     FUNCTION Segundos (hora:TipoHD):TipoMS;
     {PRE: }
     {POST: devuelve los segundos de HORA}

     {*OPERACIONES OBSERVADORAS NO SELECTORAS*}
     FUNCTION EnPunto (hora:TipoHD):Boolean;
     {PRE: }
     {POST: devuelve TRUE si HORA es una hora en punto}

     FUNCTION EsPosterior (h1,h2:TipoHD):Boolean;
     {PRE: }
     {POST: devuelve TRUE si Hora1 es posterior a Hora2}

     FUNCTION Distancia (h1,h2:TipoHD):integer;
     {PRE: }
     {POST: devuelve la distancia entre Hora1 y Hora2}

     {*OPERACIONES CONSTRUCTORAS NO GENERADORAS*}
     PROCEDURE Suma (h1,h2:TipoHD; VAR hora:TipoHD);
     {PRE: }
     {POST: devuelve en HORA la suma de Hora1 y Hora2}

     PROCEDURE SegundosAHora (nseg:TNatural; VAR hora:TipoHD);
     {PRE: }
     {POST: devuelve la HORA que tiene "NSEG" segundos}

     PROCEDURE Incrementar (VAR hora:TipoHD; n:TNatural);
     {PRE: }
     {POST: devuelve la HORA incrementada en "n" segundos}

IMPLEMENTATION
     PROCEDURE ConstruirHora (hh,mm,ss:integer; VAR hora:TipoHD);
     	begin
			hora.h:=hh;
               hora.m:=mm;
               hora.s:=ss;
          end;
		{O(1)}

     FUNCTION Horas (hora:TipoHD):THora;
          begin
          	Horas:=hora.h;
		end;
     	{O(1)}

     FUNCTION Minutos (hora:TipoHD):TipoMS;
          begin
          	Minutos:=hora.m;
          end;
     	{O(1)}

     FUNCTION Segundos (hora:TipoHD):TipoMS;
          begin
			Segundos:=hora.s;
          end;
	     {O(1)}

     FUNCTION EnPunto (hora:TipoHD):Boolean;
          begin
          	EnPunto:=(Minutos(hora)=0) and (Segundos(hora)=0);
          end;
	     {O(1)}

     FUNCTION EsPosterior (h1,h2:TipoHD):Boolean;
          begin
               EsPosterior:=(Distancia(h1,h2))>0;
          end;
	     {O(1)}

     FUNCTION Distancia (h1,h2:TipoHD):integer;
          begin
          	Distancia:=(Horas(h1)*3600+Minutos(h1)*60+Segundos(h1))-
               	(Horas(h2)*3600+Minutos(h2)*60+Segundos(h2));
          end;
	     {O(1)}

     PROCEDURE Suma (h1,h2:TipoHD; VAR hora:TipoHD);
          var n_h1,acum:TNatural;
          begin
               n_h1:=Horas(h1)*3600+Minutos(h1)*60+Segundos(h1);
               acum:=n_h1+Horas(h2)*3600+Minutos(h2)*60+Segundos(h2);
               SegundosAHora(acum,hora);
          end;
	     {O(1)}

     PROCEDURE SegundosAHora (nseg:TNatural; VAR hora:TipoHD);
          begin
               ConstruirHora((nseg DIV 3600) MOD 24,(nseg DIV 60) MOD 60,
						nseg MOD 60,hora);
          end;
	     {O(1)}

     PROCEDURE Incrementar (VAR hora:TipoHD; n:TNatural);
          var h1:TipoHD;
          begin
               SegundosAHora(n,h1);
               Suma(hora,h1,hora);
          end;
	     {O(1)}
END.{Unidad THD}