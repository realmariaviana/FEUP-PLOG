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
write('     '),
write('1'), write(' '), write('|'), write(' '), write('2'), write(' '), write('|'), write(' '),
write('3'), write(' '), write('|'), write(' '), write('4'), write(' '), write('|'), write(' '), write('5'), nl.

print_cell(0):- put_code(173), !.
print_cell(1):- put_code(9679), !.
print_cell(2):- put_code(9675), !.

print_column([]):- !.
print_column([H|T]) :-
    print_cell(H),
    write(' | '),
    print_column(T).

board([], 6):- !.
board([H|T], N) :-
  print_format_number(N),
  write('| '),
  print_column(H),
  print_format_number(N),
  nl,
  Next is (N + 1),
  board(T, Next).

print_format_number(N) :-
  !,
  write(N),
  write('  ').

print_board(Board) :-
  print_table_header,
  board(Board, 1),
  print_table_header.

show_player(Player) :-
  Player =:= 1, nl, write('       PLAYER: black'), nl, nl;
  Player =:= 2, nl, write('       PLAYER: white'), nl, nl.

display_game(Board, Player) :-
  show_player(Player),
  nl,
  print_board(Board).

init:-
 table(Board),
 Player is 1,
 gameLoop(Board, Player, NBoard, 8).
