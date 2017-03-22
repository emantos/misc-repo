-module(test).
-export([bubble/1]).

bubble(List) ->
	bubble([], [], List).

bubble(_, _, []) ->
	[];

bubble(ResultAcc, [], [H | []]) ->
	ResultAcc ++ [H];

bubble(ResultAcc, RemAcc, [H | []]) ->
	bubble(ResultAcc ++ [H], [], RemAcc);

bubble(ResultAcc, RemAcc, [X , Y | T]) when X > Y ->
	bubble(ResultAcc, RemAcc ++ [Y], [X | T]);

bubble(ResultAcc, RemAcc, [X , Y | T])->
	bubble(ResultAcc, RemAcc ++ [X], [Y | T])