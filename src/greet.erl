%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jan 2022 06:28 PM
%%%-------------------------------------------------------------------
-module(greet).
-author("Anjali").

%% API
-export([greet/1]).

% Implementing for loop using recursion becos erlang does not have any loops.
% call same fn from within itself with next set of params.
% and add a function clause for end condition
% Following is the call to the function from terminal window...
%% greet:greet(["A", "B", "C", "D"]).
% and following is the output...
%% Hello A
%% Hello B
%% Hello C
%% Hello D
%% true

greet([]) ->
  true;
greet([F | R]) ->
  io:fwrite("Hello " ++ F ++ "\n"),
  greet(R).
