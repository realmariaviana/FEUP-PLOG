/*
['/Users/mariajoaosenraviana/Desktop/FEUP-PLOG/src/straight4.pl'].
*/

:- include('menu.pl').
:- include('display.pl').
:- include('tools.pl').
:- include('game.pl').
:- include('PvP.pl').
:- include('validation.pl').

% Starts the program
play :-
    display_menu,
    get_clean_char(Option),
    menu_option(Option).
