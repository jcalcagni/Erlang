-module(fizzbuzz).

-export([check/1]).

check(N) ->
  if
    N rem 15 == 0 ->
      fizzbuzz;
    N rem 5 == 0 ->
      buzz;
    N rem 3 == 0 ->
      fizz;
    true ->
      io:format("~p is not a multiple of 3 or 5. ~n", [N])
  end.

