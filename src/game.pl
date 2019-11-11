
% Starts a game depending on the mode.
start_game(Player1, Player2) :-
    write('\n       <<< Started Human vs Human >>>\n'), nl,
    display_game(Board, Player).

isEmptyCell(Board, Row, Column, Res) :-
  getValueFromMatrix(Board, Row, Column, Value),
  Value =:= 0,
  Res is 1.
isEmptyCell(Board, Row, Column, Res) :-
  Res is 0.

checkPlay(Row, Column, Board, Res):-
  Row > 0,
  Row < 6,
  Column > 0,
  Column < 6,
  isEmptyCell(Board, Row, Column, NRes),
  NRes \= 0, Res is 0.
  checkPlay(Row, Column, Board, Res):- Res is 1.

% gameLoop1(Board, Player1, Player2, 0, Board).

% gameLoop1(Board, Player1, Player2, Counter, Board):-
%   replaceInMatrix(Board, Row, Column, Value, TNew),

%   replaceInMatrix(TNew, Row, Column, Value, NBoard),
%   Ncounter is Counter - 1,
%  gameLoop1(NBoard, Player1,Player2, Ncounter, NewBoard).
