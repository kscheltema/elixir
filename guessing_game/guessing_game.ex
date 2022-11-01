defmodule GuessingGame do
  # guess between, low, high, middle
  # tell the user your guess
  # "yes" -> game over
  # bigger -> bigger (low & high)
  # smaller -> smaller (low & high)
  # anything else -> tell user to enter a valid response

  def mid(low, high) do
    div(low + high, 2)
  end
end
