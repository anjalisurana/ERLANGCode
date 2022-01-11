%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jan 2022 05:42 PM
%%%-------------------------------------------------------------------
-module(age).
-author("Anjali").

%% API
-export([getage/1]).

% Maps are like a dictionary. It has key value pairs. Maps begin with a # followed by curly braces.
% maps.get is one of the functions for accessing maps. There are many more. See documenta
%



getage(Name) ->
  AgeMap2 = #{"Anjali" => 54, "Sanjay" => 56},
  maps:get(Name, AgeMap2, -1).

