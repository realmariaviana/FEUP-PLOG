start_game :-
    length(List, 25),
    domain(List,0,9),
    list_to_matrix(List, 5, Board),
    restrictLines(Board),
    labeling([], List),
    print_board(Board).  

restrictLines([]).
restrictLines([H|T]):-
  length(H, L),
  LineLength is L-3,
  global_cardinality(H, [0-LineLength]),
  restrictLines(T).