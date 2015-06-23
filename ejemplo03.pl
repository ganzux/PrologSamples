% suma(?X,?Y,?Z): cierto si Z es la suma de X e Y
suma(X,0,X).
suma(X,s(Y),s(Z)) :-
	suma(X,Y,Z).