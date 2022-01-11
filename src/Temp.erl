%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jan 2022 04:44 PM
%%%-------------------------------------------------------------------
-module('Temp').
-author("Anjali").

%% API
-export([convert/2]).

convert(F, farenheit) ->
  (F - 32) * 5 / 9;
convert(C, celsius) ->
  (C * 9/5+32).


