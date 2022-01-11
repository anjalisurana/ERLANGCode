%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jan 2022 04:52 PM
%%%-------------------------------------------------------------------
-module(temper).
-author("Anjali").

%% API
-export([convert/2, convert/1]).

% ATOMS: these are just names.
% following functions shows atoms farenheit and celsius. Always start in small letter
% Calling these functions expects us to pass exactly the two words when we call them.
% variables are always in caps - start with caps.

convert(F, farenheit) ->
  (F - 32) * 5 / 9;
convert(C, celsius) ->
  32+(C * 9)/5.

% Tuples: can contain atoms, variables, int, str, etc
convert({f, X}) ->
  Y = (X - 32) * 5 / 9,
  {c, Y};
convert({c, X}) ->
  Y = 32+(X * 9)/5,
  {f, Y}.

