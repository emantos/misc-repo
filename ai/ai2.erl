- module(ai2).
- export([move/3, test1/1]).

move(P, [MotionY , MotionX], ExactMove) ->
	{Q, _} = lists:mapfoldl(
  	fun (Y, AccY) ->
  		{Row, _} = lists:mapfoldl(
        fun (_, AccX) ->
          Row = lists:nth(idx(AccY - MotionY, length(P)), P),
          { lists:nth(idx(AccX - MotionX, length(Row)), Row),
            AccX + 1 }
        end,
        1,
        Y),
      {Row, AccY + 1}
  	end,
    1,
  	P),
  Q.

sense(P, Colors, Observation, SensorRight) ->
  {Q, {TotalProbability, _}} = lists:mapfoldl(
    fun (Y, {TotalProbability, AccY}) ->
      {Row, {TotalProbabilityY, _}} = lists:mapfoldl(
        fun (_, {TotalProbabilityX, AccX}) ->
          Color = lists:nth(AccX, lists:nth(AccY, Colors)),
          if Color == Observation -> 
              Hit = 1;
            true -> 
              Hit = 0
          end,
          Posterior = lists:nth(AccX, lists:nth(AccY, P)),
          UnnormalizedProbability = Posterior * ((Hit * SensorRight) + ((1 - Hit) * (1 - SensorRight))),
          io:format("0 ~f ~f~n", [TotalProbabilityX, UnnormalizedProbability]),
          {UnnormalizedProbability, {TotalProbabilityX + UnnormalizedProbability, AccX + 1}}
        end,
        {0.0, 1},
        Y),
      io:format("1 ~f ~f~n", [TotalProbability, TotalProbabilityY]),
      {Row, {TotalProbability + TotalProbabilityY, AccY + 1}}
    end,
    {0.0, 1},
    P),
  [[(C / TotalProbability) || C <- R] || R <- Q].

idx(X, L) when X < 0 -> L - X;
idx(0, L) -> L;
idx(X, L) when X rem L == 0 -> X;
idx(X, L) -> X rem L.

test1(Motion) -> 
  NP = [[0.0, 0.0, 0.0],
       [0.0, 0.0, 0.0],
       [0.0, 0.0, 0.0]],

  P = [[(1/9) || C <- R] || R <- NP],

  C = [[g, g, g],
       [g, r, g],
       [g, g, g]],

  R = sense(P, C, r, 0.8),
  io:format("~p~n", [R]).