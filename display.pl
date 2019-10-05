:- use_module(library(lists)).

table([
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty],
[empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty,empty]]).

% Displays the game banner
display_banner :-
    write(' _______  _______  ______    _______  ___   _______  __   __  _______    _   ___ '), nl,
    write('|       ||       ||    _ |  |   _   ||   | |       ||  | |  ||       |  | | |   |'), nl,
    write('|  _____||_     _||   | ||  |  |_|  ||   | |    ___||  |_|  ||_     _|  | |_|   |'), nl,
    write('| |_____   |   |  |   |_||_ |       ||   | |   | __ |       |  |   |    |       |'), nl,
    write('|_____  |  |   |  |    __  ||       ||   | |   ||  ||       |  |   |    |___    |'), nl,
    write(' _____| |  |   |  |   |  | ||   _   ||   | |   |_| ||   _   |  |   |        |   |'), nl,
    write('|_______|  |___|  |___|  |_||__| |__||___| |_______||__| |__|  |___|        |___|'), nl, nl, nl, nl.


% Prints the tables header and footer: a line containing the name of each column
print_table_header :-
        write('   '),
        write('A'), write('|'), write('B'), write('|'),
        write('C'), write('|'), write('D'), write('|'),
        write('E'), write('|'), write('F'), write('|'),
        write('G'), write('|'), write('H'), write('|'),
        write('I'), write('|'), write('J'), write('|'),
        write('K'), write('|'), write('L'), write('|'),
        write('M'), write('|'), write('N'), write('|'),
        write('O'), write('|'), write('P'), write('|'),
        write('Q'), write('|'), write('R'), write('|'),
        write('S'), write('|'), nl.

% Prints a number in the 0D format if D < 10.
print_format_number(N) :-
  N < 10, !,
  write('0'),
  write(N).

print_format_number(N) :-
  write(N).

% Prints the board as well as its headers.
print_board(Board) :-
  print_table_header,
  view_tab(Board, 1),
  print_table_header.

% Prints a list of lists (board) as well as the line numbers on each side.
view_tab([], 20) :-
      !.

view_tab([H|T], N) :-
  print_format_number(N),
  write('|'),
  print_list(H),
  print_format_number(N),
  nl,
  Next is (N + 1),
  view_tab(T, Next).

% Prints a list, replacing certain characters with custom unicode ones.
print_list([]) :-
    !.

print_list([H|T]) :-
  print_piece(H),
  write('|'),
  print_list(T).

% Prints custom characters depending on the one received.
print_piece(empty) :-
  write('.'), !.

print_piece('b') :-
  put_code(9679), !.

print_piece('w') :-
  put_code(9675).

% Prints the games board.
display_game(Board) :-
  print_board(Board).
