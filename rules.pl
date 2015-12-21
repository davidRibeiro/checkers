move(b(Board),X1,Y1,X2,Y2,Player) :-
		getChar(b(Board),X1,Y1,Piece),
		getChar(b(Board),X1,Y1,Blank),
		
		(Y1-Y2 is 1; Y2-Y1 is 1),
		(

		
getChar(b([[X,Y:C]|_]),X,Y,C).
getChar(b([_|T],X,Y,C) :- getChar(b(T),X,Y,C).