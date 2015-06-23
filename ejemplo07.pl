pertenece(C, [C|_]).

pertenece(E, [_|R]) :-
	pertenece(E, R).
/*
pertenece(a, [a,b,c]).
pertenece(X, [a,b]).
pertenece(a, L).
*/