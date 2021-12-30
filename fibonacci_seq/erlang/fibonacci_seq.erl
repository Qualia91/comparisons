-module(fibonacci_seq).
-author(boc_dev).

-export([main/0, fib_rec/1, fib_iter/1]).

-spec main() -> ok.
main() ->
    % Recursive
    io:format("Fib number 20 is: ~p~n", [fib_rec(20)]),
    run_and_time(fun fib_rec/1, "fib_rec", 35),
    
    % Iterative
    io:format("Fib number 20 is: ~p~n", [fib_iter(20)]),
    run_and_time(fun fib_iter/1, "fib_iter", 100000).

run_and_time(Func, Name, Iter) ->
    StartTime = erlang:timestamp(),
    _ = Func(Iter),
    EndTime = erlang:timestamp(),
    io:format("~s took ~p to find fib number ~p~n", [Name, timer:now_diff(EndTime,StartTime) / 1000000, Iter]).
    
-spec fib_rec(integer()) -> integer().
fib_rec(0) ->
    0;
fib_rec(X) when X < 2 ->
    1;
fib_rec(X) ->
    fib_rec(X - 1) + fib_rec(X - 2).
    
-spec fib_iter(integer()) -> integer().
fib_iter(X) ->
    fib_iter(X, 0, 1).

-spec fib_iter(integer(), integer(), integer()) -> integer().
fib_iter(0, Acc, _Next) ->
    Acc;
fib_iter(Idx, Acc, Next) ->
    fib_iter(Idx - 1, Next, Acc + Next).