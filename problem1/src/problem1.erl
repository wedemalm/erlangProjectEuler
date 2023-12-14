-module(problem1).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(Args) ->
    Sum = sumMultiplesOf3Or5(1000),
    io:format("result: ~p~n", [Sum]),
    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================

sumMultiplesOf3Or5(MaxValue) ->
    NaturalNumbers = lists:seq(0, MaxValue),
    MultiplesOf3   = [X || X <- NaturalNumbers, X rem 3 =:= 0],
    MultiplesOf5   = [X || X <- NaturalNumbers, X rem 5 =:= 0],
    DistinctMultiples = lists:usort(MultiplesOf3 ++ MultiplesOf5),
    lists:sum(DistinctMultiples).