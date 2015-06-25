/*
Escriba un programa en Prolog que simule el funcionamiento del siguiente autómata finito, que reconoce el lenguaje {a^n b^m : n,m > 0}
a          b
|    b     |   a
q0 -----> q1 -----> q2
final	  final

Escriba la consulta adecuada para calcular qué palabras de longitud dos acepta el autómata implementado. Construya el árbol de Resolución asociado para averiguar qué respuestas ofrece Prolog, y en qué orden.

acepta([X, Y]).
Primera respuesta: Uno = a, Dos = a
Segunda respuesta: Uno = a, Dos = b
Tercera respuesta: Uno = b, Dos = b
*/

% inicial(?E): cierto si E es el estado inicial
inicial(q0).

% final(?E):cierto si E es un estado final
final(q0).
final(q1).

% transicion(?E1, ?S, ?E2): cierto si el Autómata transita del estado ’E1’ al ’E2’ al leer el símbolo ’S’
transicion(q0, a, q0).
transicion(q0, b, q1).
transicion(q1, a, q2).
transicion(q1, b, q1).
transicion(q2, a, q2).
transicion(q2, b, q2).

% acepta(?L): cierto si el autómata acepta la palabra ’L’ (representada mediante una lista de símbolos, p.ej. [a,b])
acepta(L) :-
	inicial(I),
	acepta(I, L).
% acepta(?E, ?L): cierto si el autómata, partiendo del estado E, acepta la palabra ’L’ (representada mediante una lista de símbolos, p.ej. [a,b])
acepta(E, []) :-
	final(E).
acepta(E, [C|R]) :-
	transicion(E, C, E2),
	acepta(E2, R).