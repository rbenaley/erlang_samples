%% $ erl +P 134217727
%%
%% 1> c(spawner).
%% 2> spawner:start().

-module(spawner).
-export([start/0, loop/0]).

loop() ->
  receive
    _ ->
      loop()
  end.

create_set(0) -> ok;
create_set(N) ->
  spawn(?MODULE, loop, []),
  create_set(N-1).

start(0) -> ok;
start(N) ->
  io:format("Erlang processes: ~p~n", [length(erlang:processes())]),
  timer:sleep(10),
  create_set(1000),
  start(N-1).

start() -> start(100000).
