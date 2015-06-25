/*
Dados los predicados para el manejo de listas implementados en clase, construya los árboles de Resolución asociados con las siguientes consultas e indique qué respuestas ofrecería Prolog, y en qué orden:
a) ?- longitud([a,b,c], N), Z is N*N.
b) ?- concatena(X, Y, [a,b]), longitud(X, N), N =< 1.
*/
longitud([], 0).
longitud([_|R], N) :-
	longitud(R, N1),
	N is N1+1.

concatena(X, [], X).
concatena(X, [A|B], Y) :-
	concatena(X, B, [A|Y]).
