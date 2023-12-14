-module(problem10).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(Args) ->
    Primes = findPrimes(2000000),
    SumOfPrimes = lists:sum(Primes),
    io:format("answer: ~p~n", [SumOfPrimes]),
    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================
findPrimes(MaxNumber) ->
    InitialListOfPrimes = [2, 3, 5, 7, 11],
    findPrimesHelper(MaxNumber, InitialListOfPrimes, 12).

findPrimesHelper(MaxNumber, ListOfPrimes, PotentialNewPrime) when PotentialNewPrime > MaxNumber ->
    ListOfPrimes;

findPrimesHelper(MaxNumber, ListOfPrimes, PotentialNewPrime) ->
    case checkIfPrime(PotentialNewPrime, ListOfPrimes) of
        true -> io:fwrite("new prime found: ~p~n", [PotentialNewPrime]),
            findPrimesHelper(MaxNumber, [PotentialNewPrime | ListOfPrimes], PotentialNewPrime + 1);
        false -> findPrimesHelper(MaxNumber, ListOfPrimes, PotentialNewPrime + 1)
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