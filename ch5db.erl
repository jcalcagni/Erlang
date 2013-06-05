%exercise 5-1, modify the ch3 pseudo-database using lists but now using server process
-module(ch5db).

-export([start/0, stop/0, write/2, read/1, match/1, delete/1]).
-export([loop/1]).

%-define(SERVER, ?MODULE).
% messages are matched to calls to the db function

loop(Db) ->
  receive
  {stop, Pid} ->
    Pid ! db:destroy(Db);
  {write, Pid, Key, Value} ->
    NewDb = db:write(Key, Value, Db),
  Pid ! ok,
	loop(NewDb);
  {delete, Pid, Key} ->
    NewDb = db:delete(Key, Db),
	Pid ! ok,
	loop(NewDb);
  {read, Pid, Key} ->
    Pid ! db:read(Key, Db),
	loop(Db);
  {match, Pid, Value} ->
    Pid ! db:match(Value, Db),
	loop(Db)
  end.
  
%% start a new db server
start() ->
  register(new_db, spawn(new_db, loop, db:new()])),
  ok.
  
  
%these look a lok alike which screams "REFACTOR" to me but I'm still learning Erlang and FP  
% stop db server
stop() ->
  new_db ! {stop, self()},
  receive Message -> Message end.
  
%writes to db
write(Key, Value) ->
  new_db ! {write, self(), Key, Value},
  receive Message -> Message end.

%deletes key value pair from db
delete(Key) ->
  new_db ! {delete, self(), Key},
  receive Message -> Message end.
  
%read an element from the DB
read(Key) ->
  new_db ! {read, self(), Key},
  receive Message -> Message end.
  
%search for value, return Key
match(Value) ->
  new_db ! {match, self(), Value},
  receive Message -> Message end.
  
