% pide_numero(-X)
% X es un numero leıdo del fichero de lectura actual
pide_numero(X) :-
	write('Introduzca un numero: '),
	nl,
	read(X).

% escribe_cuadrado(+X)
% escribe X y su cuadrado en el fichero de escritura actual
escribe_cuadrado(X) :-
	X2 is X*X,
	write('El cuadrado de '),
	write(X),
	write(' es '),
	write(X2).

% pide un numero y lo escribe, junto con su cuadrado,
% en un fichero que se crea a tal efecto
cuadrado :-
	pide_numero(X),
	open('c:/prolog/prueba.txt', write, Prueba),
	set_output(Prueba),
	escribe_cuadrado(X),
	close(Prueba),
	set_output(user), % user es el identificador de la pantalla
	write('el cuadrado se ha escrito en el fichero prueba.txt').