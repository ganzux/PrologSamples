% pertenece(?Elemento, ?Lista)
% cierto si 'Elemento' pertenece a 'Lista'
	pertenece(C,[C|_]).
	pertenece(C,[_|R]):-
		pertenece(C,R).


% longitud(?Lista, ?Nat}
% cierto si 'Nat' representa el n´umero de elementos de la lista 'Lista'
	longitud([], 0).
	longitud([_|R], N) :-
		longitud(R, N_R),
		N is N_R + 1.


% concatena(?L1, ?L2, ?L)
% cierto si 'L' es la concatenaci´on de 'L1' y 'L2'
	concatena([], L, L).
	concatena([C|R], L, [C|NL]) :-
		concatena(R, L, NL).


% ultimo(?L, ?U)
% cierto si U es el ´ultimo elemento de la lista L
	ultimo([C],C).
	ultimo([_|R],U) :-
		ultimo(R,U).


% insertarfinal(?L,?E,?NL)
% cierto si NL es el resultado de insertar el elemento E
% al final de la lista L
	insertarfinal([],E,[E]).
	insertarfinal([C|R],E,[C|RL]) :-
		insertarfinal(R,E,RL).


% inversa(?L,?LI)
% cierto si LI es la inversa de L
	inversa([],[]).
	inversa([C|R],L) :-
		inversa(R,RI),
		insertarfinal(RI,C,L).

/*
concatena([a], [b,c], L).
concatena([a], L, [a,b,c]).
concatena(L, [b,c], [a,b,c])
concatena(X, Y, [a,b,c]).
*/