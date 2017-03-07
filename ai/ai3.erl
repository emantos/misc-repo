- module(ai3).
- export([move/3, sense/4, localize/5]).

move(P, Motion, P_ExactMove) ->
	lists:map(
		fun (Row) ->
			lists:map(
				fun (Col) ->
					calcMoveProbability(P, Motion, P_ExactMove, Col, Row)
				end,
				lists:seq(1, length(lists:nth(Row, P))))
		end,
		lists:seq(1, length(P))).


calcMoveProbability(P, [MotionY , MotionX], P_ExactMove, Col, Row) ->
	P_Row = lists:nth(idx(Row - MotionY, length(P)), P),
	ExactMove = lists:nth(idx(Col - MotionX, length(P_Row)), P_Row) * P_ExactMove,
	NoMovement = (lists:nth(Col, lists:nth(Row, P)) * (1 - P_ExactMove)),
	ExactMove + NoMovement.

idx(X, L) when X < 0 -> L - X;
idx(0, L) -> L;
idx(X, L) when X rem L == 0 -> X;
idx(X, L) -> X rem L.

sense(P, Colors, Observation, P_SensorRight) ->
	UnNormalized = lists:map(
		fun (Row) ->
			lists:map(
				fun (Col) ->
					calcSensorProbability(P, Colors, Observation, P_SensorRight, Col, Row)
				end,
				lists:seq(1, length(lists:nth(Row, P))))
		end,
		lists:seq(1, length(P))).	

calcSensorProbability(P, Colors, Observation, P_SensorRight, Col, Row) ->
	Posterior = lists:nth(Col, lists:nth(Row, P)),
	Color = lists:nth(Col, lists:nth(Row, Colors)),
	if Color == Observation -> 
	  		Posterior * P_SensorRight;
		true -> 
	  		Posterior * (1 - P_SensorRight)
	end.

localize(Colors, Measurements, Motions, P_SensorRight, P_ExactMove) ->
	[H | T] = Colors,
	PInit = 1.0 / length(Colors) / length(H),
	P = [[PInit || X <- lists:seq(1, length(H))] || Y <- lists:seq(1,length(Colors))],
	
	lists:mapfoldl(
		function (Idx, P) ->
			P_Move = move(P, lists:nth(Idx, Motions), P_ExactMove),
			P_Sense = sense(P_Move, Colors, lists:nth(Idx, Measurements), P_SensorRight)
		end,
		P,
		lists:seq(1, length(Motions))).
