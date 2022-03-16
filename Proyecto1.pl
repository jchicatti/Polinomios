%Inteligencia Artificial
%Doctor Andrés Gómez de Silva Garza
%Práctica 1: Polinomios
%David Emmanuel González Cázares   198582
%Nuria Hernández Alás   188511
%Josué Doménico Chicatti Avendaño   191169



%printList([]).
%printList([X|L1]):-
%	write(X),
%	nl,
%	printList(L1).

%combina([],L2,L2):-!.
%combina([X|L1],L2,[X|L3]):-
%	combina(L1,L2,L3).

%getFirst(X,[X|_]).

%grado de un polinomio
%polyDeg(_,[]).
%polyDeg(C,[_|Ms]):-
%	D is C+1,
%	polyDeg(D,Ms).

%reducción de un poliniomio
%un_red([],Ss):-
%	reverse(Ss,Ss1), 
%	combina(Ss1,[],Ss).
%un_red([M],Ss):-
%	M=:=0;
%	M=\=0,
%	un_red([],[M|Ss]),
%	fail.
%un_red([M|Ms],Ss):-
%	un_red(Ms,[M|Ss]).
%
%polyRed(Ms,Ss):-
%	un_red(Ms,Ssr),
%	polyRed(Ssr,Ss).
	

%suma de polinomios.//funciona
%La primera y segunda entrada son los polinomios por sumar, y el tercer argumento es el resultado
polySum(Ms,[],Ms):- Ms=[_|_].
polySum([],Ns,Ns).
polySum([M|Ms],[N|Ns],[S|Ss]):-
	S is M+N,
	polySum(Ms,Ns,Ss).
%La primera y segunda entrada son los polinomios por restar (el segundo se resta al primero) y el tercer argumento es el resultado
%resta de polinomios.//funciona

polyMin(Ms,[],Ms):- Ms=[_|_].
polyMin([],Ns,Ns):- Ss is Ns*(-1), Ns is Ss.
polyMin([M|Ms],[N|Ns],[S|Ss]):-
	S is M-N,
	polyMin(Ms,Ns,Ss).

%segundo intento producto de polinomios//funciona
%scal_prod multiplca un polinomio (primer argumento) por un escalar (segundo argumento) y da un resultado (tercer argumento)
scal_prod([],_Sc,[]).
scal_prod([M|Ms], Sc, [P|Ps]) :-
   	P is M*Sc,
   	scal_prod(Ms, Sc, Ps).
% poly_prod multiplica dos polinomios (primer y segunda argumento) y da un resultado (tercer argumento)
poly_prod(_,[],[]).
poly_prod(Ms,[N|Ns], Xs2) :-
   	poly_prod(Ms,Ns, Xs1),
   	scal_prod(Ms, N, Ps),
    	polySum(Ps, [0|Xs1], Xs2).


%derivada de polinomios.//funciona
%el primer argumento es un contador que indica el inicio para poder eliminar el primer término polinomial constante
%el segundo argumento es el polinomio por derivar y el tercer argumento es el resultado
polyDif(_,[],_).
polyDif(0,[_|Ms],Ds):-
	polyDif(1,Ms,Ds).
polyDif(C,[M|Ms],[D|Ds]):-
	B is C+1,
	D is M*C,
	polyDif(B,Ms,Ds).

%composición de polinomios//
%los polinomios por componer son el primer y segundo argumento (el segundo argumento se compone respecto al primero) y el resultado es la tercera entrada
polyComp([],_,[0]).
polyComp([M|Ms],Ns,Ss):-
	polyComp(Ms,Ns,Ss1),
	poly_prod(Ns,Ss1,S1),
	polySum([M],S1,Ss).

%evaluación de polinomios//por revisar
%La primera entrada es la potencia que se multiplica por el término del polinomio
%la segunda entrada es el polinomio, la tercera el valor para evaluar y la cuarta es la respuesta
polyEval(_,[],_,0):- !.
polyEval(C,[M|Ms],V,Ss):-
	D is C+1,
	polyEval(D,Ms,V,Ss1),
	Ss is Ss1+(M*(V**C)).
	
%equals
polyEqual([],[]).
polyEqual([],_):-
	fail.
polyEqual(_,_):-
	fail.
polyEqual([M|Ms],[N|Ns]):-
	M=:=N,
	polyEqual(Ms,Ns).

%impresión de polinomios//funciona
%la primera entrada es el contador para indicar que se invierte la lista del polinomio, la tercera entrada es un contador que es 0 si aún no se imprime un término y 1 cuando ya lo hizo
%la segunda entrada es el polinomio como lista
%para potencias elevadas a la 1, o para coeficientes que son 1, se usan el primer argumento y el valor de M, un término de la lista, para determinar que no se escriban explícitamente
%el tercer contador es para evitar que la recursividad ponga un signo de suma o resta para el primer término del polinomio
polyPrint(_,[M],_):-
	M=:=0;
	M>0,
	write("+ "),
	write(M);
	M<0,
	write("- "),
	M1 is (-1)*M,
	write(M1).
polyPrint(0,Ms,0):-
	reverse(Ms,Ns),
	length(Ns,L),
	C is L-1,
	polyPrint(C,Ns,0).
polyPrint(C,[M|Ms],Con):-
	C=:=1, M=:=1, Con=:=0,
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	C=:=1, M=:= -1, Con=:=0,
	write("-x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	C=:=1, M=:=1, Con>0,
	write("+ "),
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	C=:=1, M=:= -1, Con>0,
	write("- "),
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	M=:=1, Con=:=0,
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	M=:= -1, Con=:=0,
	write("-x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	M=:=1, Con>0,
	write("+ "),
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	M=:= -1, Con>0,
	write("- "),
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	C=:=1, M>1, Con=:=0,
	write(M),
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	C=:=1, M<1, M>0, Con=:=0,
	write(M),
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	C=:=1, M< -1, Con=:=0,
	write(M),
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	C=:=1, M> -1, M<0, Con=:=0,
	write(M),
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	C=:=1, M>1, Con>0,
	write("+ "),
	write(M),
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	C=:=1, M<1, M>0, Con>0,
	write("+ "),
	write(M),
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	C=:=1, M< -1, Con>0,
	write("- "),
	M1 is (-1)*M,
	write(M1),
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	C=:=1, M> -1, M<0, Con>0,
	write("- "),
	M1 is (-1)*M,
	write(M1),
	write("x"),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	M>1, Con=:=0,
	write(M),
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	M<1, M>0, Con=:=0,
	write(M),
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	M< -1, Con=:=0,
	write(M),
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	M> -1, M<0, Con=:=0,
	write(M),
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,1);
	M>1, Con>0,
	write("+ "),
	write(M),
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	M<1, M>0, Con>0,
	write("+ "),
	write(M),
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	M< -1, Con>0,
	write("- "),
	M1 is (-1)*M,
	write(M1),
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	M> -1, M<0, Con>0,
	write("- "),
	M1 is (-1)*M,
	write(M1),
	write("x^"),
	write(C),
	write(" "),
	D is C-1,
	polyPrint(D,Ms,Con);
	M=:=0,
	D is C-1,
	polyPrint(D,Ms,Con).

%(   X < 0 ->
%    writeln('X is negative.  That's weird!  Failing now.'),
%    fail
%;   X =:= 0 ->
%    writeln('X is zero.')
%;   writeln('X is positive.')
%)

%método main, donde se muestran dos polinomios y se escriben explícitamente sus valores y los resultados que dan con cada regla usada
main:-
	write("Polinomio f(x): "),
	polyPrint(0,[1,0,3,4],0),
	nl,
	write("Polinomio g(x): "),
	polyPrint(0,[5,0,3],0),
	nl,
	nl,
	%suma
	write("Suma de polinomios:"),
	nl,
	write("f(x)+g(x)= "),
	polySum([1,0,3,4],[5,0,3],Ss1),
	polyPrint(0,Ss1,0),
	nl,
	nl,
	%resta
	write("Resta de polinomios:"),
	nl,
	write("f(x)-g(x)= "),
	polyMin([1,0,3,4],[5,0,3],Ss2),
	polyPrint(0,Ss2,0),
	nl,
	nl,
	%producto
	write("Producto de polinomios:"),
	nl,
	write("f(x)*g(x)= "),
	poly_prod([1,0,3,4],[5,0,3],Ss3),
	polyPrint(0,Ss3,0),
	nl,
	nl,
	%composición
	write("Composicion de polinomios:"),
	nl,
	write("f(g(x))= "),
	polyComp([1,0,3,4],[5,0,3],Ss4),
	polyPrint(0,Ss4,0),
	nl,
	nl,
	%derivada
	write("Derivada de polinomios:"),
	nl,
	write("f'(x)= "),
	polyDif(0,[1,0,3,4],Ss5),
	polyPrint(0,Ss5,0),
	nl,
	nl,
	write("g'(x)= "),
	polyDif(0,[5,0,3],Ss6),
	polyPrint(0,Ss6,0),
	nl,
	nl,
	%evaluación cuando x=12
	write("Evaluacion de polinomios cuando x=12:"),
	nl,
	write("f(12)= "),
	polyEval(0,[1,0,3,4],12,Ss7),
	write(Ss7),
	nl,
	write("g(12)= "),
	polyEval(0,[5,0,3],12,Ss8),
	write(Ss8).
main.