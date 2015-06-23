% factorial(?X, ?Y): cierto si Y es el factorial de X
factorial(0, s(0)).

factorial(s(X), Y*s(X)) :-
	factorial(X,Y).
	
% es_factorial(?X): cierto si X es el factorial de alg´un n´umero
es_factorial(X) :-
	factorial(_,X).