filename = IO.gets("File to count the words from: ") |> String.trim()
body = File.read!(filename) |> String.split()
IO.inspect(body)
