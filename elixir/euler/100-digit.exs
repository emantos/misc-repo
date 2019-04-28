
defmodule HugeDigit do
  defp nextDigit() do
    chr = IO.read(1)
    if chr != :eof do
      num = Integer.parse(chr)
      if num != :error do
        elem(num, 0)
      else
        nextDigit()
      end
    else
      :eof
    end 
  end

  defp readAllDigit(numDigits, digits, largestProduct, largestSequence) do
    nextDigit = nextDigit()
    if nextDigit != :eof do
      if length(digits) < numDigits do
        readAllDigit(numDigits, digits ++ [nextDigit], largestProduct, largestSequence)
      else
        IO.inspect digits, charlists: false
        product = Enum.reduce(digits, 1, fn x,y -> x*y end)
        if product > largestProduct do
          readAllDigit(numDigits, tl(digits) ++ [elem(num, 0)], product, digits)
        else
          readAllDigit(numDigits, tl(digits) ++ [elem(num, 0)], largestProduct, largestSequence)
        end
      end
    else
      {largestSequence, largestProduct}
    end
  end

  defp readAllDigit(numDigits, digits, largestProduct, largestSequence) do
    chr = IO.read(1)
    if chr != :eof do
      num = Integer.parse(chr)
      if num != :error do
        if length(digits) < numDigits do
          readAllDigit(numDigits, digits ++ [elem(num, 0)], largestProduct, largestSequence)
        else
          IO.inspect digits, charlists: false
          product = Enum.reduce(digits, 1, fn x,y -> x*y end)
          if product > largestProduct do
            readAllDigit(numDigits, tl(digits) ++ [elem(num, 0)], product, digits)
          else
            readAllDigit(numDigits, tl(digits) ++ [elem(num, 0)], largestProduct, largestSequence)
          end
        end
      else
        readAllDigit(numDigits, digits, largestProduct, largestSequence)
      end
    else
      {largestSequence, largestProduct}
    end
  end

  def readAllDigit(numDigits) do
    readAllDigit(numDigits, [], 0, [])
  end
end

IO.inspect HugeDigit.readAllDigit(13), charlists: false
