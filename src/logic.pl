
% Starts a game depending on the mode.
start_game('P', 'P') :-
    write('\n       <<< Started Human vs Human >>>\n'), nl,
    table(Board),
    Player is 1,
    gameLoopPvP(Board,Player,NBoard,8).

start_game('P', 'C') :-
    write('\n       <<< Started Human vs CPU >>>\n'), nl,
    table(Board),
    Player is 1,
    % display_game(Board, Player).
    gameLoopPvC(Board,4).


start_game('C', 'C') :-
    write('\n       <<< Started CPU vs CPU >>>\n'), nl,
    table(Board),
    gameLoopCvC(Board,1,8).

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


nextPlayer(1, NextPlayer):-
  NextPlayer is 2.

nextPlayer(2, NextPlayer):-
  NextPlayer is 1.

%Game Loops
gameLoopPvP(Board, Player, NBoard, Counter):-
  nl,
  display_game(Board, Player),
  nl,
  Counter > 0,
  
  move(Board, Player, NewBoard),
  game_over(NewBoard,Winner),
  (Winner =:= 0 ->
    nextPlayer(Player, NextPlayer),
    Ncounter is Counter - 1,
    gameLoopPvP(NewBoard, NextPlayer, NBoard, Ncounter)
    ;
    show_winner(Winner)
  ).
  
gameLoopPvP(Board, Player, NBoard, 0):-
  game_over(Board,Winner),
  (Winner =:= 0 ->
  replaceMove(Board,Player,BoardF),
  move(BoardF, Player, NewBoard),
  nextPlayer(Player, NextPlayer),
  gameLoopPvP(NewBoard, NextPlayer, NBoard, 0)
  ;
  show_winner(Winner)
  ).
gameLoopPvC(Board,Counter):-
  print_board(Board),
  Counter >0,
  
  game_over(Board,Winner),
  Ncounter is Counter - 1,
  (Winner =:= 0 ->
    move(Board, 1, AuxBoard),

    choose_move(AuxBoard,1,Move),
    apply_move(AuxBoard,Move,2,NewBoard),
    gameLoopPvC(NewBoard,Ncounter)
    ;
    show_winner(Winner)
  ).

gameLoopPvC(Board,Counter):-
  game_over(Board,Winner),

  (Winner =:= 0 ->
    replaceMove(Board, 1, BoardF),
    move(BoardF, 1, AuxBoard),

    choose_replace_move(AuxBoard,1,2,AuxBotBoard),
    choose_move(AuxBotBoard, 1, Move),
    apply_move(AuxBotBoard,Move,2,NewBoard),

    gameLoopPvC(NewBoard,0)
    ;
    show_winner(Winner)
  ).
gameLoopCvC(Board,CPUPlayer,Counter):-
  print_board(Board),
  nl,
  sleep(1),
  Counter > 0,
  
  game_over(Board,Winner),
  Ncounter is Counter - 1,
  (Winner =:= 0 ->
    choose_move(Board,1,Move),
    apply_move(Board,Move,CPUPlayer,NewBoard),
    nextPlayer(CPUPlayer, NewCPU),
    gameLoopCvC(NewBoard,NewCPU,Ncounter)
    ;
    show_winner(Winner)
  ).
gameLoopCvC(Board,CPUPlayer,Counter):-
  game_over(Board,Winner),
  (Winner =:= 0 ->
    choose_replace_move(Board,1,CPUPlayer,AuxBotBoard),
    choose_move(AuxBotBoard,1,Move),
    apply_move(AuxBotBoard,Move,CPUPlayer,NewBoard),
    nextPlayer(CPUPlayer, NewCPU),
    gameLoopCvC(NewBoard,NewCPU,0)
    ;
    show_winner(Winner)
    ).
  
%CPU functions
moveCPU_random(Board,Move):-
  random(1,6,Aux1),
  random(1,6,Aux2),

  checkPlay(Aux1,Aux2, Board,Bool),
  (Bool =:= 0 -> 
    append([Aux1], [Aux2], Move)
    ;
    moveCPU_random(Board,Move)
  ).

replaceCPU_random(Board,Player,AuxBotBoard):-
  random(1,6,Aux1),
  random(1,6,Aux2),

  getValueFromMatrix(Board, Aux1, Aux2, Value),

  (Value =:= Player -> 
    replaceInMatrix(Board, Aux1, Aux2, 0, AuxBotBoard)    
    ;
    replaceCPU_random(Board,Player,AuxBotBoard)
  ).

choose_move(Board, Level, Move):-
  (Level =:= 1 ->
    moveCPU_random(Board,Move)
  ).

apply_move(Board,[H|T],Player,NewBoard):-
  replaceInMatrix(Board, H, T, Player, NewBoard).
  
choose_replace_move(Board,Level,Player,AuxBotBoard):-
  (Level =:= 1 ->
    replaceCPU_random(Board,Player,AuxBotBoard)
    ).
