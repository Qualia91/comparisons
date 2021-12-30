-module(binary_tree).
-author(boc_dev).

-export([main/0]).

-record(tree_node, {
    val               :: any(),
    left  = undefined :: node(),
    right = undefined :: node()
}).
-type tree_node() :: tree_node.

-spec main() -> ok.
main() ->
    Root = #tree_node{
        val = 100, 
        left = #tree_node{val = 1}, 
        right = #tree_node{val = 50, right = #tree_node{val = 7}}},
    io:format("~p", [create_list(Root)]).
    
-spec create_list(tree_node()) -> list().
create_list(#tree_node{val = Val, left = undefined, right = undefined}) ->
    [Val];
create_list(#tree_node{val = Val, left = undefined, right = Right}) ->
    [Val | create_list(Right)];
create_list(#tree_node{val = Val, left = Left, right = undefined}) ->
    create_list(Left) ++ [Val];
create_list(#tree_node{val = Val, left = Left, right = Right}) ->
    create_list(Left) ++ [Val] ++ create_list(Right).