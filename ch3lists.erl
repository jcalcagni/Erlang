-module(ch3lists).

-export([filt/2, rev/1, concat/1, flat/1]).

filt([], _) -> [];
filt([Head | Tail], Max) -> 
 case Max < Head of
     true  -> filt(Tail, Max); 
     false -> [Head] ++ filt(Tail, Max)
 end.

rev([]) ->
    [];
rev([Head | Tail]) ->
    rev(Tail) ++ [Head].

concat([]) ->
    [];
concat([Head | Tail]) ->
    concat(Head) ++ concat(Tail);
concat(X) ->
    [X].


flat(List) ->
    concat(List).
