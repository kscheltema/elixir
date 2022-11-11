defmodule MinimalTodo do
  def start do
    # ask user for a filename
    # open and read that file
    # parse the data
    # ask user for command
    # read, add, delete, load, save ...todo
    filename = IO.gets(~s{Name the .csv file to load: }) |> String.trim()
    read(filename)
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, body}       -> body
      {:error, reason}  -> IO.puts ~s{Could not open file "#{filename}" \n}
                           IO.inspect ~s{"#{:file.format_error reason}" \n}
                           start()
    end
  end

  def parse(body) do
    [header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
    titles = tl String.split(header, ",")
    parse_lines(lines, titles)
  end

  def parse_lines(lines_titles) do
    Enum.reduce(lines, %{}, fn line, built ->
      [name | fields] = String.split(line, ",")
      if Enum,count(fields) == Enum.count(titles) do
        line_data = Enum.zip(titles, fields) |> Enum.into(%{})
        Map.merge(built, %{name => line_data})
      else
        built
      end
    end)
  end
end
