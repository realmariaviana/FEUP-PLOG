
% Starts a game depending on the mode.
start_game('P', 'P') :-
    write('\n       <<< Started Human vs Human >>>\n'), nl,
    table(Board),
    Player is 1,
   % display_game(Board, Player).
     moveComplete(Board, Player, Bd).

start_game('P', 'C') :-
    write('\n       <<< Started Human vs CPU >>>\n'), nl,
    table(Board),
    Player is 1,
    % display_game(Board, Player).
    move_PvC_random(Board,Bd).


start_game('C', 'C') :-
    write('\n       <<< Started CPU vs CPU >>>\n'), nl,
    table(Board),
    Player is 1,
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

/*gameLoop1(Board, Player, 0):-
  gameLoop2.

gameLoop1(Board, Player, Counter):-
  move(Board)
  Ncounter is Counter - 1,
  gameLoop1(NBoard, Player, Ncounter, NewBoard).
*/

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

moveComplete(Board, Player, NBoard):-
  nl,
  show_player(Player),
  nl,
  print_board(Board),
  nl,
  move(Board, Player, NewBoard),
  nextPlayer(Player, NextPlayer),
  moveComplete(NewBoard, NextPlayer, NBoard).

nextPlayer(1, NextPlayer):-
  NextPlayer is 2.

nextPlayer(2, NextPlayer):-
  NextPlayer is 1.

move_PvC_random(Board, NBoard):-
  print_board(Board),
  nl,
  move(Board, 1, NewBoard),
  %TODO- Implement cpu plays
  moveCPU_random(NewBoard,AuxBoard),
  move_PvC(AuxBoard, NBoard).

moveCPU_random(Board,NewBoard):-
  random(1,6,Aux1),
  random(1,6,Aux2),
  checkPlay(Aux1,Aux2, Board,Bool),
  (Bool =:= 0 -> replaceInMatrix(Board, Aux1, Aux2, 2, NewBoard);moveCPU_random(Board,NewBoard)).
  