:- use_module(library(lists)).

%
table([
[0,0,0,0,0],
[0,0,0,0,0],
[0,1,2,2,0],
[0,0,0,0,1],
[2,0,0,0,0]]).

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

print_cell(0):- put_code(32), !.
print_cell(1):- put_code(9679), !.
print_cell(2):- put_code(9675).

printColumn([]):- !.
printColumn([H|T]) :-
    print_cell(H),
    write(' | '),
    printColumn(T).

printBoard([], 6):- !.
printBoard([H|T], N) :-
  print_format_number(N),
  write('| '),
  printColumn(H),
  print_format_number(N),
  nl,
  Next is (N+1),
  printBoard(T, Next).

print_format_number(N) :-
  !,
  write('0'),
  write(N),
  write(' ').

init :-
  table(Board),
  print_table_header,
  printBoard(Board, 1),
  print_table_header.
