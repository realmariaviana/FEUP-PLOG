% Displays the main menu
display_menu :-
    write('\e[2J'),
    display_banner,
    write('1. Player vs Player\n'),
    write('2. Player vs CPU\n'),
    write('3. CPU vs CPU\n'),
    write('0. Exit\n'),
    nl, 
    write('Enter an option: '),
    get_clean_char(Option),
    menu_option(Option).

% Executes the appropriate actions depending on the option chosen
menu_option('1'):- start_game('P','P').

menu_option('2') :- start_game('P','C').

menu_option('3') :- write('bot Vs bot').

menu_option('0'):- write('\nExiting...\n\n').

readInput(Row, Column) :-
  get_play_row(Row),
  get_play_column(Column).

get_play_row(Row) :-
    write('Row (1 to 5): '),
    get_clean_int(Row), 
    Row > 0, Row < 6, !.

get_play_row(Row) :-
    write('Invalid Row. Please try again. '), !, 
    get_play_row(Row).

get_play_column(Column):-
    write('Column (A to E): '),
    get_clean_char(ColumnChar),
    capitalize_char(ColumnChar, ColumnLetter),
    column_dictionary(ColumnLetter, Column).

get_play_column(Column) :-
    write('Invalid Column. Please try again. \n'), 
    get_play_column(Column).  
