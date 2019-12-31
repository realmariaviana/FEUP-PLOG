define_board(Size, Board):-
  Length is Size*Size,
  length(Board, Length),
  domain(Board, 0, 9).

start_game :-
    define_board(5,List),
    list_to_matrix(List, 5, Board),
    restrictLines(Board, 5),
   % count(1, List, #=, Count),
    labeling([ffc], List),
    print_board(Board).  

restrictLine(Line, Size):-
  LineLength #= Size-3,
  maximum(Max, Line),
  Double #= Max * 2,
  sum(Line,#=,Double),  
  count(0,Line, #=, LineLength).

restrictLines([],_).
restrictLines([H|T], Size):-
   restrictLine(H,Size), 
  restrictLines(T,Size).


constrain_horizontal_lines(_,[]).
constrain_horizontal_lines(Board,[Row-Num|T]):-
  nth1(Row,Board,Line),
  sum(Line,#=,Num),
  constrain_horizontal_lines(Board,T).