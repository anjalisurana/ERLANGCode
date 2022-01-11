%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Jan 2022 05:18 PM
%%%-------------------------------------------------------------------
-module(speak).
-author("Anjali").

%% API
-export([runproc/0, say/2]).

% PROCESSES - independent threads of execution that do not share data with other processes.
% Erlang is designed for distributed programming and makes it very easy to spawn processes
% example shows how built-in function 'spawn' starts an independent parallel process.
% It calls the speak module in a separate process.
% Note that the say method is also exposed in export becos it is basically called from an external process.

say(What, 0) ->
  done;
say(What, Times) ->
  io:fwrite(What ++ "\n"),
  say(What, Times -1).

runproc() ->
  spawn(speak, say, ["Hi", 13]),   % spawns the speak process and calls the say method from it.
  spawn(speak, say, ["Bye", 13]).
