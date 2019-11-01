% Displays the main menu
display_menu :-
    display_banner,
    write('1 - Human vs Human\n'),
    write('2 - Human vs CPU\n'),
    write('3 - CPU vs CPU\n'),
    write('4 - Exit\n').

% Executes the appropriate actions depending on the option chosen
menu_option('1'):-
  start_game(1, 1), !, play.

menu_option('4').

menu_option(Option):-
    Option \= '1',
    Option \= '2',
    Option \= '3',
    play.
