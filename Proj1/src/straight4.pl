/*
['/Users/mariajoaosenraviana/Desktop/FEUP-PLOG/src/straight4.pl'].
*/

:- include('menu.pl').
:- include('display.pl').
:- include('logic.pl').
:- include('tools.pl').
:- include('game_over.pl').
:- use_module(library(random)).
:- use_module(library(system)).

% Starts the program
play :-
    display_menu.
