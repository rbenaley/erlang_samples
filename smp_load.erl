%% 1> c(smp_load).
%% 2> smp_load:start().

-module(smp_load).
-export([start/0]).

fx(X, 1) ->
    X;
fx(X, Y) ->
    _ = X bxor Y,
    fx(X*Y, Y-1).

start() ->
    spawn(fun() -> fx(16#FF, 16#FFFF) end),
    start().
