-module(map_filter_reduce).
-author(boc_dev).

-export([main/0]).

-spec main() -> ok.
main() ->
    % Square elements
    % Take only ones less than 100
    % Multiply remaining together
    Result = lists:foldl(
        fun(Elem, Acc) ->
            SqrElem = Elem * Elem,
            case SqrElem < 50 of
                true -> Acc * SqrElem;
                false -> Acc
            end
        end,
        1,
        lists:seq(1,20)),
    io:format("~p~n", [Result]).