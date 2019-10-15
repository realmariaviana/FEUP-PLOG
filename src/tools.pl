
% Reads a char from the input stream, discarding everything after it
get_clean_char(X) :-
  get_char(X),
  read_line(_),
  nl.

get_clean_int(I) :-
  catch(read(I), _, true),
  get_char(_),
  integer(I),
  nl.

get_clean_int(I) :-
  write('<<< Invalid Line >>>\n\n'), write('Line (1 to 19): '), get_clean_int(I).

capitalize_char(Char, CapitalizedChar) :-
  char_code(Char, Code),
  Code >= 97,
  Code =< 122,
  CapitalizedCharCode is (Code - 32),
  char_code(CapitalizedChar, CapitalizedCharCode).

capitalize_char(Char, Char).

column_dictionary(Column, Number) :-
  char_code(Column, Code),
  Code >= 65,
  Code =< 69,
  Number is (Code - 64).
