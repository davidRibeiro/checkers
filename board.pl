% cell(Line, Column, Piece) - 
% Line in (1..8), 
% Column in (a..h),
% Cell can have b (blackChecker), B (blackQueen), w (whiteChecker), W (whiteQueen)
% '-' (unreachableCell), '_' (emptyCell)

% FirstLine
cell(a,1,w).
cell(b,1,'-').
cell(c,1,w).
cell(d,1,'-').
cell(e,1,w).
cell(f,1,'-').
cell(g,1,w).
cell(h,1,'-').

% SecondLine
cell(a,2,'-').
cell(b,2,w).
cell(c,2,'-').
cell(d,2,w).
cell(e,2,'-').
cell(f,2,w).
cell(g,2,'-').
cell(h,2,w).

% ThirdLine
cell(a,3,w).
cell(b,3,'-').
cell(c,3,w).
cell(d,3,'-').
cell(e,3,w).
cell(f,3,'-').
cell(g,3,w).
cell(h,3,'-').

% ForthLine
cell(a,4,'-').
cell(b,4,'_').
cell(c,4,'-').
cell(d,4,'_').
cell(e,4,'-').
cell(f,4,'_').
cell(g,4,'-').
cell(h,4,'_').

% FifthLine
cell(a,5,'_').
cell(b,5,'-').
cell(c,5,'_').
cell(d,5,'-').
cell(e,5,'_').
cell(f,5,'-').
cell(g,5,'_').
cell(h,5,'-').

% SixthLine
cell(a,6,'-').
cell(b,6,b).
cell(c,6,'-').
cell(d,6,b).
cell(e,6,'-').
cell(f,6,b).
cell(g,6,'-').
cell(h,6,b).

% SeventhLine
cell(a,7,b).
cell(b,7,'-').
cell(c,7,b).
cell(d,7,'-').
cell(e,7,b).
cell(f,7,'-').
cell(g,7,b).
cell(h,7,'-').

% EighthLine
cell(a,8,'-').
cell(b,8,b).
cell(c,8,'-').
cell(d,8,b).
cell(e,8,'-').
cell(f,8,b).
cell(g,8,'-').
cell(h,8,b).

% predicates to return a line as a list 
% used to print board
allColumns([a,b,c,d,e,f,g,h]).
nextColumnIndex(N, M, [N,M|_]).
nextColumnIndex(N, M, [_|T]) :- nextColumnIndex(N,M,T).
previousColumnIndex(N, M) :- allColumns(List), nextColumnIndex(M, N, List).

getLineAsList(LineIndex, List) :- getLineAsList(LineIndex, a, List).
getLineAsList(LineIndex, h, [T]) :- cell(h, LineIndex, T).
getLineAsList(LineIndex, ColumnIndex, [H|T]) :- 
		cell(ColumnIndex, LineIndex, H),
		allColumns(List),
		nextColumnIndex(ColumnIndex, N, List),
		getLineAsList(LineIndex, N, T).

% predicate to print board
printBoard(Board) :- printBoard(1, List), writeBoard(List), !.
printBoard(9, List) :- List = [[' ', a,b,c,d,e,f,g,h]], !.
printBoard(LineIndex, [H|List]) :- getLineAsList(LineIndex, Line), 
		append([LineIndex], Line, H), 
		L1 is LineIndex + 1,
		printBoard(L1, List).
writeBoard([]).
writeBoard([H|T]) :- swritef(S, '%t\t%t\t%t\t%t\t%t\t%t\t%t\t%t\t%t\n', H),write(S), writeBoard(T).