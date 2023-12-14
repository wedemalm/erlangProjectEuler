-module(problem3).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(Args) ->
    Factor = findLargestPrimeFactorOf(600851475143),
    io:format("answer: ~p~n", [Factor]),
    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================
findLargestPrimeFactorOf(Number) ->
    Factors = findFactors(Number, 2, []),
    lists:max(Factors).

findFactors(Number, Divide, Factors) ->
    case round(Number) of
        1 -> Factors;
        X ->
            case round(X) rem Divide of
                0 ->
                    findFactors(Number/Divide, Divide, [Divide | Factors]);
                _ ->
                    findFactors(Number, Divide + 1, Factors)
            end
    end.