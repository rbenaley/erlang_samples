%% 1> c(message).
%% 2> Pid = spawn(message,child,[]).
%% 3> Pid ! hello.

-module(message).
-export([child/0]).

child() ->
    receive
        hello ->
            io:format("Hello man !~n", []),
            child();
        fuck ->
            io:format("You're a genuine asshole man !~n", []),
            child();
        who_are_u ->
            io:format("My unique process identifier is ~w~n", [self()]),
            child();
        stop ->
            true
    end.
