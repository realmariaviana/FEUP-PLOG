% Creates a game from scratch.
create_game(Game, Difficulty) :-
    table(Table),
    Game = [Table, Difficulty].

% Starts a game depending on the mode.
start_game(1, 1) :-
    write('\n       <<< Started Human vs Human >>>\n'),
    create_game(Game, 1),
    start_PvP(Game), !.
