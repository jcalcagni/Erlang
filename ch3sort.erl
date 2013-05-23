-module(ch3sort).

-export([quicksort/1, mergesort/1]).

quicksort([]) ->
    [];
quicksort([Head | Tail]) ->
    Prev = [A || A <- Tail, A < Head],
    Next = [A || A <- Tail, A >= Head],
    quicksort(Prev) ++ [Head] ++ quicksort(Next).
  	  
mergesort([]) ->
    [];
mergesort([A]) ->
    [A];
mergesort(List) ->
    ListLength = length(List),
    {List1, List2} = lists:split(ListLength, List),
    SortedList1 = mergesort(List1),
    SortedList2 = mergesort(List2),
    merge(SortedList1, SortedList2).

merge([], List) ->
    List;
merge(List, []) ->
    List;
merge([Head1 | Tail1], [Head2 | Tail2]) ->
    case Head2 < Head1 of
      true  ->
	    [Head2 | merge([Head1 | Tail1], Tail2)];
      false ->
            [Head1 | merge(Tail1, [Head2 | Tail2])]
    end.
