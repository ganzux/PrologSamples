listar(L) :-
	Cabeza = [1,2,3,4,5],
	Cola = [6,7,8,9],
	L = [0,Cabeza,Cola].

dameCabeza([C|_], C).

progenitor(a, [b,c,d,e,f,g,h,i,j,k]).
progenitor(l, [m,n,o,p,q,r,s,t,u,v,w,x,y,z]).

padreDe(Padre, Hijo) :-
	progenitor(Padre, Hijos),
	buscar(Hijo, Hijos).

buscar(_, [])			:- !, fail.
buscar(Hijo, [Hijo|_]).	% :- !, true.
buscar(Hijo, [_|Resto])	:- buscar(Hijo, Resto).