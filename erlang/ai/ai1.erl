- module(ai1).
- export([sense/5, shiftToPosition/2, move/2, move/5, move2/5]).

sense(P, Z, W, Hit, Miss) -> 
	RawP = 
		lists:map(
			fun ({Probability, WValue}) -> 
				if WValue == Z ->
						Probability * Hit;
					true ->
						Probability * Miss
				end
			end, 
			lists:zip(P, W)),

	PSum = lists:sum(RawP),

	lists:map(fun (Probability) -> Probability/PSum end, RawP).

move(P, Dir) ->
	SplitPosition = (length(P) - Dir) rem length(P),
	{A, B} = lists:split(SplitPosition, P),
	B ++ A.

mod(X, L) when X < 0 ->  L - X;
mod(0, L) -> L;
mod(X, L) -> X rem L.

move(P, Dir, PHit, PUndershoot, POvershoot) ->
	{NewList, _} = 
		lists:mapfoldl(
			fun (_,[X,Y,Z | T]) -> 
				{(X * POvershoot) + (Y * PHit) + (Z * PUndershoot),
				  move([X,Y,Z] ++ T, -1)}
			end,
			move(P, Dir + 1),
			P),
	NewList.
