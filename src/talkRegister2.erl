%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Jan 2022 05:34 PM
%%%-------------------------------------------------------------------
-module(talkRegister2).
-author("Anjali").

%% API
-export([alice/0, bob/2, startAlice/0, startBob/1]).

% SENDING MESSAGES BETWEEN PROCESSES on 2 separate machines
% create a security key in a file in the bin folder of erlang of both machines...
%%
% simulate 2 machines on one by opening 2 terminal windows.



alice() ->
  receive
    {message, BobNodePid} ->  % pattern matching in receive, receives msg and BobNode info
      io:fwrite("Alice got message\n"),
      BobNodePid ! message,   % send msg to process registered on BobNode
      alice();    % recursive call to alice in order to continue listening
    finished -> io:fwrite("Alice is finished\n")
  end
.

bob(0, AliceNode) ->
  AliceNode ! finished, % send msg to process registered on AliceNode
  io:fwrite("Bob is finished\n");
bob(N, AliceNode) ->   % N specifies how many msgs bob wants to send, and 0 becomes our end condition
  AliceNode ! {message, self()},    % send msg and self info (Ip and PID) to process registered on AliceNode
  receive
    message -> io:fwrite("Bob got a msg\n")
  end,
  bob(N-1, AliceNode).


startAlice() ->
  register( alice_r, spawn(talkRegister2, alice, [])).
  % registers the process alice() on first local machine

startBob(AliceNode) ->   % AliceNode is the info of the node on which alice() is running
  spawn(talkRegister2, bob, [3, AliceNode]).
  % spawns the process bob() on second machine with the AliceNode info as param

