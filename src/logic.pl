
% Starts a game depending on the mode.
start_game('P', 'P') :-
    write('\n       <<< Started Human vs Human >>>\n'), nl,
    table(Board),
    Player is 1,
    gameLoop(Board,Player,NBoard,8).

start_game('P', 'C') :-
    write('\n       <<< Started Human vs CPU >>>\n'), nl,
    table(Board),
    Player is 1,
    % display_game(Board, Player).
    move_PvC_random(Board,4).


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

replaceMove(Board,Player,BoardF):-
  write('You have all your available pieces on the board.'),
  nl,
  nl,
  write('Piece you want to move: '),
  nl,
  readInput(Row, Column),
  getValueFromMatrix(Board, Row, Column, Value),
  Value=:=Player,
  replaceInMatrix(Board, Row, Column, 0, BoardF),
  nl,
  write('Where you want to move the piece to: '),
  nl.

gameLoop(Board, Player, NBoard, Counter):-
  nl,
  display_game(Board, Player),
  nl,
  Counter > 0,
  
  move(Board, Player, NewBoard),
  game_over(NewBoard,Winner),
  (Winner =:= 0 ->
    nextPlayer(Player, NextPlayer),
    Ncounter is Counter - 1,
    gameLoop(NewBoard, NextPlayer, NBoard, Ncounter)
    ;
    show_winner(Winner)
  ).
  
gameLoop(Board, Player, NBoard, 0):-
  game_over(Board,Winner),
  (Winner =:= 0 ->
  replaceMove(Board,Player,BoardF),
  move(BoardF, Player, NewBoard),
  nextPlayer(Player, NextPlayer),
  gameLoop(NewBoard, NextPlayer, NBoard, 0)
  ;
  show_winner(Winner)
  ).

nextPlayer(1, NextPlayer):-
  NextPlayer is 2.

nextPlayer(2, NextPlayer):-
  NextPlayer is 1.

move_PvC_random(Board,Counter):-
  print_board(Board),
  Counter >0,
  
  game_over(Board,Winner),
    Ncounter is Counter - 1,

  (Winner =:= 0 ->
    move(Board, 1, AuxBoard),

    choose_move(AuxBoard,1,Move),
    apply_move(AuxBoard,Move,2,NewBoard),
    move_PvC_random(NewBoard,Ncounter)
    ;
    show_winner(Winner)
  ).

move_PvC_random(Board,0):-
  game_over(Board,Winner),

  (Winner =:= 0 ->
    replaceMove(Board, 1, BoardF),
    move(BoardF, 1, AuxBoard),

    choose_move(AuxBoard, 1, Move),
    apply_move(AuxBoard,Move,2,NewBoard),
    move_PvC_random(NewBoard,0)
    ;
    show_winner(Winner)
  ).

moveCPU_random(Board,Move):-
  random(1,6,Aux1),
  random(1,6,Aux2),

  checkPlay(Aux1,Aux2, Board,Bool),
  (Bool =:= 0 -> 
    append([Aux1], [Aux2], Move)
    ;
    moveCPU_random(Board,Move)
  ).

choose_move(Board, Level, Move):-
  moveCPU_random(Board,Move).

apply_move(Board,[H|T],Player,NewBoard):-
  replaceInMatrix(Board, H, T, 2, NewBoard).
  