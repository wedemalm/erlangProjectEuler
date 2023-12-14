-module(problem6).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(Args) ->
    Answer = diff(1, 100),
    io:format("answer: ~p~n", [Answer]),
    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================
diff(Min, Max) ->
    squareOfSum(Min, Max) - sumOfSquaresOfNaturalNumbers(Min, Max).

sumOfSquaresOfNaturalNumbers(Min, Max) ->
    Squares = [N*N || N <- lists:seq(Min, Max)],
    lists:sum(Squares).

squareOfSum(Min, Max) ->
    SumOfNaturalNumbers = lists:sum(lists:seq(Min, Max)),
    SumOfNaturalNumbers * SumOfNaturalNumbers.
