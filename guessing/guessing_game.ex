defmodule GuessingGame do
#guess a number between (low, high) -> guess a number in the middle
#tell the user your guess
#"yes" -> game over
#"bigger" -> bigger(low, high)
#"smaller" -> smaller(low, high)
#anything else -> tell the user to enter a valid response

  def mid(low, high) do
    div(low + high, 2)
  end
end
