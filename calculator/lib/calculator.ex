defmodule Calculator do
  @moduledoc """
  Documentation for `Calculator`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Calculator.hello()
      :world

  """
  def start do
    spawn(fn -> loop(0) end)
  end

  defp loop(current_value) do
    new_value =
      receive do
        {:view, caller_pid} ->
          send(caller_pid, {:response, current_value})
          current_value

        {:add, value} ->
          current_value + value

        {:sub, value} ->
          current_value - value

        {:mul, value} ->
          current_value * value

        {:div, value} ->
          current_value / value

        _ ->
          IO.puts("invalid message")
      end

    loop(new_value)
  end
end
