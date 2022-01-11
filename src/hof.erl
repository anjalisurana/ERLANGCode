%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Jan 2022 04:53 PM
%%%-------------------------------------------------------------------
-module(hof).
-author("Anjali").

%% API
-export([double/0]).

% HOF- Higher Order Functions
% Functions that can be assigned to variables
% In foll code the var F is assigned to the HOF 'fun' which simply doubles the value of the param.
% We call the HOF function 'fun; from another function called 'map'.
% 'map' is a function clause that calls the hof, and also concats the returned value into a list
% The returned list is a list of doubled values.

double() ->
  F = fun(X) -> 2*X end,
  map(F, [1,2,3,4,5,6]).

map(F, []) ->
  [];
map(F, [First | Rest]) ->
  [F(First) | map(F, Rest)].


