%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Jan 2022 04:34 PM
%%%-------------------------------------------------------------------
-module(age2).
-author("Anjali").

%% API
-export([getType/1]).

% This is about GUARDS
% Guards allow a certain functionality to execute only if the guard is true (i.e. the condition is true).
% here are function clauses called with guards...

getType(N) when N < 13 ->
  child;
getType(N) when N < 18 ->
  teen;
getType(N) when N > 17 ->
  adult.
