-module(problem5).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(Args) ->
    Answer = findNumberDivideableWith1to20(20),
    io:format("Answer: ~p~n", [Answer]),
    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================
findNumberDivideableWith1to20(CurrentTestNumber) ->
    case divideableWithEveryNumberUpTo(CurrentTestNumber, 20) of
        true  -> CurrentTestNumber;
        false -> findNumberDivideableWith1to20(CurrentTestNumber + 20)
    end.

%% internal functions
divideableWithEveryNumberUpTo(_NumberToBeDivided, 1) ->
    true;
divideableWithEveryNumberUpTo(NumberToBeDivided, UpTo) ->
    case NumberToBeDivided rem UpTo of
        0 -> divideableWithEveryNumberUpTo(NumberToBeDivided, UpTo - 1);
        _ -> false
    end.
