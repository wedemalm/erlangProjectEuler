-module(problem4).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(Args) ->
    Palindrome = largestPalinDromeNumber(),
    io:format("answer: ~p~n", [Palindrome]),
    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================
largestPalinDromeNumber() ->
    All3digitNumbers = lists:seq(100, 999),
    AllProducts = multiplications(All3digitNumbers, All3digitNumbers, []),
    AllPalindromes = findPalindromes(AllProducts, []),
    lists:max(AllPalindromes).

multiplications(_, [], Results) ->
    Results;
multiplications(ListOfNumbers, [Head | Tail], Results) ->
    NewMultResults = [X * Head || X <- ListOfNumbers],
    multiplications(ListOfNumbers, Tail, NewMultResults ++ Results).

findPalindromes([], Results) ->
    Results;
findPalindromes([Head | Tail], Results) ->
    HeadAsList = integer_to_list(Head),
    case lists:reverse(HeadAsList) =:= HeadAsList of
        true -> findPalindromes(Tail, [Head | Results]);
        _ -> findPalindromes(Tail, Results)
    end.

