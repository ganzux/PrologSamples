/*
Sintaxis: consultas
Dado el programa en Prolog del tema 8 relativo a amistades (Cuadro 2 del tema 8):

*/

% enemigo(?X,?Y): cierto si X es enemigo de Y
enemigo(abel, cain).
enemigo(cain, blas).
enemigo(cain, dolores).
enemigo(blas, abilio).
% amigo(?X,?Y): cierto si X es amigo de Y
amigo(abilio, X) :-
	amigo(abel, X).
amigo(X,Y) :-
	enemigo(X,Z),
	enemigo(Z,Y).

/*
Escriba en Lógica de Primer Orden y en Prolog las siguientes preguntas:
* ¿Existen pares de personas tales que una es enemiga de la otra? En caso afirmativo, ¿quiénes son?
* ¿Tiene Dolores algún enemigo?
* ¿Quiénes son los enemigos de Caín, si los tiene?
* ¿Son Abel y Caín enemigos de una misma persona? En caso afirmativo, de quién o quiénes?
*/
% Existe X, Existe Y tales que enemigo(X, Y) y enemigo(Y,X)
enemigo(X, Y), enemigo(Y, X).

% Existe X tal que enemigo(X, dolores)
enemigo(_, dolores).

% Existe X tal que enemigo(X, cain)
enemigo(_, cain).

% Existe X tal que enemigo(cain, X) y enemigo(abel, X)
enemigo(cain, X), enemigo(abel, X).

/*
Para cada una de las siguientes consultas en Prolog, exprese su significado en lenguaje natural:
?- amigo(Uno,Dos).	-> ¿Existen 2 personas tales que la primera es amiga de la segunda? ¿Quiénes?
?- enemigo(X,X).	-> ¿Alguien es amigo de si mismo? ¿Quién?
?- enemigo(X,Y), enemigo(X,Z), enemigo(Y,Z).	-> ¿Hay alguien que tenga 2 enemigos que sean enemigos entre sí? ¿Quiénes?
?- enemigo(_, abel).	-> ¿Tiene abel enemigos?
?- amigo(Amigo, dolores).	-> Tiene amigos dolores? ¿Quiénes?
*/

/*
Estime cuáles deberían ser las respuestas a las consultas anteriores, sabiendo
que se dispone del conocimiento plasmado en el programa relativo a amistades.
Emplee para ello algún método de demostración para la Lógica de Primer
Orden de los estudiados en la asignatura de Lógica, o hágalo informalmente
usando su sentido común.
*/
amigo(Uno,Dos).			% Nos devolvería todos los pares que pusimos
enemigo(X,X).			% false
enemigo(X,Y),
enemigo(X,Z),
enemigo(Y,Z).			% false
enemigo(_, abel).		% false
amigo(Amigo, dolores).	% abel y abilio