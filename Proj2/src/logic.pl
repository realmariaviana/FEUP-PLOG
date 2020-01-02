

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


  restrictCreateLines(Board, N),
  restrictCreateColumns(Board,N,N),

  labeling([ffc], List),
  createRestrictions(Board,0,0,N,[], Restrictions_final),/* 
  write('Restrictions:\n'),
  write(Restrictions_final),
  nl, */
  
  

  isSolvable(N,Restrictions_final,BoardSolved),

  write('Board to Solve\n'),
  nl,
  print_board(Board,N),

  write('Board Solved'),
  nl,  
  print_board(BoardSolved,N).



restrictCreateLine(Line, Size):-
  LineLength #= Size-1,
  sum(Line,#=,Double),  
  count(0,Line, #=, LineLength),
  A #\= 0,
	element(I, Line, A).

restrictCreateLines([],_).
restrictCreateLines([H|T], Size):-
  restrictCreateLine(H,Size), 
  restrictCreateLines(T,Size).

restrictCreateColumns(_,_,0).
restrictCreateColumns(Board, Size, Index):-
  columnN(Board, Index,Column),
  restrictCreateLine(Column,Size),
  NewIndex is Index -1,
  restrictCreateColumns(Board,Size, NewIndex).

isSolvable(Size,Restrictions,BoardSolved):-
  
  define_board(Size,List),
  list_to_matrix(List, Size, Board),

  givenContrains(Board,Restrictions),
  
  restrictLines(Board, Size),
  restrictColumns(Board,Size,Size),

  labeling([ffc], List),
  
  BoardSolved = Board.



createRestrictions([],_,_,_,Restrictions_final, Restrictions_final).

createRestrictions([H|T],Row,Column,N,Restrictions_aux, Restrictions_final):-
  (Column \= N ->
    % getValueFromList(H,Column,Aux1),
    nth0(Column,H,Aux1),
    (Aux1 =:= 0 ->
      New_column is Column +1,
      createRestrictions([H|T],Row,New_column,N,Restrictions_aux,Restrictions_final)
      ;
      Row_to_append is Row+1,
      Column_to_append is Column+1,

      append(Restrictions_aux,[Row_to_append-Column_to_append-Aux1],Restrictions_aux1),
      
      
      New_row is Row +1,
      New_column is 0,
      createRestrictions(T,New_row,New_column,N,Restrictions_aux1,Restrictions_final)
    )
    ;
    New_row is Row +1,
      New_column is N,
      createRestrictions(T,New_row,New_column,N,Restrictions_aux,Restrictions_final)
  ).

