
check_row_win(Board,Player, Row , Column, Counter, NewCounter ,Res):-
    (Counter =:= 4 -> Res is 1; 
        (Column =:= 6 -> check_row_win(Board,Player,Row + 1, 1, 0, _, Res);
            Row > 0,
            Row < 6,
            Column > 0,
            Column < 6,
        
            %loop check
            getValueFromMatrix(Board, Row, Column,Value),
            /*
            write('Value:'),write(Value),write('\n'),
            write('Player:'),write(Player),write('\n'),
*/
            (Value =:= Player -> NewCounter is Counter + 1 ; NewCounter is 0),

            %write('Counter: '), write(NewCounter), write('\n\n'),
            %check next 

            check_row_win(Board,Player,Row, Column + 1, NewCounter,_ ,Res)
        )
    ).

check_column_win(Board,Player, Row , Column, Counter, NewCounter ,Res):-
    (Counter =:= 4 -> Res is 1; 
        (Row =:= 6 -> check_column_win(Board,Player,1, Column + 1, 0, _, Res);
            Row > 0,
            Row < 6,
            Column > 0,
            Column < 6,
        
            %loop check
            getValueFromMatrix(Board, Row, Column,Value),
            /*
            write('Value:'),write(Value),write('\n'),
            write('Player:'),write(Player),write('\n'),
            */
            (Value =:= Player -> NewCounter is Counter + 1 ; NewCounter is 0),

            %write('Counter: '), write(NewCounter), write('\n\n'),
            %check next 

            check_column_win(Board,Player,Row + 1, Column , NewCounter,_ ,Res)
        )
    ).

check_row_win(Board,Player, Row , Column, Counter, NewCounter ,Res):-
    Res is 0.
check_column_win(Board,Player, Row , Column, Counter, NewCounter ,Res):-
    Res is 0.

check_game_over(Board, Player, Res):-
    display_game(Board,Player),
    check_row_win(Board,Player,1,1,0,_,Res1),
    check_column_win(Board, Player, 1,1,0,_,Res2),
    game_over(Res1,Res2).
