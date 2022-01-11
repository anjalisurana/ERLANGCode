%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jan 2022 03:52 PM
%%%-------------------------------------------------------------------
-module(hw).
-author("Anjali").

%% API
-export([helloworld/0, helloworld/1]).
helloworld() ->
  "Hello World".

helloworld(X) ->
  "Hello " ++ X.