% imprime_lista(+L)
% Escribe los elementos de la lista ’L’ en el fichero actual,
% uno por l´ınea
imprime_lista([]).
imprime_lista([C|R]) :-
	write(C),
	nl,
	imprime_lista(R).