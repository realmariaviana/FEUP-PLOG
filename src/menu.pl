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

readInput(Row, Column) :-
  write('Choose row (1 to 5): '),
  readImput(Row),
  write('Choose column (1 to 5): '),
  readImput(Column).

readImput(Imput):-
  get_code(Code),
  convertCode(Code, Imput),
  get_char(_).

convertCode(Code, Inte):-
  Aux is Code - 48,
  Inte is Aux.
