-module(problem9).

%% API exports
-export([main/1]).

%%====================================================================
%% API functions
%%====================================================================

%% escript Entry point
main(Args) ->
    io:format("answer: ~p~n", [solution()]),
    erlang:halt(0).

%%====================================================================
%% Internal functions
%%====================================================================

%% c^2 = b^2 + a^2
%% c + b + a = 1000
%% c > b > a
%% highest value of a = 332
%% smallest value of c = 335
%% highest value of c = 997
solution() ->
    [A * B * C || C <- lists:seq(335, 997), B <- lists:seq(1, 1000), A <- lists:seq(335, 1000), A*A + B*B == C*C, A+B+C == 1000].