|cons auto1 auto2 auto3 auto4 autos   marca marcaSinRep d|

cons:=Consecionaria crearConsesionaria: 'Don Auto'.
auto1:=Auto crearAuto: 123 con: 'Fiesta' con: 'Ford' con: 0 con: 2019.
auto2:=Auto crearAuto: 1234 con: 'uno' con: 'Fiat' con: 123456 con: 2000.
auto3:=Auto crearAuto: 15544 con: 'Gol' con: 'VW' con: 0 con: 2019.
auto4:=Auto crearAuto: 12345 con: 'Focus' con: 'Ford' con: 2125 con: 2016.
cons agregarAuto: auto1.
cons agregarAuto: auto2.
cons agregarAuto: auto3.
cons agregarAuto: auto4.
autos:= cons recuperar.
marca:= autos collect: [:each | each verMarca ].
marcaSinRep:= marca asSet.
d:= Dictionary new.
marcaSinRep do: [:each | d at:each put:( marca occurrescesOf:each)].
d inspect.
"marcaSinRep inspect.
marca inspect.
cons inspect.a FlipperInspector
autoFord:= autos select: [:a | a verMarca='Ford'].
Transcript show: 'Cantidad de autos Ford es:', (autoFord size)printString.  a TranscriptShell
ceroKm:= autos select: [:a | a verKm = 0].
ceroKm inspect."
