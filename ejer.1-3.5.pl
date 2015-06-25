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
Escriba en L�gica de Primer Orden y en Prolog las siguientes preguntas:
* �Existen pares de personas tales que una es enemiga de la otra? En caso afirmativo, �qui�nes son?
* �Tiene Dolores alg�n enemigo?
* �Qui�nes son los enemigos de Ca�n, si los tiene?
* �Son Abel y Ca�n enemigos de una misma persona? En caso afirmativo, de qui�n o qui�nes?
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
?- amigo(Uno,Dos).	-> �Existen 2 personas tales que la primera es amiga de la segunda? �Qui�nes?
?- enemigo(X,X).	-> �Alguien es amigo de si mismo? �Qui�n?
?- enemigo(X,Y), enemigo(X,Z), enemigo(Y,Z).	-> �Hay alguien que tenga 2 enemigos que sean enemigos entre s�? �Qui�nes?
?- enemigo(_, abel).	-> �Tiene abel enemigos?
?- amigo(Amigo, dolores).	-> Tiene amigos dolores? �Qui�nes?
*/

/*
Estime cu�les deber�an ser las respuestas a las consultas anteriores, sabiendo
que se dispone del conocimiento plasmado en el programa relativo a amistades.
Emplee para ello alg�n m�todo de demostraci�n para la L�gica de Primer
Orden de los estudiados en la asignatura de L�gica, o h�galo informalmente
usando su sentido com�n.
*/
amigo(Uno,Dos).			% Nos devolver�a todos los pares que pusimos
enemigo(X,X).			% false
enemigo(X,Y),
enemigo(X,Z),
enemigo(Y,Z).			% false
enemigo(_, abel).		% false
amigo(Amigo, dolores).	% abel y abilio