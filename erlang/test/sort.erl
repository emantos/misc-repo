-module(sort).
-export([bubble/1]).

bubble(List) ->
	bubble([], List, false).

bubble(Acc, [], Continue) when Continue =:= false ->
	Acc;

bubble(Acc, [], Continue)
	bubble([], Acc, false);

bubble(Acc, [X , Y | T], Continue) when X > Y ->
	bubble(Acc ++ [Y], [X | T], true);

bubble(Acc, [H | T], Continue)->
	bubble(Acc ++ [H], [T], Continue).