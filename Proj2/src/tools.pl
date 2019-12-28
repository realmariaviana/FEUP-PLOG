replaceInList([_H|T], 1, Value, [Value|T]).

replaceInList([H|T], Index, Value, [H|TNew]) :-
  Index > 0,
  Index1 is Index - 1,
  replaceInList(T, Index1, Value, TNew).

replaceInMatrix([H|T], 1, Column,Value, [HNew|T]) :-
  replaceInList(H, Column, Value, HNew).

replaceInMatrix([H|T], Row, Column, Value, [H|TNew]) :-
  Row > 0,
  Row1 is Row - 1,
  replaceInMatrix(T, Row1, Column, Value, TNew).

getValueFromList([H|_T], 1, H).

getValueFromList([_H|T], Index, Value) :-
  Index > 0,
  Index1 is Index - 1,
  getValueFromList(T, Index1, Value).

getValueFromMatrix([H|_T], 1, Column, Value) :-
  getValueFromList(H, Column, Value).

getValueFromMatrix([_H|T], Row, Column, Value) :-
  Row > 0,
  Row1 is Row - 1,
  getValueFromMatrix(T, Row1, Column, Value).

% Reads an int from the input stream, verifying if its actually an int
get_clean_int(I) :-
    catch(read(I), _, true),
    get_char(_),
    integer(I).
        
get_clean_int(I) :-
    write('Invalid Row. Please try again. '), 
    write('Line (1 to 5): '), 
    get_clean_int(I).

% Reads a char from the input stream, discarding everything after it
get_clean_char(X) :-
    get_char(X),
    read_line(_),
    nl.

% Capitalizes a char (if it is an latin alphabet letter)
capitalize_char(Char, CapitalizedChar) :-
    char_code(Char, Code),
    Code >= 97, 
    Code =< 122, 
    CapitalizedCharCode is (Code - 32), 
    char_code(CapitalizedChar, CapitalizedCharCode).

capitalize_char(Char, Char).

% Translates the symbol of a column to its index
column_dictionary(Column, Number) :-
    char_code(Column, Code),
    Code >= 65,
    Code =< 69,
    Number is (Code - 64).
/*
get_valid_moves(Row,Column,Board):-
  result([])
  (Column > 0 -> )*/