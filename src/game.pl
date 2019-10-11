% Starts a game depending on the mode.
start_game(1, 1) :-
    write('\n       <<< Started Human vs Human >>>\n'), nl,
    display_game(Board, Player),
    !.
