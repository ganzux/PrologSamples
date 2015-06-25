/*
Sabiendo que dispone de todos los predicados para el manejo de listas implementados en los apuntes, proponga una implementación alternativa, no recursiva, para el predicado pertenece/2
*/
pertenece([],_).
pertenece(X, L) :-
	concatena(_, [X|_], L).