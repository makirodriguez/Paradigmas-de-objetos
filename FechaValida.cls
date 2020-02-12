"Filed out from Dolphin Smalltalk 7"!

Object subclass: #FechaValida
	instanceVariableNames: 'dia mes anio'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
FechaValida guid: (GUID fromString: '{A022BB9F-B9F3-40C2-BD49-DFBBD3082A16}')!
FechaValida comment: ''!
!FechaValida categoriesForClass!Kernel-Objects! !
!FechaValida class methodsFor!

fechaValida:dia con:mes con:anio

((mes ==1)|(mes ==3)|(mes==5)|(mes ==7)|(mes ==8)|(mes ==10)|(mes ==12))ifTrue: [
((dia < 32)&(dia > 0))ifTrue: [
^true.
] ifFalse: [
^false.
].
].
((mes ==4)|(mes ==6)|(mes ==9)|(mes ==11))ifTrue: [
((dia < 31)&(dia > 0))ifTrue: [
^true.
] ifFalse: [
^false.
].
].
((anio / 4)isInteger)ifFalse: [
((mes ==2))ifTrue: [
((dia < 29)&(dia > 0))ifTrue: [
^true.
] ifFalse: [
^false.
].
].
] ifTrue: [
"Bisiesto"
((mes ==2))ifTrue: [
((dia < 30)&(dia > 0))ifTrue: [
^true.
] ifFalse: [
^false.
].
].
].! !
!FechaValida class categoriesFor: #fechaValida:con:con:!public! !

