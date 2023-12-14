-module(problem2).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(Args) ->
    Sum = sumEvenFibTermsBelow4Mil(),
    io:format("result: ~p~n", [Sum]),
    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================
sumEvenFibTermsBelow4Mil() ->
    EvenTerms = [X || X <- fibTermsBelow4Mil(), X rem 2 =:= 0],
    lists:sum(EvenTerms).

%% internal functions
fibTermsBelow4Mil()->
    fibTermsBelow4Mil([2, 1]).

fibTermsBelow4Mil([Head | Tail]) when Head < 4000000 ->
    NewTerm = Head + lists:nth(1, Tail),
    fibTermsBelow4Mil(lists:append([NewTerm], [Head | Tail]));

fibTermsBelow4Mil([Head | Tail]) when Head >= 4000000 ->
    Tail.