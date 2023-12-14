-module(problem7).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(Args) ->
    Prime = findTheNthPrime(10001),
    io:format("answer: ~p~n", [Prime]),
    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================

findTheNthPrime(N) ->
    InitialListOfPrimes = [2, 3, 5, 7, 11],
    findTheNthPrimeHelper(N, InitialListOfPrimes, 12).

findTheNthPrimeHelper(N, ListOfPrimes, PotentialNewPrime) ->
    case length(ListOfPrimes) of
        N -> lists:max(ListOfPrimes);
        _ ->
            case checkIfPrime(PotentialNewPrime, ListOfPrimes) of
                true  ->
                    io:fwrite("new prime found: ~p\t\tnumber in order ~p~n", [PotentialNewPrime, length(ListOfPrimes)]),
                    findTheNthPrimeHelper(N, [PotentialNewPrime | ListOfPrimes], PotentialNewPrime + 1);
                false ->
                    findTheNthPrimeHelper(N, ListOfPrimes, PotentialNewPrime + 1)
            end
    end.

checkIfPrime(Num, _) when Num rem 2 =:= 0 ->
    false;
checkIfPrime(Num, ListOfPrimes) ->
    checkIfPrimeHelper(Num, ListOfPrimes).

checkIfPrimeHelper(_, []) ->
    true;
checkIfPrimeHelper(Num, [Head | Tail]) ->
    case Num rem Head of
        0 -> false;
        _ -> checkIfPrimeHelper(Num, Tail)
    end.