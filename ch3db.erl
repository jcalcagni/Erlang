%exercise 3-4, pseudo-database using lists
-module(ch3db).

-export([new/0, write/3, read/2, match/2, delete/2, destroy/1]).

new() -> [].

write(Key, Value, []) -> [{Key, Value}];
write(Key, Value, [Record | Db]) ->
  case Record of
  {Key, _} -> [{Key, Value} | Db];
  _        -> [Record | write(Key, Value, Db)]
end.

read(_Key, []) -> {error, instance};
read(Key, [Record | Db]) ->
  case Record of
  {Key, Value} -> {ok, Value};
  _            -> read(Key, Db)
end.

match(_Value, []) -> [];
match(Value, [Record | Db]) -> 
  case Record of
      {Key, _Value} -> [Key | match(Value, Db)];
      _             -> [Record | match(key, Db)]
end.

delete(_Key, []) -> [];
delete(Key, [Record | Db]) -> 
  case Record of
      {Key, _Value} -> Db;
      _             -> [Record | delete(key, Db)]
end.

destroy(_Db) -> 
  ok.
  
