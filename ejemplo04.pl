% progenitor_a(?X, ?Y): cierto si X es progenitor/a de Y
progenitor_a(pepa, pepito).
progenitor_a(pepito, pepon).
% ancestro(?X, ?Y): cierto si X es un ancestro de Y

% VERSION 1: caso base en primer lugar, recursi´on a la derecha
ancestro1(X, Y) :-
	progenitor_a(X, Y).
ancestro1(X, Y) :-
	progenitor_a(X, Z),
	ancestro1(Z, Y).


% VERSION 2: caso base en ´ultimo lugar, recursi´on a la derecha
ancestro2(X, Y) :-
	progenitor_a(X, Z),
	ancestro2(Z, Y).
ancestro2(X, Y) :-
	progenitor_a(X, Y).


% VERSION 3: caso base en primer lugar, recursi´on a la izquierda
ancestro3(X, Y) :-progenitor_a(X, Y).
ancestro3(X, Y) :-ancestro3(Z, Y),
progenitor_a(X, Z).


% VERSION 4: caso base en ´ultimo lugar, recursi´on a la izquierda
ancestro4(X, Y) :-
	ancestro4(Z, Y),
	progenitor_a(X, Z).
ancestro4(X, Y) :-
	progenitor_a(X, Y).