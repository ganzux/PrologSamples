/*
Considere la siguiente implementación del predicado misterio(+E1, +E2, +L):
	misterio(E1, E2, [E1,E2|_]).
	misterio(E1, E2, [_|R]) :-
		misterio(E1, E2, R).
Explique en lenguaje natural el cometido del predicado anterior (cierto si ....).

	* Cierto si el tercer argumnento es una lista cuya cabeza está formada por E1 y E2.
	* Cierto si, Descabezando, E1 y E2 aparecen seguidos
*/
misterio(E1, E2, [E1,E2|_]).
misterio(E1, E2, [_|R]) :-
	misterio(E1, E2, R).