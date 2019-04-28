require Integer

defmodule Reader do
  def readInteger(:eof) do
    :eof
  end 

  def readInteger(input) do
    a = Integer.parse(input)
    if a != :error do
      [elem(a, 0)]
    else
      []
    end
  end

  def read(acc) do
     input = readInteger(IO.read(:stdio, :line))
     if input == :eof do
       acc
     else
       read(acc ++ input)
     end
  end
end

test = Reader.read([])
IO.inspect test, charlists: :as_lists
#IO.puts test
#IO.puts Reader.readInteger(:eof)
#IO.puts Reader.readInteger("asdfads")
#IO.puts Reader.readInteger("12312")
