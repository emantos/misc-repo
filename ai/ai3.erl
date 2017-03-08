- module(ai3).
- export([move/3, sense/4, localize/5, test1/0, test2/0, test3/0, test4/0, test5/0, test6/0, test7/0]).

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
	{UnNormalized, TotalP} = lists:mapfoldl(
		fun (Row, AccY) ->
			lists:mapfoldl(
				fun (Col, AccX) ->
					UProb = calcSensorProbability(P, Colors, Observation, P_SensorRight, Col, Row),
					{UProb, AccX + UProb}
				end,
				AccY,
				lists:seq(1, length(lists:nth(Row, P))))
		end,
		0.0,
		lists:seq(1, length(P))),
	[[ (X/TotalP) || X <- Y] || Y <- UnNormalized].


calcSensorProbability(P, Colors, Observation, P_SensorRight, Col, Row) ->
	Posterior = lists:nth(Col, lists:nth(Row, P)),
	Color = lists:nth(Col, lists:nth(Row, Colors)),
	if Color == Observation -> 
	  		Posterior * P_SensorRight;
		true -> 
	  		Posterior * (1 - P_SensorRight)
	end.

localize(Colors, Measurements, Motions, P_SensorRight, P_ExactMove) ->
	[H | _] = Colors,
	PInit = 1.0 / length(Colors) / length(H),
	P = [[PInit || _ <- lists:seq(1, length(H))] || _ <- lists:seq(1,length(Colors))],
	
	lists:foldl(
		fun ({Motion, Measurement}, P_Acc) ->
			P_Move = move(P_Acc, Motion, P_ExactMove),
			sense(P_Move, Colors, Measurement, P_SensorRight)
		end,
		P,
		lists:zip(Motions, Measurements)).

test1() ->
	Colors = [[g,g,g],
			  [g,r,g],
			  [g,g,g]],
	Measurements = [r],
	Motions = [[0,0]],
	P_SensorRight = 1.0,
	P_ExactMove = 1.0,
	localize(Colors, Measurements, Motions, P_SensorRight, P_ExactMove).

test2() ->
	Colors = [[g,g,g],
			  [g,r,r],
			  [g,g,g]],
	Measurements = [r],
	Motions = [[0,0]],
	P_SensorRight = 1.0,
	P_ExactMove = 1.0,
	localize(Colors, Measurements, Motions, P_SensorRight, P_ExactMove).

test3() ->
	Colors = [[g,g,g],
			  [g,r,r],
			  [g,g,g]],
	Measurements = [r],
	Motions = [[0,0]],
	P_SensorRight = 0.8,
	P_ExactMove = 1.0,
	localize(Colors, Measurements, Motions, P_SensorRight, P_ExactMove).

test4() ->
	Colors = [[g,g,g],
			  [g,r,r],
			  [g,g,g]],
	Measurements = [r, r],
	Motions = [[0,0],[0,1]],
	P_SensorRight = 0.8,
	P_ExactMove = 1.0,
	localize(Colors, Measurements, Motions, P_SensorRight, P_ExactMove).

test5() ->
	Colors = [[g,g,g],
			  [g,r,r],
			  [g,g,g]],
	Measurements = [r, r],
	Motions = [[0,0],[0,1]],
	P_SensorRight = 1.0,
	P_ExactMove = 1.0,
	localize(Colors, Measurements, Motions, P_SensorRight, P_ExactMove).

test6() ->
	Colors = [[g,g,g],
			  [g,r,r],
			  [g,g,g]],
	Measurements = [r, r],
	Motions = [[0,0],[0,1]],
	P_SensorRight = 0.8,
	P_ExactMove = 0.5,
	localize(Colors, Measurements, Motions, P_SensorRight, P_ExactMove).

test7() ->
	Colors = [[g,g,g],
			  [g,r,r],
			  [g,g,g]],
	Measurements = [r, r],
	Motions = [[0,0],[0,1]],
	P_SensorRight = 1.0,
	P_ExactMove = 0.5,
	localize(Colors, Measurements, Motions, P_SensorRight, P_ExactMove).