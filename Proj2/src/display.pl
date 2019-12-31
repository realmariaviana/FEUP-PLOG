  :- use_module(library(lists)).


display_banner :-
  nl, nl,
  write(' M I D D L E  S U M  '),
  nl, nl.

print_table_header :-
write('   '),
write('\n|---|---|---|---|---|\n').

print_table_header(0):-
  write('|\n').

print_table_header(N):-
  N>0,
  N0 is N-1,
  write('|---'),
  print_table_header(N0).

print_cell(0):- write(' '), !.
print_cell(1):- write('1'), !.
print_cell(2):- write('2'), !.
print_cell(3):- write('3'), !.
print_cell(4):- write('4'), !.
print_cell(5):- write('5'), !.
print_cell(6):- write('6'), !.
print_cell(7):- write('7'), !.
print_cell(8):- write('8'), !.
print_cell(9):- write('9'), !.

print_column([]):- !.
print_column([H|T]) :-
    print_cell(H),
    write(' | '),
    print_column(T).

board([], _,_):- !.
board([H|T], N,Size) :-
  write('| '),
  print_column(H),
  nl,
  print_table_header(Size),
  Next is (N + 1),
  board(T, Next,Size).

print_board(Board,Size) :-
  print_table_header(Size),
  board(Board, 1,Size).

display_game(Board, Player) :-
  print_board(Board).
