
% Starts a game depending on the mode.
start_game(Player1, Player2) :-
    write('\n       <<< Started Human vs Human >>>\n'), nl,
    display_game(Board, Player),
    gameLoop(Board, Player1, Player2).


checkMove(Board, Player, NewBoard, Expected, ColumnIndex, RowIndex):-
((Player == 2 ; Player == 1),
            ((getValueFromMatrix(Board, RowIndex, ColumnIndex, Expected),
                   (
                        replaceInMatrix(Board, RowIndex, ColumnIndex, Player, NewBoard));
                        (write('INVALID MOVE: That cell is not within the workers lines of sight, please try again!\n\n'),
                        askCoords(Board, Player, NewBoard, Expected))));
            (write('INVALID MOVE: That cell is not empty, please try again!\n\n'),
            askCoords(Board, Player, NewBoard, Expected)))).



askCoords(Board, Player, NewBoard, Expected) :-
  manageRow(NewRow),
  manageColumn(NewColumn),
  ColumnIndex is NewColumn - 1,
  RowIndex is NewRow - 1,
  checkMove(Board, Player, NewBoard, Expected, ColumnIndex, RowIndex).

  isEmptyCell(Board, Row, Column, Res) :-
    ((getValueFromMatrix(Board, Row, Column, Value), Value == 0, !,
    Res is 1);
    Res is 0).

blackPlayerTurn(Board, NewBoard, 'P') :-
  askCoords(Board1, 1, NewBoard, 0),
  display_game(NewBoard).

gameLoop(Board, Player1, Player2) :-
  blackPlayerTurn(Board, NewBoard, Player1).
