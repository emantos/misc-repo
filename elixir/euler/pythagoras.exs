
defmodule Pythagoras do

  def triplet(1000, _, _), do: { :notfound }

  def triplet(a, 1000, c), do: triplet(a+1, 1, c)

  def triplet(a, b, 1000), do: triplet(a, b+1, 1)

  def triplet(a, b, c) do
    if ((a < b) && (b < c)) && ((a*a) + (b*b) == (c*c)) && (a + b + c == 1000) do
      {a, b, c, a+b+c, a*b*c}
    else
      triplet(a, b, c+1)
    end
  end

  def findTriplets() do
    triplet(1, 1, 1)
  end
end

IO.puts Pythagoras.findTriplets()
