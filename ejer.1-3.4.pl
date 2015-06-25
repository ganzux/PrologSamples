/*
Sintaxis: programas
Escriba un programa l�gico puro capaz de multiplicar n�meros naturales. Puede
utilizar para ello la siguiente definici�n recursiva del producto:

	Para cualquier n perteneciente a N; n * 0 = 0
	Para cualesquiera n,m pertenecientes a N; n * (m + 1) = (n * m) + n

El programa podr� usar el predicado suma definido en el Cuadro 4 para sumar
n�meros naturales.

*/

suma(X,0,X).
suma(X,s(Y),s(Z)) :-
	suma(X,Y,Z).

mult(_, 0, 0).
mult(N, s(M), NM1) :-	% n * (m + 1)
	mult(N, M, NM),		% nm = n * m
	suma(NM, N, NM1).	% nm + n