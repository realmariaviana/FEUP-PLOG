:- use_module(library(lists)).

%
table([[0,0,0,0,0],
           [0,2,2,2,0],
           [1,1,1,1,2],
           [0,0,0,0,0],
           [0,0,0,0,0]
           ]).



% Displays the game banner
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
write('A'), write(' '), write('|'), write(' '), write('B'), write(' '), write('|'), write(' '),
write('C'), write(' '), write('|'), write(' '), write('D'), write(' '), write('|'), write(' '), write('E'), nl.

print_cell(0):- put_code(173), !.
print_cell(1):- put_code(9679), !.
print_cell(2):- put_code(9675).

print_column([]):- !.
print_column([H|T]) :-
    print_cell(H),
    write(' | '),
    print_column(T).

print_board([], 6):- !.
print_board([H|T], N) :-
  print_format_number(N),
  write('| '),
  print_column(H),
  print_format_number(N),
  nl,
  Next is (N + 1),
  print_board(T, Next).

print_format_number(N) :-
  !,
  write(N),
  write('  ').

initBoard(Board) :-
  table(Board),
  print_table_header,
  print_board(Board, 1),
  print_table_header.

show_player(Player) :-
  Player = '1', nl, write('PLAYER: black'), nl, nl;
  Player = '2', nl, write('PLAYER: white'), nl, nl.

victory('2') :-
  write('           <<< White victory >>>\n\n'), !.

victory('1') :-
  write('           <<< Black victory >>>\n\n').

display_game(Board, Player) :-
  show_player(Player),
  initBoard(Board).
