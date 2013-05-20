-module(caesar).
-export([main/2, caesar/2]).

%build this function piece by piece. offset is working for values > 26
caesar(String, Int) ->
  io:format("~s~n", [lists:map(fun(C) -> C + push(C, offset(Int)) end, String)]).

%%in case a higher number than 26 used, normalize    
offset(Value) when (Value > 25) ->  
  Value rem 26;
offset(Value) when (Value < 0) ->
  26 + Value rem 26;
offset(Value) ->
  Value.
  
%$A 65, $Z, 90;   $a 97, $z 122
% this function makes sure only letters, not special characters  
%This was a pain to figure out. I still may have it wrong but it works with my testing
rotate(Char, Key) when (Char >= $a) and (Char =< $z) or
                       (Char >= $A) and (Char =< $Z) ->
  Change = $A + Char band 32,
  X = Char - Change,
  Change + (X + Key) rem 26;
rotate(Char, _Key) ->  
  Char.  
  
%calling this main function will encrypt & decrypt the text using the offset function and the rotate
%function.  
  
main(PlainText, Key) ->
  Encode = offset(Key),
  Decode = offset(-Key),
 
  io:format("Plaintext ----> ~s~n", [PlainText]),
 
  CypherText = lists:map(fun(Char) -> rotate(Char, Encode) end, PlainText),
  io:format("Cyphertext ---> ~s~n", [CypherText]),
  
  DecodeText = lists:map(fun(Char) -> rotate(Char, Decode) end, CypherText).



  
