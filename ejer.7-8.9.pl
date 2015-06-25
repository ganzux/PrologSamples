/*
Implemente el predicado reemplazar(+L,+E1,+E2,?NL), cierto si NL es la lista resultante de reemplazar en la lista L todas las ocurrencias de E1 por E2.
*/
% reemplazar(+L,+E1,+E2,?NL): cierto si NL es la lista resultante de reemplazar en la lista L todas las ocurrencias de E1 por E2.
reemplazar([], _, _, []).

reemplazar([E1|RL], E1, E2, [E2|RNL]):-
	!,										% Si esto falla, poda la rama!
	reemplazar(RL, E1, E2, RNL).

reemplazar([X|RL], E1, E2, [X|RNL]):-
	reemplazar(RL, E1, E2, RNL).