defmodule ElixirYoutubeDl.Runner do
  def main(url, options) do
    executable = ElixirYoutubeDl.Support.main()
    IO.puts "Downloading #{url}..."
    IO.puts "Options: #{options}..."

    arguments = options ++ [url]

    case System.cmd(executable, arguments, [stderr_to_stdout: true]) do
      {"", error} -> {:error, "#{url} is not a valid URL"}
      {"", 2} -> {:error, "youtube-dl: error: no such option"}
      {meta, 0} -> {:ok, meta}
      {meta, 1} -> {:error, "ffprobe and or ffmpeg not found. Please install one."}
    end
  end
end
