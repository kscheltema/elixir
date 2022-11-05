filename = IO.gets("File to count the words from: ") |> String.trim()
body = String.split(File.read!(filename), ~r{^\w})
IO.inspect(body)
