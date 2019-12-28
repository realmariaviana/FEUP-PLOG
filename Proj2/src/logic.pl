start_game :-
    table(Board),
    print_board(Board).  

isEmptyCell(Board, Row, Column, Res) :-
  getValueFromMatrix(Board, Row, Column, Value),
  Value =:= 0,
  Res is 1.

isEmptyCell(_, _, _, Res) :-
  Res is 0.

checkPlay(Row, Column, Board, Res):-
  Row > 0,
  Row < 6,
  Column > 0,
  Column < 6,
  isEmptyCell(Board, Row, Column, NRes),
  NRes \= 0, Res is 0.

checkPlay(_, _, _, Res):- Res is 1.

move(Board, Player, NewBoard):-
  readInput(Row, Column),
  checkPlay(Row, Column, Board, Bool),
  Bool =:= 0,
  replaceInMatrix(Board,Row,Column,Player,NewBoard).


nextPlayer(1, NextPlayer):-
  NextPlayer is 2.

nextPlayer(2, NextPlayer):-
  NextPlayer is 1.

%Game Loops
gameLoopPvP(Board, Player, Counter):-
  nl,
  display_game(Board, Player),
  nl,
  Counter > 0,
  
  move(Board, Player, NewBoard),
  game_over(NewBoard,Winner),
  (Winner =:= 0 ->
    nextPlayer(Player, NextPlayer),
    Ncounter is Counter - 1,
    gameLoopPvP(NewBoard, NextPlayer, Ncounter)
    ;
    show_winner(Winner)
  ).
  
gameLoopPvP(Board, Player, 0):-
  game_over(Board,Winner),
  (Winner =:= 0 ->
  replaceMove(Board,Player,BoardF),
  move(BoardF, Player, NewBoard),
  nextPlayer(Player, NextPlayer),
  gameLoopPvP(NewBoard, NextPlayer, 0)
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

gameLoopPvC(Board,_):-
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
gameLoopCvC(Board,CPUPlayer,_):-
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
