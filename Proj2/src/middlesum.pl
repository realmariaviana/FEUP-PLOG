/*
['/Users/mariajoaosenraviana/Desktop/FEUP-PLOG/Proj2/src/middlesum.pl'].
*/

:- use_module(library(random)).
:- use_module(library(system)).
:- use_module(library(clpfd)).
:- use_module(library(lists)).
:- include('display.pl').
:- include('logic.pl').
:- include('tools.pl').

% Starts the program
solve(N) :-
    display_banner,
    start_solving(N).

generate(N):-
    display_banner,
    start_generating(N).