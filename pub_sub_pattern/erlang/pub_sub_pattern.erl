-module(pub_sub_pattern).
-author(boc_dev).

-export([main/0]).

-spec main() -> ok.
main() ->
    PublisherPID = spawn(fun() -> create_publisher([]) end),
    SubOne = spawn(fun() -> create_subscriber("SubOne") end),
    SubTwo = spawn(fun() -> create_subscriber("SubTwo") end),
    SubThree = spawn(fun() -> create_subscriber("SubThree") end),

    PublisherPID ! {sub, SubOne},
    PublisherPID ! {sub, SubTwo},
    PublisherPID ! {sub, SubThree},
    PublisherPID ! {pub, <<"Some Data">>},
    PublisherPID ! {unsub, SubThree},
    PublisherPID ! {pub, <<"Other Data">>},
    ok.

create_publisher(Subscribers) ->
    receive
        {sub, PID} -> 
            create_publisher([PID | Subscribers]);
        {unsub, PID} -> 
            create_publisher(lists:delete(PID, Subscribers));
        {pub, Data} -> 
            lists:foreach(
                fun(Sub) -> Sub ! Data end, 
                Subscribers),
            create_publisher(Subscribers)
    end.

create_subscriber(Name) ->
    receive
        Data -> 
            io:format("~p received data: ~p~n", [Name, Data]),
            create_subscriber(Name)
    end.