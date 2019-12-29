/*
['/Users/mariajoaosenraviana/Desktop/FEUP-PLOG/Proj2/src/middlesum.pl'].
*/

:- include('display.pl').
:- include('logic.pl').
:- include('tools.pl').
:- use_module(library(random)).
:- use_module(library(system)).

% Starts the program
play :-
    display_banner,
    start_game.