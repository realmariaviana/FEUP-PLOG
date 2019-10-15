/*
['/Users/mariajoaosenraviana/Desktop/FEUP-PLOG/src/straight4.pl'].
*/

:- include('menu.pl').
:- include('display.pl').
:- include('tools.pl').
:- include('game.pl').
:- include('PvP.pl').

% Starts the program
play :-
    displayMenu,
    get_clean_char(Option),
    menu_option(Option).
