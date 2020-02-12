"Filed out from Dolphin Smalltalk 7"!

Object subclass: #Expediente
	instanceVariableNames: 'numero titular tramite fecha hora'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Expediente guid: (GUID fromString: '{F0B8D347-5F6D-4F17-AEE3-4ADA67A09F23}')!
Expediente comment: ''!
!Expediente categoriesForClass!Kernel-Objects! !
!Expediente methodsFor!

iniExpediente:unNumero y:unTitular y:unTramite y:unaFecha y:unaHora
numero:= unNumero.
titular:= unTitular.
tramite:= unTramite.
fecha:= unaFecha.
hora:= unaHora.!

modificarFecha: unaFecha
"Modifica la fecha de presentacion de un expediente"
fecha:= unaFecha!

modificarHora: unaHora
"Modifica la hora de recepcion de un expediente"
hora:= unaHora!

modificarNumero: unNumero
"Modifica el numero del expediente"
numero:= unNumero!

modificarTitular: unTitular
"Modifica el titular"
titular:= unTitular!

modificarTramite: unTramite
"Modifica el tramite"
tramite:= unTramite!

verFecha
"Retorna la fecha"
^ fecha!

verHora
"Retorna la hora"
^ hora!

verNumero
"Retorna el numero del expediente"
^ numero!

verTitular
"Retorna el titular"
^ titular!

verTramite
"Retorna el tramite"
^ tramite! !
!Expediente categoriesFor: #iniExpediente:y:y:y:y:!public! !
!Expediente categoriesFor: #modificarFecha:!public! !
!Expediente categoriesFor: #modificarHora:!public! !
!Expediente categoriesFor: #modificarNumero:!public! !
!Expediente categoriesFor: #modificarTitular:!public! !
!Expediente categoriesFor: #modificarTramite:!public! !
!Expediente categoriesFor: #verFecha!public! !
!Expediente categoriesFor: #verHora!public! !
!Expediente categoriesFor: #verNumero!public! !
!Expediente categoriesFor: #verTitular!public! !
!Expediente categoriesFor: #verTramite!public! !

!Expediente class methodsFor!

crearExpediente:unNumero y:unTitular y:unTramite y:unaFecha y:unaHora
"Retorna una instacia de un expediente inicializado"
^ (self new) iniExpediente:unNumero y:unTitular y:unTramite y:unaFecha y:unaHora.! !
!Expediente class categoriesFor: #crearExpediente:y:y:y:y:!public! !

