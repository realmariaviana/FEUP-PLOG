
/*extractAllColumns(Counter, [H|T], Column):-
  Counter is 0,
  extractColumn(Counter, H, Column),
  length(Column, L),
  ColumnLength is L-3,
  global_cardinality(Column, [0-ColumnLength]),
  NewCounter is Counter + 1,
  extractAllColumns(NewCounter, T).*/

list_to_matrix([], _,[]).
list_to_matrix(List, Size,[Row|Matrix]):-
  list_to_matrix_row(List,Size,Row,Tail),
  list_to_matrix(Tail,Size,Matrix).

list_to_matrix_row(Tail,0,[],Tail).
list_to_matrix_row([Item|List], Size, [Item|Row],Tail):-
  NSize is Size-1,
  list_to_matrix_row(List,NSize,Row,Tail).