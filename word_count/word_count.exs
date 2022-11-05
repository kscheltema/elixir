filename = IO.gets("File to count the words from: ") |> String.trim()
body = String.split(File.read!(filename), ~r{(\\n|[^\w'])+})
IO.inspect(body)
