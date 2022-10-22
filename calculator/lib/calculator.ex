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

  def view(server_pid) do
    send(server_pid, {:view, self()})

    receive do
      {:response, value} ->
        value
    end
  end

  def add(server_pid, value), do: send(server_pid, {:add, value})
  def sub(server_pid, value), do: send(server_pid, {:sub, value})
  def mul(server_pid, value), do: send(server_pid, {:mul, value})
  def div(server_pid, value), do: send(server_pid, {:div, value})
  def stop(server_pid), do: send(server_pid, {:exit})

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

        {:reset} ->
          current_value * 0

        {:exit} ->
          exit(:normal)

        _ ->
          IO.puts("invalid message")
      end

    loop(new_value)
  end
end
