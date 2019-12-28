:- use_module(library(lists)).

%
table([
[0,0,0,0,0],
[0,0,0,0,0],
[0,0,0,0,0],
[0,0,0,0,0],
[0,0,0,0,0]
]).
  
display_banner :-
    write(' _______  _______  ______    _______  ___   _______  __   __  _______    _   ___ '), nl,
    write('|       ||       ||    _ |  |   _   ||   | |       ||  | |  ||       |  | | |   |'), nl,
    write('|  _____||_     _||   | ||  |  |_|  ||   | |    ___||  |_|  ||_     _|  | |_|   |'), nl,
    write('| |_____   |   |  |   |_||_ |       ||   | |   | __ |       |  |   |    |       |'), nl,
    write('|_____  |  |   |  |    __  ||       ||   | |   ||  ||       |  |   |    |___    |'), nl,
    write(' _____| |  |   |  |   |  | ||   _   ||   | |   |_| ||   _   |  |   |        |   |'), nl,
    write('|_______|  |___|  |___|  |_||__| |__||___| |_______||__| |__|  |___|        |___|'), nl, nl, nl, nl.

print_table_header :-
write('   '),
write('---------------'),  nl.

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
  print_column(H),
  nl,
  print_table_header,
  Next is (N + 1),
  board(T, Next).

print_format_number(N) :-
  !,
  write(N),
  write('  ').

print_board(Board) :-
  print_table_header,
  board(Board, 1).


display_game(Board, Player) :-
  print_board(Board).


  

  

