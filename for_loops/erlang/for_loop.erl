-module(for_loop).
-author(boc_dev).

-export([main/0]).

-spec main() -> ok.
main() ->
    LoopFunction = fun(Val) -> io:format("~p", [Val]) end,
    Values = [0,1,2,3,4],

    % Manual For Loop
    manual_loop(LoopFunction, Values),

    io:format("~n"),

    % Lists For Each
    lists:foreach(LoopFunction, Values).
    
-spec manual_loop(fun(), list(any())) -> ok.
manual_loop(_Fun, []) ->
    ok;
manual_loop(Fun, [Head | Tail]) ->
    Fun(Head),
    manual_loop(Fun, Tail).