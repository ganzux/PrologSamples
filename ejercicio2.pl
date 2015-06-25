%natural(+X), cierto si X es un número natural. Para deefnir este predicado puede utilizar el predicado predefinido integer(+X), cierto si X es un número entero.
natural(X) :-
	integer(X),
	X >= 0.

%fib(+X,?Y), cierto si Y es el número de Fibonacci asociado con X. Se recuerda que cada número natural tiene asociado otro número natural, denominado número de Fibonacci, que se calcula de la siguiente forma: Fib(0)= Fib(1)=1 ; Fib(n) = Fib(n-1)+Fib(n-2).
fib(0, 1).
fib(1, 1).
fib(X, Y) :-
	natural(X),
	X > 1,
	X_1 is X-1,
	X_2 is X-2,
	fib(X_1, Sum1),
	fib(X_2, Sum2),
	Y is Sum1 + Sum2.

/*mcd(+M,+N,?MCD), cierto si MCD es el máximo común divisor (mcd) de M y N. Se recuerda que una forma sencilla para calcular el mcd de dos números naturales es utilizar el algoritmo de Euclides, que establece lo siguiente:
 - El mcd de M y 0 es M.
 - El mcd de M y N es igual al mcd de N y de (M mod N) (resto de la división entera).
*/
mcd(M, 0, M) :-
	natural(M).

mcd(M, N, MCD) :-
	natural(M),
	natural(N),
	N > 0,
	Resto is M mod N,
	mcd(N, Resto, MCD).

/*
exp(+M,+N,?E), cierto si E es igual a M elevado a N. Recuerde que el valor x^y puede definirse de forma recursiva como sigue:
	Para todo x, x^0 = 1.
	Para todo x y para todo y > 0, x^y = x * x^(y-1)
*/
exp(1, _, 1).

exp(M, 0, 1) :-
	natural(M).

exp(M, N, E) :-
	natural(M),
	natural(N),
	N>0,
	M>0,
	Y_1 is N-1,
	exp(M, Y_1, Exp2),
	E is M * Exp2.

/*
num_t(+N,?T), cierto si T es el número triangular asociado con N, que se define como la suma de todos los números naturales menores o iguales a N. Para implementarlo, piense en la definición recursiva equivalente a la anterior.
*/
num_t(0, 0).
num_t(M, N) :-
	natural(M),
	M>0,
	M_1 is M-1,
	num_t(M_1, N1),
	N is N1 + M.


/*
Aunque los predicados aritméticos de Prolog permiten evaluar expresiones aritméticas, es interesante entender cómo podría definirse un predicado para evaluar este tipo de expresiones, es decir, cómo definir el predicado eval(+E, ?V), cierto si E es una expresión aritmética y V es el valor resultante después de evaluar E. Por ejemplo, la consulta ?- eval(5, X). debe devolver
X = 5, mientras que ?- eval(2+(3-12), X). debe devolver X = 􀀀7. Algunas de las reglas del predicado eval son las siguientes:
	El valor asociado con una expresión aritmética elemental (un número) es el propio número:
		eval(N, N) :- number(N).
	Para evaluar una expresión de la forma A+B, donde A y B son expresiones aritméticas cualesquiera, hay que evaluar (recursivamente) tanto A como B y sumar los valores obtenidos:
		eval(A+B, V) :- eval(A, VA), eval(B, VB), V is VA + VB.
	
*/
eval(N, N) :- number(N).
eval(A+B, V) :- 
	eval(A, VA),
	eval(B, VB),
	V is VA + VB.
eval(A-B, V) :- 
	eval(A, VA),
	eval(B, VB),
	V is VA - VB.
eval(A*B, V) :- 
	eval(A, VA),
	eval(B, VB),
	V is VA * VB.
eval(A/B, V) :- 
	eval(A, VA),
	eval(B, VB),
	V is VA / VB.

/* 
Complete el programa anterior de forma que las expresiones puedan además incluir operandos del tipo fact(N), siendo N un número natural, cuyo valor sea el factorial de N. Para ello, habrá que definir una regla con cabeza eval(fact(N), V), cierta si V es el factorial del número N. Recuerde que la implementación del predicado factorial(X,Y), cierto si Y es el factorial de X, se ha discutido en los apuntes.
*/
fact(0, 1). 
fact(X, Y) :- 
	natural(X),
	X > 0,
	X_1 is X-1,
	fact(X_1, Fact),
	Y is X * Fact.

eval(fact(N), V) :-
	integer(N), N >= 0,
	fact(N, V).