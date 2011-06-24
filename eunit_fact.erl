%% 1> c(eunit_fact).
%% 2> eunit:test(eunit_fact).  OR  2> eunit_fact:test().

-module(eunit_fact).
-export([fact/1]).
-include_lib("eunit/include/eunit.hrl").

fact(0) -> 1;
fact(1) -> 1;
fact(N) when N > 1 -> N * fact(N-1).

fact_test_() ->
    [?_assert(fact(0) == 1),
     ?_assert(fact(1) == 1),
     ?_assert(fact(2) == 2),
     ?_assert(fact(3) == 6),
     ?_assert(fact(4) == 24),
     ?_assert(fact(5) == 120),
     ?_assert(fact(6) == 720),
     ?_assert(fact(7) == 5040),
     ?_assert(fact(8) == 40320),
     ?_assert(fact(9) == 362880),
     ?_assertError(function_clause, fact(-1))].
