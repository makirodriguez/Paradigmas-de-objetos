"Filed out from Dolphin Smalltalk 7"!

Object subclass: #HoraValida
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
HoraValida guid: (GUID fromString: '{1A1D7720-B26A-4BC8-A90D-A182A202DBDA}')!
HoraValida comment: ''!
!HoraValida categoriesForClass!Kernel-Objects! !
!HoraValida class methodsFor!

horaValida: horas con:minutos

(horas<25) &(minutos<61) ifTrue: [
^ true.]
ifFalse:[ ^false.].
 ! !
!HoraValida class categoriesFor: #horaValida:con:!public! !

