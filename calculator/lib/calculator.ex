defmodule Calculator do
  @moduledoc """
  Provides methods for operating a Calculator
  """

  @doc """
  The Calculator functions includes `stop` that leaves the program, `start` that starts up the program, `reset` the changes the saved variable to 0, `view` that displays the variable in the terminal, `mul` that is a short-hand version of Multiplication, `div` that is a short-hand version of Division, `add` that is a short-hand version of Addition, `sub` that is a short-hand version of Subtraction.
  
  ## Examples
  
      iex(1)> pid = Calculator.start
      #PID<0.159.0>
  
      iex(2)> Calculator.add(pid, 5)
      {:add, 5}
  
      iex(3)> Calculator.sub(pid, 1)
      {:sub, 1}
  
      iex(4)> Calculator.mul(pid, 2)
      {:mul, 2}
  
      iex(5)> Calculator.div(pid, 3)
      {:div, 3}
  
      iex(6)> Calculator.view(pid)
      2.6666666666666665
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
  def reset(server_pid), do: send(server_pid, {:reset})
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
          ^current_value = 0

        {:exit} ->
          exit(:normal)

        _ ->
          IO.puts("invalid message")
      end

    loop(new_value)
  end
end
