/*
a) Implemente y pruebe el predicado suma_lista(+L, ?S), cierto si L es una lista de números naturales y S es la suma de todos ellos. Se entenderá que la suma de una lista vacía es cero. En caso de que la entrada no se corresponda con lo esperado (por ejemplo, si el primer argumento no es una lista, o contiene términos que no son números naturales) el predicado no deberá producir ningún tipo de error, sino que deberá fallar (es decir, deberá devolver false).
b) Modifique la implementación anterior para que el predicado falle en el caso de que la lista sea vacía.
*/

natural(N) :-
	integer(N),
	N>=0.
suma_lista([], 0).
suma_lista([C|R], S) :-
	natural(C),
	suma_lista(R, S2),
	S is C + S2.




suma_lista2([C], C) :-
	natural(C).
suma_lista2([C|R], S) :-
	natural(C),
	suma_lis(R, SR),
	S is C + SR.