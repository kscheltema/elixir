defmodule GuessingGame do
#guess a number between (low, high) -> guess a number in the middle
#tell the user your guess
#"yes" -> game over
#"bigger" -> bigger(low, high)
#"smaller" -> smaller(low, high)
#anything else -> tell the user to enter a valid response

  def guess(low, high) do
    IO.puts(low)
    IO.puts(high)
  end

  def mid(low, high) do
    div(low + high,2)
  end

  def bigger(low,high)do
    new_low = min(high, mid(low)+1)
    guess(new_low, high)
  end
end
