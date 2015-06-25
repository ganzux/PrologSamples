/* enesimo(?L, +N, ?E), cierto si E es el elemento de la lista L situado en la posición N (donde N ≥ 1 es un número natural), entendiendo que la cabeza de la lista está situada en la posición 1.
*/

enesimo([E|_], 1, E).
enesimo([_|R], N, E) :-
	integer(N),
	N > 0,
	N_1 = N - 1,
	enesimo(R, N_1, E).

/*
elimina_n(?L, +N, ?NL), cierto si NL es la lista resultante después de eliminar el elemento de L situado en la posición N (donde N ≥ 1 es un número natural), entendiendo que la cabeza de la lista está situada en la posición 1. Si N es mayor que la longitud de L, NL será igual a L.
*/
elimina_n([], _, []).
elimina_n([_|R], 1, R).
elimina_n([E|R], N, [E|NR]) :-
	integer(N),
	N > 1,
	N_1 is N - 1,
	elimina_n(R, N_1, NR).

/*
borrartodos(+L,+E,?NL), cierto si NL es la lista resultante después de eliminar de L todas las ocurrencias de E (si las hay).
*/
borrartodos([], _, []).

borrartodos([E|R], E, NL) :-	% Elimina de la lista
	!,							% Cortamos la ejecución
	borrartodos(R, E, NL).

borrartodos([C|R], E, [C|NR]) :-
	borrartodos(R, E, NR).

/*
insertardetras(+L,+E1,+E2,?NL), cierto si NL es la lista resultante de insertar E2 justo detrás de cada aparición de E1 en L.
*/

insertardetras([], _, _, []).

insertardetras([E1|L], E1, E2, [E1,E2|NL]) :-
	!,
	insertardetras(L, E1, E2, NL).

insertardetras([C|L], E1, E2, [C|NL]) :-
	insertardetras(L, E1, E2, NL).

/*
divide(+L, ?LNeg, ?LPos), cierto si L es una lista de números, LNeg es la lista formada por todos los números negativos de L y LPos es la lista formada por todos los números positivos o nulos de L, en ambos casos respetando el orden en el que aparecen en L. Facilite dos versiones distintas de este predicado, la segunda de ellas utilizando el predicado de corte.

*/
divide([], [], []).
divide([C|R], [C|LNeg], LPos) :-
	number(C),
	C < 0,
	divide(R, LNeg, LPos).
divide([C|R], LNeg, [C|LPos]) :-
	number(C),
	C >= 0,
	divide(R, LNeg, LPos).

divide2([], [], []).
divide2([C|R], [C|R1], R2) :-
	number(C),
	C < 0,
	!,
	divide2(R,R1,R2).
divide2([C|R], R1, [C|R2]) :-
	number(C),
	divide_v2(R,R1,R2).


/*cuenta_const(+TC, ?L, ?N), cierto si TC es un término constante y N es el número de apariciones de TC como elemento de la lista L.
Recuerde que Prolog proporciona predicados predefinidos para la clasificación de términos, entre los que figura atomic(X),cierto si X es un término constante. Tenga en cuenta que no deben contarse elementos que sean unificables con TC, sólo aquellos que sean idénticos.
Por ejemplo, la consulta “?- cuenta_const(a, [a,[a,p(a),b],X],N).” debe ser cierta con N=1, puesto que sólo una de las a’s que aparecen en L es un elemento de L (el resto de a’s están contenidasen el segundo elemento de L) y la variable X no debe contarse ya que, aunque es unificable con a, no es una a.
*/




/*
aplana(+L,?NL), cierto si L es una lista y NL es la lista formada por todos los términos que aparecen en L, obviando las listas internas de L en caso de que las haya. Por ejemplo, la consulta “?- aplana([a, [X,p(a,Z),[b,[c]]], V], A).” debe ser cierta con A = [a, X, p(a,Z), b, c, V].
Para implementar este predicado utilice los dos siguientes predicados predefinidos:
	is_list(+L), cierto si L es una lista.
	append(?L1, ?L2, ?L), cierto si L es la concatenación de L1 y L2 (este predicado es equivalente al predicado concatena discutido en los apuntes).
*/
aplana([], []).
aplana([C|R], L) :-
	is_list(C),
	!,
	aplana(C, LC),
	aplana(R, LR),
	append(LC, LR, L).
aplana([A|RL], [A|RNL]) :-
	aplana([RL], [RNL]).

/*

empaqueta(+L, ?NL), cierto si NL contiene los mismos elementos que la lista L pero de forma que toda ristra de elementos iguales consecutivos aparece empaquetada en una sublista.
Por ejemplo, la consulta “empaqueta([a,a,a,b,a,a,c,c,d], X).” debe devolver cierto con X=[[a,a,a], [b], [a,a], [c,c], [d]].
Una posible solución consiste en implementar y utilizar en la implementación de empaqueta el predicado auxiliar lista_cabeza(+L, ?LC, ?LR), cierto si L es una lista, LC es la lista formada por la ristra de elementos iguales consecutivos que encabeza L y LR es lo que queda en la lista.
Por ejemplo, la consulta “?- lista_cabeza([a,a,a,b,a,a,c,c,d], X, Y).” debe se cierta con X=[a,a,a] e Y=[b,a,a,c,c,d].

*/
lista_cabeza([], [], []).
lista_cabeza([C], [C], []).
lista_cabeza([C1,C2|R], [C1], [C2|R]) :-
	C1 \== C2,
	!.
lista_cabeza([C,C|R], [C|LC], LR) :-
	lista_cabeza([C|R], LC, LR).

empaqueta([], []).
empaqueta([C|R], [LC|NR]) :-
	lista_cabeza([C|R], LC, LR),
	empaqueta(LR, NR).



/*

codifica(+L, ?NL), cierto si L es una lista y NL es una lista cuyos elementos son listas de la forma [E,N], donde cada uno de estos pares representa una ristra de N elementos E consecutivos en L.
Por ejemplo, la consulta “?- codifica([a,a,a,b,a,a,c,c,d], LL).” debe ser cierta con LL = [[a,3], [b,1], [a,2], [c,2], [d,1]]. Para la implementación de este predicado puede utilizar el predicado empaqueta/2 anterior así como el predicado predefinido length(?L, ?N), cierto si N es la longitud de la lista N (este predicado es equivalente al predicado longitud discutido en los apuntes)

*/

codifica(L, NL) :-
	empaqueta(L, LL),
	transforma(LL, NL).
transforma([], []).
transforma([[C|LC]|R], [[C,N]|LR]) :-
	length([C|LC], N),
	transforma(R, LR).


/*
Implemente el predicado asteriscos(+L), cierto si L es una lista de números naturales positivos y para cada uno de ellos se escribe una línea con tantos asteriscos como indique el número correspondiente.
Por ejemplo, la consulta “?- asteriscos([2,1,3]).” debe devolver cierto y debe producir el efecto
**
*
***
*/

asteriscos([]).
asteriscos([C|R]) :-
	escribe_asteriscos(C),
	nl,
	asteriscos(R).

escribe_asteriscos(1) :- write(*).

escribe_asteriscos(N) :-
	N>1,
	write(*),
	N1 is N-1,
	escribe_asteriscos(N1).
















