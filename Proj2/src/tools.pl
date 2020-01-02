list_to_matrix([], _,[]).
list_to_matrix(List, Size,[Row|Matrix]):-
  list_to_matrix_row(List,Size,Row,Tail),
  list_to_matrix(Tail,Size,Matrix).

list_to_matrix_row(Tail,0,[],Tail).
list_to_matrix_row([Item|List], Size, [Item|Row],Tail):-
  NSize is Size-1,
  list_to_matrix_row(List,NSize,Row,Tail).

getValueFromList([H|_T], 1, H).

getValueFromList([_H|T], Index, Value) :-
  Index > 0,
  Index1 is Index - 1,
  getValueFromList(T, Index1, Value).
