  :- use_module(library(lists)).

%
table([
[3,0,0,0,0],
[0,0,0,0,3],
[0,0,5,0,0],
[0,0,0,1,0],
[0,6,0,0,0]
]).
  
display_banner :-
  nl, nl,
  write(' M I D D L E  S U M  '),
  nl, nl.

print_table_header :-
write('   '),
write('\n|---|---|---|---|---|\n').

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

board([], 6):- !.
board([H|T], N) :-
  write('| '),
  print_column(H),
  write('\n|---|---|---|---|---|\n'),
  Next is (N + 1),
  board(T, Next).

print_board(Board) :-
  print_table_header,
  board(Board, 1).

display_game(Board, Player) :-
  print_board(Board).


  

  
