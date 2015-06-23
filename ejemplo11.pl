% Implementaci´on de un Aut´omata Finito No Determinista (AFND)
% inicial(?E)
% cierto si E es el estado inicial
inicial(q0).
% final(?E)
% cierto si E es un estado final
final(q2).
final(q3).
% transicion(?E1, ?S, ?E2)
% cierto si el Aut´omata transita del estado ’E1’ al ’E2’
% leyendo el s´ımbolo ’S’
transicion(q0, a, q1).
transicion(q0, a, q3).
transicion(q1, b, q2).
transicion(q3, a, q0).
% lambda(?E1, ?E2)
% cierto si el aut´omata tiene una transici´on lambda de E1 a E2
lambda(q2, q1).
% acepta(?L)
% cierto si el aut´omata acepta la palabra ’L’
% (representada mediante una lista de s´ımbolos, p.ej. [a,b])
acepta(L) :-inicial(I),
acepta(I, L).
% acepta(?E, ?L)
% cierto si el aut´omata, partiendo del estado E, acepta la palabra ’L’
% (representada mediante una lista de s´ımbolos, p.ej. [a,b])
acepta(E, []) :-final(E).
acepta(E, [C|R]) :-transicion(E, C, E2),
acepta(E2, R).
acepta(E, L) :-lambda(E, E2),
acepta(E2, L).