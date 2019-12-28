/**
 * Verificação se uma linha tem 
 * quatro peças consecutivas
 */
check_row_win(Board,Player, Row , Column, Counter, NewCounter ,Res):-
    (Counter =:= 4 -> Res is 1; 
        (Column =:= 6 -> check_row_win(Board,Player,Row + 1, 1, 0, _, Res);
            Row > 0,
            Row < 6,
            Column > 0,
            Column < 6,
        
            getValueFromMatrix(Board, Row, Column,Value),
            (Value =:= Player -> NewCounter is Counter + 1 ; NewCounter is 0),

            check_row_win(Board,Player,Row, Column + 1, NewCounter,_ ,Res)
        )
    ).

check_row_win(_,_,_ , _, _, _ ,Res):-
    Res is 0.

/**
 * Verificação se uma coluna tem
 * quatro peças consecutivas
 */
check_column_win(Board,Player, Row , Column, Counter, NewCounter ,Res):-
    (Counter =:= 4 -> Res is 1; 
        (Row =:= 6 -> check_column_win(Board,Player,1, Column + 1, 0, _, Res);
            Row > 0,
            Row < 6,
            Column > 0,
            Column < 6,
        
            getValueFromMatrix(Board, Row, Column,Value),
            
            (Value =:= Player -> NewCounter is Counter + 1 ; NewCounter is 0),

            check_column_win(Board,Player,Row + 1, Column , NewCounter,_ ,Res)
        )
    ).

check_column_win(_,_, _ , _, _, _ ,Res):-
    Res is 0.

/** 
 * Verificação se uma diagonal sentido NO -> SE tem
 * quatro peças consecutivas
 */
check_one_right_diagonal(Board,Player,Row,Column,Counter,ItCounter,Res):-
    (ItCounter =:= 4 -> 
        (Counter =:= 4 -> Res is 1; Res is 0);
        Row > 0,
        Row < 6,
        Column > 0,
        Column < 6,

        getValueFromMatrix(Board, Row, Column,Value),
        (Value =:= Player -> NewCounter is Counter + 1 ; NewCounter is 0),

        NewRow is Row + 1,
        NewColumn is Column +1,
        NewItCounter is ItCounter + 1,
        check_one_right_diagonal(Board,Player, NewRow, NewColumn , NewCounter,NewItCounter ,Res)
    ).

/**
 * Verificação se uma diagonal sentido NE -> SO tem
 * quatro peças consecutivas
 */
check_one_left_diagonal(Board,Player,Row,Column,Counter,ItCounter,Res):-
    (ItCounter =:= 4 -> 
        (Counter =:= 4 -> Res is 1; Res is 0);
        Row > 0,
        Row < 6,
        Column > 0,
        Column < 6,

        getValueFromMatrix(Board, Row, Column,Value),
        (Value =:= Player -> NewCounter is Counter + 1 ; NewCounter is 0),

        NewRow is Row - 1,
        NewColumn is Column +1,
        NewItCounter is ItCounter + 1,
        check_one_left_diagonal(Board,Player, NewRow, NewColumn , NewCounter,NewItCounter ,Res)
    ).

/**
 * Verificação se alguma diagonal sentido NO -> SE tem
 * quatro peças consecutivas
 */
check_diagonal_right_win(Board,Player,Res):-
    check_one_right_diagonal(Board,Player,2,1,0,0,Res1),
    check_one_right_diagonal(Board,Player,1,1,0,0,Res2),
    check_one_right_diagonal(Board,Player,2,2,0,0,Res3),
    check_one_right_diagonal(Board,Player,1,2,0,0,Res4),
    (Res1 =:= 1; Res2 =:= 1; Res3 =:= 1; Res4 =:= 1),   Res is 1.

check_diagonal_right_win(_,_,Res):-
    Res is 0.

/**
 * Verificação se alguma diagonal sentido NE -> SO tem
 * quatro peças consecutivas
 */
check_diagonal_left_win(Board,Player,Res):-
    check_one_left_diagonal(Board,Player,4,1,0,0,Res1),
    check_one_left_diagonal(Board,Player,5,1,0,0,Res2),
    check_one_left_diagonal(Board,Player,4,2,0,0,Res3),
    check_one_left_diagonal(Board,Player,5,2,0,0,Res4),
    (Res1 =:= 1; Res2 =:= 1; Res3 =:= 1; Res4 =:= 1),   Res is 1.

check_diagonal_left_win(_,_,Res):-
    Res is 0.

/**
 * Verificação se um dado jogador venceu o jogo,
 * colocando quatro peças em linha
 */
check_player_game_over(Board,Player,Res):-
    check_row_win(Board,Player,1,1,0,_,Res1),
    check_column_win(Board, Player, 1,1,0,_,Res2),
    check_diagonal_right_win(Board,Player,Res3),
    check_diagonal_left_win(Board,Player,Res4),
    (Res1 =:= 1 -> Res is 1;
        (Res2 =:= 1 -> Res is 1;
            (Res3 =:= 1 -> Res is 1;
                (Res4 =:= 1 -> Res is 1;   
                    Res is 0
                )
            )
        )
    ).           

/**
 * Verificação do fim do jogo , com identificação do vencedor
 */
game_over(Board,Winner):-
    check_player_game_over(Board,1,Res1),
    check_player_game_over(Board,2,Res2),

    (Res1 =:= 1 -> Winner is 1;
        (Res2 =:= 1 -> Winner is 2;
            Winner is 0
        )
    ).


    
