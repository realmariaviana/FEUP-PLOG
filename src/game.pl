create_game(Game, Difficulty) :-
    table(Board).
  % Game = [Board, Difficulty]

% Starts a game depending on the mode.
start_game(1, 1) :-
    write('\n       <<< Started Human vs Human >>>\n'), nl,
    create_game(Game, 1),
    start_PvP(Game), !.

update_game_table(Game, NewTable, StartedGame) :-
  replace_element(1, Game, NewTable, StartedGame).
