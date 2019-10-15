get_play_input(Player, Play) :-
    write('1 - Choose Column'), nl,
    write('2 - Choose Line'), nl,
    get_clean_char(Option),
    (
        (Option = '1', get_play_column(Column, Direction), Play = ['C', Column, Direction, Player]);
        (Option = '2', get_play_line(Line, Direction), Play = ['L', Line, Direction, Player]);
        write('<<< Invalid Input >>>\n\n'), !, get_play_input(Player, Play)
    ).

get_play_line(Line, Direction) :-
  write('Line (1 to 5): '),
  get_clean_int(Line),
  Line > 0, Line < 6, !,
  get_play_line_direction(Direction).

get_play_line(Line, Direction) :-
  write('\n<<< Invalid Line >>>\n\n'), !, get_play_line(Line, Direction).

get_play_line_direction(Direction) :-
  write('L (Left) or R (right): '),
  get_clean_char(DirectionChar),
  capitalize_char(DirectionChar, Direction).

get_play_line_direction(Direction) :-
  write('<<< Invalid Direction >>>\n\n'), getPlayLineDirection(Direction).

get_play_column(Column, Direction):-
  write('Column (A to E): '),
  get_clean_char(ColumnChar),
  capitalize_char(ColumnChar, ColumnLetter),
  column_dictionary(ColumnLetter, Column),
  get_play_column_direction(Direction).

get_play_column(Column, Direction) :-
  write('<<< Invalid Column >>>\n\n'), get_play_column(Column, Direction).

get_play_column_direction(Direction) :-
  write('Direction (U (Up) or D (Down)): '),
  get_clean_char(DirectionChar),
  capitalize_char(DirectionChar, Direction).

get_play_column_direction(Direction) :-
  write('<<< Invalid Direction >>>\n\n'), get_play_column_direction(Direction).
