
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

move(Board, Player, NewBoard):-
  readInput(Row, Column),
  checkPlay(Row, Column, Board, Bool),
  Bool =:= 0,
  replaceInMatrix(Board,Row,Column,Player,NewBoard).

move(Board, Player, NewBoard):-
  nl,
  write('That cell is occupied! Try again.'),
  nl,
  move(Board, Player, NewBoard).

gameLoop(Board, Player, NBoard, Counter):-
  nl,
  display_game(Board, Player),
  nl,
  Counter > 0,
  move(Board, Player, NewBoard),
  nextPlayer(Player, NextPlayer),
  Ncounter is Counter - 1,
  gameLoop(NewBoard, NextPlayer, NBoard, Ncounter).
  
gameLoop(Board, Player, NBoard, 0):-
  write('You have all your available pieces on the board.'),
  nl,
  write('Piece you want to move: '),
  nl,
  readInput(Row, Column),
  nl,
  write('Where you want to move the piece to: '),
  nl,
  readInput(Row, Column).

nextPlayer(1, NextPlayer):-
  NextPlayer is 2.

nextPlayer(2, NextPlayer):-
  NextPlayer is 1.
