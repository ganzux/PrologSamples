% suma(+X,+Y,?Z): cierto si Z es la suma de X e Y
suma(X,Y,Z) :-
	Z is X+Y.


% factorial(+X, ?Y): cierto si Y es el factorial de X.
factorial(0, 1).
factorial(X, Y) :-X > 0,
	Z is X-1,
	factorial(Z, F),
	Y is X*F.