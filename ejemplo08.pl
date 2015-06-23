longitud([], 0).
longitud([_|R], Long) :-
	longitud(R, LongR),
	Long is LongR + 1.

/*
longitud([[a,b,c,d],1], X).
longitud(L, Long).
*/