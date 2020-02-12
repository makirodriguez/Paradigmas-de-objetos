|hora1 fec1 fec2 fec3 mes r  colExp exp exp1 exp2 exp3 numExp tituExp tramExp anioExp mesExp  diaExp fecha fechaValida listaExp resp expMod  nuevoTit nuevoTram nResp expElim expRep expBuscado eliMes listaElim fechaInicio fechaFin colExpEntreFec horaValida colExp2 horas minutos hora|
colExp:= ArchivoDeExpedientes crearArchivoDeExpedientes.
colExp2:= ArchivoDeExpedientes crearArchivoDeExpedientes.
eliMes:=ArchivoDeExpedientes crearArchivoDeExpedientes.
colExpEntreFec:=ArchivoDeExpedientes crearArchivoDeExpedientes.
hora1:= Time now.
fec1:= Date newDay: 3 monthIndex: 1 year: 2009.
fec2:= Date newDay: 10 monthIndex: 2 year: 2010.
fec3:= Date newDay: 12 monthIndex: 2 year: 2011.
exp1:= Expediente crearExpediente: 1 y: 'Tomas' y: 'Tramite' y: fec1 y: 12 .
exp2:= Expediente crearExpediente: 3 y: 'Joaquin' y: 'Compra' y: fec2 y: 5.
exp3:= Expediente crearExpediente: 2 y: 'Mateo' y: 'Venta' y:  fec3 y: hora1 .
colExp agregarExpediente: exp1 .
colExp agregarExpediente: exp2 .
colExp agregarExpediente: exp3 .

[r~= 8] whileTrue: [    
	Transcript clear.                                                                 			      "MENU PRINCIPAL"
	Transcript show:  '1 - Agregar Expediente'.
	Transcript cr.
	Transcript show: '2 - Modificar Expediente'.
	Transcript cr.
	Transcript show: '3 - Eliminar Expediente Por Numero'.
	Transcript cr.
	Transcript show: '4 - Ver Listado De Expedientes'.
	Transcript cr.
	Transcript show: '5 - Modificar Hora De Expedientes Entre Fechas Dadas'.
	Transcript cr.
	Transcript show: '6 - Generar coleccion De Expedientes Entre Fechas Dadas '.
	Transcript cr.
	Transcript show: '7 - Eliminar Expedientes De Un Mes Dado'.
	Transcript cr.
	Transcript show: '8 . SALIR'.
	Transcript cr.
	r:= IntegerPrompter prompt: 'Ingrese Numero De la Opcion elegida del menu principal '.   "evalua opcion para el menu principal, fin menu principal"


(r=1) ifTrue: [                                                              						     "OPCION 1 AGREGAR EXPEDIENTE"
	numExp:= IntegerPrompter prompt: 'Ingrese N° de Expediente' .
	expBuscado:= colExp buscarExpediente: numExp.
	[expBuscado ~= nil] whileTrue: [
		MessageBox errorMsg: 'El expediente ya existe, intentelo nuevamente'. "Comprueba que no existan expedientes con un mismo numero"
		numExp:= IntegerPrompter prompt: 'Ingrese N° de Expediente' .			
		expBuscado:= colExp buscarExpediente: numExp.].
	tituExp:= Prompter prompt: 'Ingrese Titulo del Expediente'.
	tramExp:= Prompter prompt: 'Ingrese Tramite de Expediente'.
	Transcript cr.
	hora:= Time now.
	Transcript show: 'Ingrese la fecha en Formato DD/MM/AAAA'.
	diaExp:= IntegerPrompter prompt:'Ingrese DIA del expediente' .
	mesExp:=IntegerPrompter prompt: 'Ingrese MES del expediente'.
	anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del Expediente '.
	fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
	[fechaValida=true]whileFalse:[
		MessageBox errorMsg: 'Fecha invalida, intentelo nuevamente'.
		diaExp:= IntegerPrompter prompt:'Ingrese DIA del expediente' .
		mesExp:=IntegerPrompter prompt: 'Ingrese MES del expediente'.
		anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del Expediente '.
		fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
		]."cierre whileTrue" "Valida que la fecha sea valida"
		fecha:= Date newDay: diaExp monthIndex: mesExp year: anioExp .
		exp:= Expediente crearExpediente: numExp y: tituExp y: tramExp y: fecha y: hora .
		colExp agregarExpediente: exp.
	MessageBox notify: 'El expediente fue agregado con exito'.
].   "cierre ifTrue(r=1)"                                                             "Termina el Agregar exp y muestra la coleccion"
  
(r=2) ifTrue: [ 
	( colExp esVacia)ifTrue: [MessageBox notify: 'No hay expedientes en la coleccion'. ]
	ifFalse:[     
		resp:=0.										"OPCION 2 MODIFICAR EXPEDIENTE"
		[resp~=3]whileTrue: [                   									"muestra listado de los Expedientes cargados"	
			Transcript clear.
			Transcript show: '1 - Ver listado de Expedientes'.
			Transcript cr.
			Transcript show:  '2 - Modificar el expediente '.
			Transcript cr.
			Transcript show: '3 - Volver al menu principal'.
			Transcript cr.
			resp:= IntegerPrompter prompt: 'Ingrese una opcion'.

		(resp = 1) ifTrue: [                                            									"muestra listado de los Expedientes cargados"
			listaExp:= colExp verTodosLosExpedientes. 
			listaExp do: [:e |
				Transcript show: 'Listado de expedientes:  '.
					Transcript cr.
					Transcript show: '---------------------------------------'.
						Transcript cr.
						Transcript show:'Numero de expediente:  '.
						Transcript show:(e verNumero) printString .
						Transcript cr.
						Transcript show: 'TIlular del expediente:  '.
						Transcript show: e verTitular.
						Transcript cr.
						Transcript show: 'Tramite del expediente:  '.
						Transcript show: e verTramite.
						Transcript cr.
						Transcript show: 'Fecha del expediente:  '.
						Transcript show: (e verFecha) printString.
						Transcript cr.
						Transcript show: 'Hora del expediente:  '.
						Transcript show: (e verHora)printString.
						Transcript cr.
						Transcript show: '---------------------------------------'.
						Transcript cr.
				]. "fin del do"
			MessageBox notify: 'Lista de Expedientes'.
			]."cierre ifTrue(resp=1)"                                                           						   
		(resp=2) ifTrue: [                                                         "modifica con el numero de expediente"
			resp:= IntegerPrompter prompt: 'Ingrese el numero de expediente a modificar'.
			expMod:= colExp buscarExpediente: resp.
			(expMod=nil) ifTrue:[MessageBox notify: 'El numero de Expediente no existe' .]
			ifFalse: [
				nResp:=0.
				[nResp~=7] whileTrue: [
				Transcript clear.
				Transcript  show: '1 - Modificar Numero de Expediente'.
				Transcript cr.
				Transcript show: '2 - Modificar Titular'.
				Transcript cr.
				Transcript show: '3 - Modificar Tramite'.
				Transcript cr.
				Transcript show: '4 - Modificar Fecha'.
				Transcript cr.
				Transcript show: '5 - Modificar Hora'.
				Transcript cr.
				Transcript show: '6 - Modificar todo el expediente'.
				Transcript cr.
				Transcript show: '7 - SALIR'.
				nResp:= IntegerPrompter prompt: 'Ingrese el numero de opcion para comenzar a modificar' .

				(nResp=1)ifTrue: [
					numExp:= IntegerPrompter prompt: 'Ingrese N° de Expediente'.
					expBuscado:= colExp buscarExpediente: numExp.
					[expBuscado ~= nil] whileTrue: [
						MessageBox errorMsg: 'El expediente ya existe, intentelo nuevamente'. "Comprueba que no existan expedientes con un mismo numero"
						numExp:= IntegerPrompter prompt: 'Ingrese N° de Expediente'.
						expBuscado:= colExp buscarExpediente: numExp].         
					expMod modificarNumero: numExp.
					MessageBox notify: 'Se modifico con exito el numero de expediente'. ]."cierre ifTrue(nResp=3)"

				(nResp=2)ifTrue: [
					nuevoTit:= Prompter prompt: 'Ingrese nuevo Titular'.
					expMod modificarTitular: nuevoTit.
					MessageBox notify: 'Se modifico con exito el titular'.]. "cierre ifTrue(nResp=3)"

				(nResp=3)ifTrue: [
					nuevoTram:= Prompter prompt: 'Ingrese nuevo tramite' .
					expMod modificarTramite: nuevoTram.
					MessageBox notify: 'Se modifico con exito el tramite'.]."cierre ifTrue(nResp=3)"

				(nResp=4)ifTrue: [
					diaExp:= IntegerPrompter prompt:'Ingrese DIA del expediente' .
					mesExp:=IntegerPrompter prompt: 'Ingrese MES del expediente'.
					anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del Expediente '.
					fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
					[fechaValida=true ]whileFalse: [
						MessageBox errorMsg: 'La fecha ingresada es invalida, intentelo nuevamente'.
						diaExp:= IntegerPrompter prompt:'Ingrese DIA del expediente' .
						mesExp:=IntegerPrompter prompt: 'Ingrese MES del expediente'.
						anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del Expediente '.
						fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
					].
						fecha:= Date newDay: diaExp monthIndex: mesExp year: anioExp .
						expMod modificarFecha: fecha.
						MessageBox notify: 'Se modifico con exito la fecha'.]."cierre ifTrue(nResp=4)"

				(nResp=5)ifTrue: [
					horas:=IntegerPrompter prompt: 'Ingrese  nueva hora (1 - 24)'  .
					minutos:= IntegerPrompter prompt: 'Ingrese  nuevos minutos'.
					horaValida:= HoraValida  horaValida: horas con: minutos.
					[horaValida=true]whileFalse:[
							MessageBox errorMsg: 'La hora ingresada es invalda, vuelva a intentarlo' .
							horas:=IntegerPrompter prompt: 'Ingrese  nueva hora (1 - 24)'  .
							minutos:= IntegerPrompter prompt: 'Ingrese  nuevos minutos'.
							horaValida:= HoraValida  horaValida: horas con: minutos.]."fin while validar hora"
					(hora=24)ifTrue: [hora:= Time hours: 00 minutes: minutos seconds: 00.
						(minutos=60)ifTrue: [hora:= Time hours:horas minutes: 00 seconds: 00.]
						ifFalse:[hora:= Time hours: horas minutes: minutos seconds: 00.].
					]
					ifFalse:[hora:= Time hours: horas minutes: minutos seconds: 00.].
					expMod modificarHora: hora.
					MessageBox notify: 'Se modifico con exito la hora'.].
				
				(nResp=6)ifTrue: [
					numExp:= IntegerPrompter prompt: 'Ingrese N° de Expediente'.
					expBuscado:= colExp buscarExpediente: numExp.
					[expBuscado ~= nil] whileTrue: [
						MessageBox errorMsg: 'El expediente ya existe, intentelo nuevamente'. "Comprueba que no existan expedientes con un mismo numero"
						numExp:= IntegerPrompter prompt: 'Ingrese N° de Expediente'.
						expBuscado:= colExp buscarExpediente: numExp]. 
					expMod modificarNumero: numExp.
					MessageBox notify: 'Se modifico con exito el numero de expediente'.
					nuevoTit:= Prompter prompt: 'Ingrese nuevo Titular'.
					expMod modificarTitular: nuevoTit.
					MessageBox notify: 'Se modifico con exito el titular'.
					nuevoTram:= Prompter prompt: 'Ingrese nuevo tramite' .
					expMod modificarTramite: nuevoTram.
					MessageBox notify: 'Se modifico con exito el tramite'.
					diaExp:= IntegerPrompter prompt:'Ingrese DIA del expediente' .
					mesExp:=IntegerPrompter prompt: 'Ingrese MES del expediente'.
					anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del Expediente '.
					fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
					[fechaValida=true ]whileFalse: [
						MessageBox errorMsg: 'La fecha ingresada es invalida, intentelo nuevamente'.
						diaExp:= IntegerPrompter prompt:'Ingrese DIA del expediente' .
						mesExp:=IntegerPrompter prompt: 'Ingrese MES del expediente'.
						anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del Expediente '.
						fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
					].
						fecha:= Date newDay: diaExp monthIndex: mesExp year: anioExp .
						expMod modificarFecha: fecha.
						MessageBox notify: 'Se modifico con exito la fecha'.
						horas:=IntegerPrompter prompt: 'Ingrese  nueva hora (1 - 24)'  .
						minutos:= IntegerPrompter prompt: 'Ingrese  nuevos minutos (1 - 60)'.
						horaValida:= HoraValida  horaValida: horas con: minutos.
						[horaValida=true]whileFalse:[
							MessageBox errorMsg: 'La hora ingresada es invalda, vuelva a intentarlo' .
							horas:=IntegerPrompter prompt: 'Ingrese  nueva hora (1 - 24)'  .
							minutos:= IntegerPrompter prompt: 'Ingrese  nuevos minutos(1 - 60)'.
							horaValida:= HoraValida  horaValida: horas con: minutos.]."fin while validar hora"
						(hora=24)ifTrue: [hora:= Time hours: 00 minutes: minutos seconds: 00.
							(minutos=60)ifTrue: [hora:= Time hours:horas minutes: 00 seconds: 00.]
							ifFalse:[hora:= Time hours: horas minutes: minutos seconds: 00.].
						]
						ifFalse:[hora:= Time hours: horas minutes: minutos seconds: 00.].
						expMod modificarHora: hora.
						MessageBox notify: 'Se modifico con exito la hora'.
						MessageBox notify: 'Se modifico todo el expediente con exito'.
						]. "cierre nResp6"
					]."cierre while"
			]."cierre ifTrue"
		]."cierre del (resp=2)"
	]. "cierre while"
	]. "cierre ifFalse"
]."cierre del (r=2)"

(r=3)ifTrue: [ 
	( colExp esVacia)ifTrue: [
		MessageBox notify: 'No hay expedientes en la coleccion'. ]
	ifFalse:[
		resp:=0.
		[resp ~= 3]whileTrue: [     
			Transcript clear.									"OPCION 3 ELIMINAR EXPEDIENTE"
			Transcript show: '1 - Ver listado de Expedientes'.
			Transcript cr.
			Transcript show:  '2 - Eliminar por numero de expediente '.
			Transcript cr.
			Transcript show: '3 - Volver al menu principal'.
			Transcript cr.
			resp:= IntegerPrompter prompt: 'Ingrese una opcion' .

		(resp = 1) ifTrue: [                                                          "muestra listado de los Expedientes cargados"  
				Transcript clear.
				listaExp:= colExp verTodosLosExpedientes. 
				Transcript show: 'Listado de expedientes:  '.
				Transcript cr.
				Transcript show: '---------------------------------------'.
				listaExp do: [:e |
					Transcript cr.
					Transcript show:'Numero de expediente:  '.
					Transcript show:(e verNumero) printString .
					Transcript cr.
					Transcript show: 'TIlular del expediente:  '.
					Transcript show: e verTitular.
					Transcript cr.
					Transcript show: 'Tramite del expediente:  '.
					Transcript show: e verTramite.
					Transcript cr.
					Transcript show: 'Fecha del expediente:  '.
					Transcript show: (e verFecha) printString.
					Transcript cr.
					Transcript show: 'Hora del expediente:  '.
					Transcript show: (e verHora)printString.
					Transcript cr.
					Transcript show: '---------------------------------------'.
					Transcript cr.
					]. "fin del do"
				MessageBox notify: 'Lista de Expedientes'.
				]."cierre (resp=1)"

		(resp = 2)ifTrue: [
				numExp:= IntegerPrompter prompt: 'Ingrese numero de expediente a eliminar'.
				expElim:= colExp buscarExpediente: numExp .
				(expElim ~= nil )ifTrue: [
					colExp eliminarExpedientePorNumero: expElim.
					MessageBox notify: 'El expediente fue eliminado con exito'.
					] 
				ifFalse:[MessageBox  notify: 'El espediente no Existe'.].
				]."cierre resp=2"
			]. "cierre while"
		]. "cierre ifFalse"
]."cierre ifTrue"


(r=4)ifTrue: [                											"OPCION 4 VER LISTA EXPEDIENTES"
		(colExp esVacia)ifTrue: [MessageBox notify: 'No hay expedientes en la coleccion'. ]
	ifFalse:[  
		listaExp:= colExp verTodosLosExpedientes.                                                           "muestra listado de los Expedientes cargados"  
		Transcript show: 'Listado de expedientes:  '.
		Transcript cr.
		Transcript show: '---------------------------------------'.
		listaExp do: [:e |
			Transcript cr.
			Transcript show:'Numero de expediente:  '.
			Transcript show:(e verNumero) printString .
			Transcript cr.
			Transcript show: 'TIlular del expediente:  '.
			Transcript show: e verTitular.
			Transcript cr.
			Transcript show: 'Tramite del expediente:  '.
			Transcript show: e verTramite.
			Transcript cr.
			Transcript show: 'Fecha del expediente:  '.
			Transcript show: (e verFecha) printString.
			Transcript cr.
			Transcript show: 'Hora del expediente:  '.
			Transcript show: (e verHora)printString.
			Transcript cr.
			Transcript show: '---------------------------------------'.
			Transcript cr.
			]. "fin del do"
		MessageBox notify: 'Lista de Expedientes'.
		].
	]."cierre ifTrue (r=4)"

(r=5)ifTrue: [                                                                                                             "OPCION 5  MODIFICAR HORA ENTRE FECHAS'"
		(colExp esVacia)ifTrue: [MessageBox notify: 'No hay expedientes en la coleccion'. ]
	ifFalse:[
		diaExp:= IntegerPrompter prompt:'Ingrese DIA del inicio del intervalo' .
		mesExp:=IntegerPrompter prompt: 'Ingrese MES del inicio del intervalo'.
		anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del inicio del intervalo'.
			[fechaValida=true]whileFalse:[
			MessageBox errorMsg: 'Fecha invalida, intentelo nuevamente'.
			diaExp:= IntegerPrompter prompt:'Ingrese DIA del inicio del intervalo' .
			mesExp:=IntegerPrompter prompt: 'Ingrese MES del inicio del intervalo'.
			anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del inicio del intervalo'.
			fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
		].
		fechaInicio:= Date newDay: diaExp monthIndex: mesExp year: anioExp .
		diaExp:= IntegerPrompter prompt:'Ingrese DIA del fin del intervalo' .
		mesExp:=IntegerPrompter prompt: 'Ingrese MES del fin del intervalo'.
		anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del fin del intervalo'.
		fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
		[fechaValida=true]whileFalse:[
			MessageBox errorMsg: 'Fecha invalida, intentelo nuevamente'.
			diaExp:= IntegerPrompter prompt:'Ingrese DIA del fin del intervalo' .
			mesExp:=IntegerPrompter prompt: 'Ingrese MES del fin del intervalo'.
			anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del fin del intervalo'.
			fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
		].
		fechaFin:= Date newDay: diaExp monthIndex: mesExp year: anioExp .
		(fechaInicio<fechaFin)ifTrue:[
		listaExp:= colExp verTodosLosExpedientes.
		colExp2:= listaExp select: [:e | (e verFecha between: fechaInicio and:fechaFin).].
		colExp2 do: [:e | 
			Transcript show: 'Numero de Expediente: '.
			Transcript  show: (e verNumero )printString. 
			Transcript cr.
			horas:=IntegerPrompter prompt: 'Ingrese  nueva hora (1 - 24)'  .
			minutos:= IntegerPrompter prompt: 'Ingrese  nuevos minutos(1 - 60)'.
			horaValida:= HoraValida  horaValida: horas con: minutos.
			[horaValida=true]whileFalse: [
				MessageBox errorMsg: 'La hora ingresada es invalda, vuelva a intentarlo' .
				horas:=IntegerPrompter prompt: 'Ingrese  nueva hora (1 - 24)'  .
				minutos:= IntegerPrompter prompt: 'Ingrese  nuevos minutos (1 - 60)'.
				horaValida:= HoraValida  horaValida: horas con: minutos.]."fin while validar hora"
				(hora=24)ifTrue: [hora:= Time hours: 00 minutes: minutos seconds: 00.
				(minutos=60)ifTrue: [hora:= Time hours:horas minutes: 00 seconds: 00.]
				ifFalse:[hora:= Time hours: horas minutes: minutos seconds: 00.].
				]
				ifFalse:[hora:= Time hours: horas minutes: minutos seconds: 00.].
				
				e modificarHora: hora.
				MessageBox notify: 'Hora modificada con exito'.
			]."fin do"	
		]
		ifFalse:[MessageBox errorMsg: 'La fecha de inicio es mayor que la de fin, intentelo de nuevo'.].
		
		].
]." Cierre ifTrue(r='5')"

(r=6)ifTrue: [																	"OPCION 6 GENERAR COLECCION ENTRE FECHAS DADAS"
	(colExp esVacia)ifTrue: [MessageBox notify: 'No hay expedientes en la coleccion'. ]
	ifFalse:[
		diaExp:= IntegerPrompter prompt:'Ingrese DIA del inicio del intervalo' .
		mesExp:=IntegerPrompter prompt: 'Ingrese MES del inicio del intervalo'.
		anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del inicio del intervalo'.
			[fechaValida=true]whileFalse:[
			MessageBox errorMsg: 'Fecha invalida, intentelo nuevamente'.
			diaExp:= IntegerPrompter prompt:'Ingrese DIA del inicio del intervalo' .
			mesExp:=IntegerPrompter prompt: 'Ingrese MES del inicio del intervalo'.
			anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del inicio del intervalo'.
			fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
		].
		fechaInicio:= Date newDay: diaExp monthIndex: mesExp year: anioExp .
		diaExp:= IntegerPrompter prompt:'Ingrese DIA del fin del intervalo' .
		mesExp:=IntegerPrompter prompt: 'Ingrese MES del fin del intervalo'.
		anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del fin del intervalo'.
		fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
		[fechaValida=true]whileFalse:[
			MessageBox errorMsg: 'Fecha invalida, intentelo nuevamente'.
			diaExp:= IntegerPrompter prompt:'Ingrese DIA del fin del intervalo' .
			mesExp:=IntegerPrompter prompt: 'Ingrese MES del fin del intervalo'.
			anioExp:= IntegerPrompter prompt: 'Ingrese ANIO del fin del intervalo'.
		fechaValida:= FechaValida fechaValida: diaExp con: mesExp con: anioExp.
		].
		fechaFin:= Date newDay: diaExp monthIndex: mesExp year: anioExp .
		(fechaInicio<fechaFin)ifTrue: [listaExp:= colExp verTodosLosExpedientes.
			colExp2:= listaExp select: [:e | (e verFecha between: fechaInicio and: fechaFin). ].
			Transcript show: 'Lista de Expedientes por fecha ingresada:'.
			Transcript cr. 
			Transcript show: '---------------------------------------------------'.
			colExp2 do: [:e | 
				Transcript cr.
				Transcript show:'Numero de expediente:  '.
				Transcript show:(e verNumero) printString .
				Transcript cr.
				Transcript show: 'TIlular del expediente:  '.
				Transcript show: e verTitular.
				Transcript cr.
				Transcript show: 'Tramite del expediente:  '.
				Transcript show: e verTramite.
				Transcript cr.
				Transcript show: 'Fecha del expediente:  '.
				Transcript show: (e verFecha) printString.
				Transcript cr.
				Transcript show: 'Hora del expediente:  '.
				Transcript show: (e verHora)printString.
				Transcript cr.
				Transcript show: '---------------------------------------'.
				]. "fin del do"
			MessageBox notify: 'Se ha creando la coleccion de los expedientes entre las fechas dadas con exito'.]
		ifFalse:[MessageBox errorMsg: 'La fecha de inicio es mayor que la de fin, intentelo de nuevo'. ].
		
			
		]. "fin ifFalse"
]."cierre ifTrue(r=6)"

(r=7)ifTrue: [																"OPCION 7 ELIMINAR EXPEDIENTE DE UN MES DADO"
		(colExp esVacia)ifTrue: [MessageBox notify: 'No hay expedientes en la coleccion'. ]
	ifFalse:[  
		resp:= IntegerPrompter prompt: 'Ingrese el mes del cual quiere eliminar los expedientes'.
		[resp>13]whileTrue: [
			MessageBox errorMsg: 'Mes incorrecto, ingrese un mes valido'.
			resp:= IntegerPrompter prompt: 'Ingrese el mes del cual quiere eliminar los expedientes'.
		]."cierre while"
		listaExp:= colExp verTodosLosExpedientes.
		listaExp do: [:e| mes:= e verFecha .
		(mes monthIndex = resp)ifTrue: [
			eliMes agregarExpediente: e.                "agrgo a otra coleccion para saber cuales tengo q borrar de la coleccion colExp"
			MessageBox notify: 'El expediente fue eliminado con exito'.].
		]. "cierre do"
		(eliMes esVacia)ifTrue: [MessageBox errorMsg: 'No exiten expedientes en el mes ingresado, intentelo nuevamente'. ]
		ifFalse:[
		listaElim:= eliMes verTodosLosExpedientes.
		listaElim do: [:e |
				colExp eliminarExpedientePorNumero: e. ]."cierre do"
		].

	]. "cierre ifFalse"
	]. "Cierre ifTrue(r='7')"
]."cierre while"