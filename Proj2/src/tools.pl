list_to_matrix([], _,[]).
list_to_matrix(List, Size,[Row|Matrix]):-
  list_to_matrix_row(List,Size,Row,Tail),
  list_to_matrix(Tail,Size,Matrix).

list_to_matrix_row(Tail,0,[],Tail).
list_to_matrix_row([Item|List], Size, [Item|Row],Tail):-
  NSize is Size-1,
  list_to_matrix_row(List,NSize,Row,Tail).

reset_timer :-
  statistics(walltime,_).

print_time :-
  statistics(walltime,[_,T]),
  TS is ((T//10)*10)/1000,
  nl, write('Solution Time: '), write(TS), write('s'), nl, nl.