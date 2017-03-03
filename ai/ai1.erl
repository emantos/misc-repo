- module(ai1).
- export([sense/5, move/2]).

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