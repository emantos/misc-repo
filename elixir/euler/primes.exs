
defmodule Primes do

  def isPrime(numberToCheck, currentNumber) when numberToCheck == currentNumber, do: true

  def isPrime(numberToCheck, currentNumber) do
    if rem(numberToCheck, currentNumber) == 0 do
      false
    else
      isPrime(numberToCheck, currentNumber + 1)
    end
  end

  def isPrime(number) do
    isPrime(number, 2)
  end

  def nextPrime(number) do
    if !isPrime(number) do
      nextPrime(number+1)
    else
      number
    end
  end

  def getPrimeFactors(1, _, accFactors), do: accFactors

  def getPrimeFactors(number, currentPrime, accFactors) do
    if rem(number, currentPrime) == 0 do
      getPrimeFactors(div(number, currentPrime), 2, accFactors ++ [currentPrime])
    else
      getPrimeFactors(number, nextPrime(currentPrime + 1), accFactors)
    end
  end

  def getPrimeFactors(number) do
    getPrimeFactors(number, 2, [])   
  end

end

IO.puts Primes.isPrime(2)
IO.puts Primes.isPrime(3)
IO.puts Primes.isPrime(4)
IO.puts Primes.isPrime(6)
IO.puts Primes.isPrime(11)

IO.inspect Primes.getPrimeFactors(2), charlists: :as_lists
IO.inspect Primes.getPrimeFactors(3), charlists: :as_lists
IO.inspect Primes.getPrimeFactors(6), charlists: :as_lists
IO.inspect Primes.getPrimeFactors(10), charlists: :as_lists
IO.inspect Primes.getPrimeFactors(11), charlists: :as_lists
IO.inspect Primes.getPrimeFactors(600851475143), charlists: :as_lists
