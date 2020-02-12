"Filed out from Dolphin Smalltalk 7"!

Object subclass: #ArchivoDeExpedientes
	instanceVariableNames: 'expedientes'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ArchivoDeExpedientes guid: (GUID fromString: '{7914B862-48A7-4381-A2B9-6A0B45A07A52}')!
ArchivoDeExpedientes comment: ''!
!ArchivoDeExpedientes categoriesForClass!Kernel-Objects! !
!ArchivoDeExpedientes methodsFor!

agregarExpediente: unExpediente
expedientes add: unExpediente.!

buscarExpediente: unNumero
"Retorna el expediente que tenga el numero buscado si es que existe, caso contrario nil"
^ expedientes detect: [:e | e verNumero = unNumero ] ifNone:[nil].!

eliminarExpedientePorMes: unaFecha
"Elimina un expediente del archivo de expedientes por fecha"
expedientes remove: unaFecha .!

eliminarExpedientePorNumero: unNumero
"Elimina un expediente del archivo de expedientes por numero"
expedientes remove: unNumero.!

esVacia
"Retorna verdadero si la coleccion esta vacia, caso contrario falso"
^ expedientes isEmpty.!

existeExpediente: unExpediente
"Retorna verdadero si el expediente está, caso contrario falso"
^(expedientes includes: unExpediente).!

iniArchivoDeExpedientes
expedientes:= OrderedCollection new. !

tamanio
"Retorna la cantidad de expedientes que hay en el archivoDeExpedientes"
^expedientes size.!

verTodosLosExpedientes
"Retorna los expedientes del archivoDeExpedientes"
^ expedientes.! !
!ArchivoDeExpedientes categoriesFor: #agregarExpediente:!public! !
!ArchivoDeExpedientes categoriesFor: #buscarExpediente:!public! !
!ArchivoDeExpedientes categoriesFor: #eliminarExpedientePorMes:!public! !
!ArchivoDeExpedientes categoriesFor: #eliminarExpedientePorNumero:!public! !
!ArchivoDeExpedientes categoriesFor: #esVacia!public! !
!ArchivoDeExpedientes categoriesFor: #existeExpediente:!public! !
!ArchivoDeExpedientes categoriesFor: #iniArchivoDeExpedientes!public! !
!ArchivoDeExpedientes categoriesFor: #tamanio!public! !
!ArchivoDeExpedientes categoriesFor: #verTodosLosExpedientes!public! !

!ArchivoDeExpedientes class methodsFor!

crearArchivoDeExpedientes
"Retorna una instancia del archivo de expedientes"
^(self new)iniArchivoDeExpedientes.! !
!ArchivoDeExpedientes class categoriesFor: #crearArchivoDeExpedientes!public! !

