-module(parallel_processing).
-author(boc_dev).

-export([main/0]).

-spec main() -> ok.
main() ->
    
    Matrix = [
        [0,1,2,3,4],
        [5,6,7,8,9],
        [10,11,12,13,14],
        [5,6,7,8,9],
        [0,1,2,3,4]
    ],

    ProcessesRunning = process_matrix(0, Matrix),
    UpdatedMatrix = collect(ProcessesRunning - 1, []),

    lists:foreach(fun(Row) -> io:format("~p~n", [Row]) end, UpdatedMatrix).

-spec process_matrix(integer(), list(list(integer()))) -> integer().
process_matrix(ProcessesRunning, []) ->
    ProcessesRunning;
process_matrix(Index, [FirstRow | Rest]) ->
    Self = self(),
    erlang:spawn(fun() -> process_row(Self, Index, FirstRow) end),
    process_matrix(Index + 1, Rest).
    
-spec process_row(pid(), integer(), list(integer())) -> ok.
process_row(ReturnAddress, RowIndex, Row) ->
    ReturnAddress ! {RowIndex, lists:map(fun(Val) -> Val * 2 end, Row)}.

-spec collect(integer(), list(list(integer()))) -> list(list(integer())).
collect(-1, Matrix) ->
    Matrix;
collect(ProcessesLeft, Matrix) ->
    receive
        {_ProcessesLeft, Row} ->
            collect(ProcessesLeft - 1, [Row | Matrix])
    end.