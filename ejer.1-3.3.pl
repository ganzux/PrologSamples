/*
Sintaxis: programas
Escriba un programa l�gico puro" capaz de decidir si un n�mero natural es par. Es
decir, implemente el predicado par(?X), cierto si X es par, manejando los n�meros
naturales mediante la constante cero y la funci�n sucesor s(X) como se ha hecho
en los apuntes.
*/

% par(?X): cierto si X es par
par(0).
par(s(s(X))) :-
	par(X).