
defmodule Test do
  def double_each([], acc), do: acc

  def double_each([h | t], acc) do
    double_each(t, acc ++ [h*2])
  end

  def double_each(a) do
    double_each(a, [])
  end
end
