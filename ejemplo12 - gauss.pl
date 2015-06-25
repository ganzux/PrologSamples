gauss(0, 0).
gauus(N, R) :-
	A is N-1,
	gauss(A, Ra),
	R is N+Ra.