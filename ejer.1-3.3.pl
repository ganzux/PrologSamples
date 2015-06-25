/*
Sintaxis: programas
Escriba un programa lógico puro" capaz de decidir si un número natural es par. Es
decir, implemente el predicado par(?X), cierto si X es par, manejando los números
naturales mediante la constante cero y la función sucesor s(X) como se ha hecho
en los apuntes.
*/

% par(?X): cierto si X es par
par(0).
par(s(s(X))) :-
	par(X).