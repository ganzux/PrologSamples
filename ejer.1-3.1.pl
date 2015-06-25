/*
Sintaxis: programas
Dado el programa en Prolog relativo a amistades (Cuadro 2 del tema 8):
a) Complete el programa añadiendo clausulas que representen el siguiente conocimiento:
	Dolores es amiga de cualquiera que sea enemigo de Abilio o de Blas.
	Los que son enemigos de Caín y de Abel también son enemigos de Abilio.
b) Suponga que se añade al programa el siguiente hecho:
	amigo(abilio, X).
	Escriba la fórmula correspondiente en Lógica de Primer Orden, y exprese el conocimiento que describe en lenguaje natural.

c) Defina el predicado tiene_enemigos(?X), cierto si X tiene algúun enemigo.
*/

% enemigo(?X,?Y): cierto si X es enemigo de Y
enemigo(abel, cain).
enemigo(cain, blas).
enemigo(cain, dolores).
enemigo(blas, abilio).

% amigo(?X,?Y): cierto si X es amigo de Y
amigo(abilio, X) :-
	amigo(abel, X).
amigo(X,Y) :-
	enemigo(X,Z),
	enemigo(Z,Y).

% Dolores es amiga de cualquiera que sea enemigo de Abilio o de Blas.
amigo(dolores, X) :-
	anemigo(X, abilio);
	enemigo(X, blas).

% Los que son enemigos de Caín y de Abel también son enemigos de Abilio.
/*enemigo(X, abilio) :-
	anemigo(X, cain),
	enemigo(X, abel).
*/
amigo(abilio, X).
% Para todo X amigo(abilio, X)    Abilio es amigo de todos

% tiene_enemigos(?X): cierto si X tiene enemigos
tiene_enemigos(X) :- 
	enemigo(_, X).