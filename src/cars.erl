%%%-------------------------------------------------------------------
%%% @author Anjali
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jan 2022 06:53 PM
%%%-------------------------------------------------------------------
-module(cars).
-author("Anjali").

%% API
-export([listPrices/1]).

listPrices(Currency) ->
  List_of_Cars = ["BMW", "LAMBORGHINI", "FERRARI"],
  io:fwrite("Prices in " ++ atom_to_list(Currency) ++ "\n"),
  printPrice(List_of_Cars, Currency).

printPrice([], Currency) ->
  true;
printPrice([F | R], Currency) ->
  Map_of_Prices = #{"BMW" =>150000, "LAMBORGHINI" => 200000, "FERRARI" => 300000},
  io:fwrite(F ++ ": " ++ integer_to_list(convert(getPrice(F, Map_of_Prices ), Currency)) ++ "\n"),
  printPrice(R, Currency).

getPrice(F, Prices) ->
  maps:get(F, Prices, -1 ).

convert(Price, C) ->
  case C of
    usd -> Price;
    gbp -> round(Price * 0.8);
    eur -> round(Price * 0.9)
  end.

