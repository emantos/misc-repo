- module(rpn).
- export([eval/1]).

eval(Expr) ->
	lists:foldl(fun evaluate/2, [], string:tokens(Expr, " ")).

evaluate(Element, Stack) when Element == "*"; Element == "+"; Element == "-"; Element == "/"-> 
	popUntil(operation(Element), Stack);

evaluate(Element, Stack) -> 
	[list_to_number(Element) | Stack].

operation(Symbol) when Symbol == "*" -> 
	fun (X, Y) -> X * Y end;

operation(Symbol) when Symbol == "+" -> 
	fun (X, Y) -> X + Y end;

operation(Symbol) when Symbol == "-" -> 
	fun (X, Y) -> Y - X end;

operation(Symbol) when Symbol == "/" -> 
	fun (X, Y) -> Y / X end.

list_to_number(X) ->
	case string:to_float(X) of
		{error, no_float} -> 
			case string:to_integer(X) of 
				{error, no_integer} -> erlang:error(conversion_to_number_error);
				{Result, _} -> Result
			end;
		{Result, _} -> Result
	end.

popUntil(Op, [X, Y | T]) when is_number(X), is_number(Y) ->
	popUntil(Op, [Op(X, Y) | T]);

popUntil(_, Stack) ->
	Stack.