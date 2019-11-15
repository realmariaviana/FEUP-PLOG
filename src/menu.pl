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

manageInput(4) :-
  write('\nExiting...\n\n').

readInput(Row, Column) :-
  get_play_row(Row),
  get_play_column(Column).

get_play_row(Row) :-
    write('Row (1 to 5): '),
    get_clean_int(Row), 
    Row > 0, Row < 5, !.

get_play_row(Row) :-
    write('Invalid Row. Please try again. '), !, 
    get_play_row(Row).

get_play_column(Column):-
    write('Column (A to E): '),
    get_clean_char(ColumnChar),
    capitalize_char(ColumnChar, ColumnLetter),
    column_dictionary(ColumnLetter, Column).

get_play_column(Column) :-
    write('Invalid Column. Please try again. '), 
    get_play_column(Column).  
