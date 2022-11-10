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
    lines = String.split(body, ~r{(\r\n|\r|\n)})
  end
end
