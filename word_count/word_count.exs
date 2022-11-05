filename = IO.gets("File to count the words from: ") |> String.trim()
words = String.split(File.read!(filename), ~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)
IO.inspect(words)
words |> Enum.count() |> IO.puts()
