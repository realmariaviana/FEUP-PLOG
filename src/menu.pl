% Displays the main menu
display_menu :-
    display_banner,
    write('1 - Human vs Human\n'),
    write('2 - Human vs CPU\n'),
    write('3 - CPU vs CPU\n'),
    write('4 - Exit\n'),
    read(Input),
    manageInput(Input).

% Executes the appropriate actions depending on the option chosen
manageInput(1) :-
  start_game('P','P'),
  display_menu.

manageInput(2) :-
  start_game('P','C'),
  display_menu.

manageInput(3) :-
  start_game('C','C'),
  display_menu.

manageInput(0) :-
  write('\nExiting...\n\n').

manageInput(Other) :-
  write('\nERROR: that option does not exist.\n\n'),
  display_menu.

manageRow(NewRow) :-
  readRow(Row),
  validateRow(Row, NewRow).

manageColumn(NewColumn) :-
  readColumn(Column),
  validateColumn(Column, NewColumn).

readRow(Row) :-
  write('Choose row (1 to 5) '),
  read(Row).

readColumn(Column) :-
  write('Choose column (A to E) '),
  read(Column).

validateRow(1, NewRow) :-
  NewRow = 1.

validateRow(2, NewRow) :-
  NewRow = 2.

validateRow(3, NewRow) :-
  NewRow = 3.

validateRow(4, NewRow) :-
  NewRow = 4.

validateRow(5, NewRow) :-
  NewRow = 5.

validateRow(Row, NewRow) :-
  write('ERROR: That row is not valid!\n\n'),
  readRow(Input),
  validateRow(Input, NewRow).

validateColumn('A', NewColumn) :-
  NewColumn = 1.

validateColumn('B', NewColumn) :-
  NewColumn = 2.

validateColumn('C', NewColumn) :-
  NewColumn = 3.

validateColumn('D', NewColumn) :-
  NewColumn = 4.

validateColumn('E', NewColumn) :-
  NewColumn = 5.

validateColumn(Column, NewColumn) :-
  write(Column),
  write('ERROR: That column is not valid!\n\n'),
  readColumn(Input),
  validateColumn(Input, NewColumn).
