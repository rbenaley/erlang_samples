%% 1> c(tailrecursion).
%% 2> tailrecursion:start().

-module(tailrecursion).
-export([start/0, is_even/1, is_odd/1]).

is_even([])         -> true;
is_even([_ | Tail]) -> is_odd(Tail).

is_odd([])          -> false;
is_odd([_ | Tail])  -> is_even(Tail).

start(0, _)   -> ok;
start(N, Acc) ->
  R = is_even(integer_to_list(Acc)),
  io:format("List(~w) : ~w~n", [Acc, R]),
  start(N-1, Acc+1).

start() ->
  start(1000000,1),
  halt().
