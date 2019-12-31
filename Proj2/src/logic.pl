define_board(Size, Board):-
  Length is Size*Size,
  length(Board, Length),
  domain(Board, 0, 9).

start_game :-
    define_board(5,List),
    list_to_matrix(List, 5, Board),
    restrictLines(Board, 5),
    restrictColumns(Board,5,5),
   % count(1, List, #=, Count),
    labeling([], List),
    print_board(Board).  

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

extractColumn(ColNumber, Matrix, Column) :-
  maplist(nth1(ColNumber), Matrix, Column).

restrictColumns(_,_,0).
restrictColumns(Board, Size, Index):-
extractColumn(Index, Board,Column),
restrictLine(Column,Size),
NewIndex is Index -1,
restrictColumns(Board,Size, NewIndex).


