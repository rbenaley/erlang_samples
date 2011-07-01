%% 1> c(helloworld).
%% 2> helloworld:start().

-module(helloworld).
-export([start/0]).

start() ->
    io:format("Hello world !~n").
