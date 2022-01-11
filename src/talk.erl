%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Jan 2022 05:34 PM
%%%-------------------------------------------------------------------
-module(talk).
-author("Anjali").

%% API
-export([run/0, alice/0, bob/2]).

% SENDING MESSAGES BETWEEN PROCESSES
% this code spawns 2 processes - alice and bob - that send each other msgs and listen to each others msgs
% inbuilt spawn function returns a unique process-id which in turn can be used to send messages to that process.
% inbuilt self function also gets process-id of the current process
% receive listens to incoming msgs and uses pattern matching to identify the msg type


alice() ->
  receive
  % in a receive the process is not going to continue unless it receives a message that matches
  %  one of the patterns inside...basically it will wait till it receives such a msg...
    {message, BobPid} ->  % pattern matching in receive
      io:fwrite("Alice got message\n"),
      BobPid ! message,   % send msg to bob
      alice();    % recursive call to alice in order to continue listening
    finished -> io:fwrite("Alice is finished\n")
  end
  .

bob(0, AlicePid) ->
  AlicePid ! finished,
  io:fwrite("Bob is finished\n");
bob(N, AlicePid) ->   % N specifies how many msgs bob wants to send, and 0 becomes our end condition
  AlicePid ! {message, self()},    % send msg to Alice
  receive
    message -> io:fwrite("Bob got a msg\n")
  end,
  bob(N-1, AlicePid).

run() ->
  AlicePid = spawn(talk, alice, []),   % spawns a process for the alice() method
  spawn(talk, bob, [3, AlicePid]).     % spawns a process for the bob() method and passes the PID of the alice process to it

