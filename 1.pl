/* test*/
par(X) :- 
	0 is X mod 2.
par(5).


/*	JOSE
	  |
	PEDRO
	  |
	CLARA
	|    |
	ANA  JOSE  
*/
% progenitor(?hijo, ?padre): verdadero cuando padre es progenitor de hijo
progenitor(clara, pedro).
progenitor(pedro, jose).
progenitor(ana, clara).
progenitor(jose, clara).

abuelo(X, Z) :-
	progenitor(X, Y),
	progenitor(Y, Z).

bisabuelo(X, Y) :-
	abuelo(X, Z),
	progenitor(Z, Y).