/*
['/Users/mariajoaosenraviana/Desktop/FEUP-PLOG/Proj2/src/middlesum.pl'].
['/Users/mariajoaosenraviana/Downloads/FEUP-PLOG-master/projeto2/BosnianSnake.pl']

*/

:- include('display.pl').
:- include('logic.pl').
:- include('tools.pl').
:- use_module(library(random)).
:- use_module(library(system)).
:- use_module(library(clpfd)).
:- use_module(library(lists)).

% Starts the program
play :-
    display_banner,
    start_game.