filename = IO.gets("File to count the words from: ") |> String.trim()
option = IO.gets ~s{Would you like to count: "words", "lines" or "characters"? }
case String.trim(option) do
  "words" -> words = File.read!(filename)
  |> String.split(~r{(\\n|[^\w'])+})
  |> Enum.filter(fn x -> x != "" end)
  words |> Enum.count() |> IO.puts()
  "characters" -> characters = File.read!(filename)
  |> String.split(~r{[^\w]+})
  |> Enum.filter(fn x -> x != "" end)
  characters |> Enum.count() |> IO.puts()
  "lines"
  _ -> ~s{Sorry that is not a valid option}
end
