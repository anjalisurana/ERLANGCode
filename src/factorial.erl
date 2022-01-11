%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jan 2022 04:22 PM
%%%-------------------------------------------------------------------
-module(factorial).
-author("Anjali").

%% API
-export([factorial/1]).

%% Multi-clause functions are a group of functions with same number of params but the params are different in type.
%% Notice the ; after the first function and a . after the last

%% Recursive function calls itself from within itself. The 2nd function is a recursive fn.

factorial(1) ->
  1;
factorial(N) ->
  N * factorial(N-1).
