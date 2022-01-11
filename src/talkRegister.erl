%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 10. Jan 2022 05:34 PM
%%%-------------------------------------------------------------------
-module(talkRegister).
-author("Anjali").

%% API
-export([run/0, alice/0, bob/1]).

% SENDING MESSAGES BETWEEN PROCESSES using REGISTER - without using PROCESS ID
% this


alice() ->
  receive
  % in a receive the process is not going to continue unless it receives a message that matches
  %  one of the patterns inside...basically it will wait till it receives such a msg...
    message ->  % pattern matching in receive
      io:fwrite("Alice got message\n"),
      bob_p ! message,   % % send msg to process registered as bob_p
      alice();    % recursive call to alice in order to continue listening
    finished -> io:fwrite("Alice is finished\n")
  end
.

bob(0) ->
  alice_p ! finished, % send msg to process registered as alice_p
  io:fwrite("Bob is finished\n");
bob(N) ->   % N specifies how many msgs bob wants to send, and 0 becomes our end condition
  alice_p ! message,    % send msg to process registered as alice_p
  receive
    message -> io:fwrite("Bob got a msg\n")
  end,
  bob(N-1).

run() ->
  register( alice_p, spawn(talkRegister, alice, [])),  % starts and registers the alice() process with the atom 'alice_p'
  register( bob_p, spawn(talkRegister, bob, [3])).  % starts and registers the bob() process with the atom 'bob_p'
  % dont need to pass pid to each other because they both have their atom names as identifiers

