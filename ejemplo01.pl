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