defmodule NeatoTest do
  use ExUnit.Case
  doctest Neato

  test "greets the world" do
    assert Neato.hello() == :world
  end
end
