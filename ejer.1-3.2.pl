/*
Sintaxis: programas
Suponga que la primera cl�usula del programa l�gico puro" para la suma de n�meros
naturales (Cuadro 4 del tema 8) fuese suma(0,X,X)." en lugar de la dada.
�C�mo ser�a el resto del programa?
*/

% suma(?X,?Y,?Z): cierto si Z es la suma de X e Y
/*
suma(X,0,X).
suma(X,s(Y),s(Z)) :-
	suma(X,Y,Z).
*/
suma(0, X, X).
suma(s(X), Y, s(Z)) :-
	suma(X, Y, Z).