:- ['board'].
:- ['rules'].

% user is the white checkers
% cpu is the black checkers
humanFirst :- 
		init(Board), assert(b(Board)), assert(player),
		assert(minToMove(w/_)), assert(maxToMove(b/_)),
		assert(sign(player, w)), assert(sign(cpu, b)),
		printBoard(Board).
		
% user is the black checkers
% cpu is the white checkers		
cpuFirst :- 
		init(Board), assert(b(Board)), retract(player),
		assert(minToMove(b/_)), assert(maxToMove(w/_)),
		assert(sign(player, b)), assert(sign(cpu, w)),
		printBoard(Board).

% start the board
init(Board) :- findall([X,Y:Z], cell(X,Y,Z), Board).

% retracts all, used when the game ends
clearAll :- 
		retractall(maxToMove(_)), retractall(minToMove(_)), 
		retractall(b(_)), retractall(sign(_,_)), retract(player), !.

playerMove(X1, Y1, X2, Y2) :-
		player,
		move(b(Board),X1,Y1,X2,Y2,Player),
		retract(player).
		
%cpuMove :- not(player), QUALQUER COISA, 

