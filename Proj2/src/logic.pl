define_board(Size, Board):-
  Length is Size*Size,
  length(Board, Length),
  domain(Board, 0, 9).

start_solving(N) :-
  board(N, Size,Restrictions),
  define_board(Size,List),
  list_to_matrix(List, Size, Board),
  givenContrains(Board,Restrictions),
  restrictLines(Board, Size),
  restrictColumns(Board,Size,Size),
  labeling([ffc], List),
  print_board(Board,Size).  


givenContrains(_,[]).
givenContrains(Board, [Row-Column-Number|T]):-
  rowN(Board, Row, Line),
  element(Column, Line, Restriction),
  Restriction #= Number,
  givenContrains(Board, T).

board(1,4,[1-4-2, 2-2-9, 3-1-7, 4-3-3]).
board(2,5,[1-1-3, 2-5-3, 3-3-5, 4-4-1, 5-2-6]).
board(3,6,[1-2-3, 2-1-1, 3-6-3, 4-4-2, 5-5-8, 6-3-8]).
board(4,7,[1-6-2, 2-4-9, 3-1-5, 4-3-4, 5-7-8, 6-2-4, 7-5-4]).
board(5,8,[1-2-7, 2-6-4, 3-7-5, 4-5-8, 5-8-3, 6-4-2, 7-3-3, 8-1-2]).

restrictLine(Line, Size):-
  LineLength #= Size-3,
  maximum(Max, Line),
  Double #= Max * 2,
  sum(Line,#=,Double),  
  count(0,Line, #=, LineLength),
  A #\= 0,
	B #\= 0,
	C #\= 0,
	element(I, Line, A),
	I1 #>I,
	I2 #<I,
	element(I1, Line, B),
	element(I2, Line, C),
	A #= B+C.

restrictLines([],_).
restrictLines([H|T], Size):-
   restrictLine(H,Size), 
  restrictLines(T,Size).

rowN([H|_],1,H):-!.
rowN([_|T],I,X) :-
  I1 is I-1,
  rowN(T,I1,X).

columnN([],_,[]).
columnN([H|T], I, [R|X]):-
  rowN(H, I, R),
  columnN(T,I,X).

restrictColumns(_,_,0).
restrictColumns(Board, Size, Index):-
  columnN(Board, Index,Column),
  restrictLine(Column,Size),
  NewIndex is Index -1,
  restrictColumns(Board,Size, NewIndex).

start_generating(N):-
  define_board(N,List),
  list_to_matrix(List, N, Board),


  restrictLines(Board, N),
  restrictColumns(Board,N,N),
  labeling([ffc], List),
  print_board(Board,N).
