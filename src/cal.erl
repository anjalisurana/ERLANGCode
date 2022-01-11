%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jan 2022 06:09 PM
%%%-------------------------------------------------------------------
-module(cal).
-author("Anjali").

%% API
-export([leap/1, days/2]).
% If loop is a If then else - so only if 1st condition is false will it go to next.
% Notice how If can return a value
% here we have returned an ATOM

% case evaluates one expression  and enter the respective code.
% check the when condition

% CALLS and OUTPUT - FROM TERMINAL...
%% cal:days(jan, 2022).
%% 31
%% cal:days(feb, 2022).
%% 28
%% cal:days(feb, 2000).
%% 29
%% cal:days(feb, 2004).
%% 29
%% cal:days(feb, 2024).
%% 29
%% cal:days(feb, 2500).
%% 28

leap(Year) ->
  if
    Year rem 400 == 0 -> leap;
    Year rem 100 == 0 -> nonleap;
    Year rem 4 == 0 -> leap;
    true -> nonleap
  end.

days(Month, Year) ->
  Leap = leap(Year),
  case Month of
    jan -> 31;
    feb when Leap == leap -> 29;
    feb -> 28;
    mar -> 31;
    apr -> 30;
    may -> 31;
    jum -> 30
  end.