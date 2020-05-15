defmodule ElixirYoutubeDl.Runner do
  def main(url, options) do
    youtube_dl_options = arguments(options) ++ [url]
    ElixirYoutubeDl.Support.main()
    |> download(youtube_dl_options)
  end

  defp download(path, options) do
    IO.puts "Downloading..."

    case System.cmd(path, options, [stderr_to_stdout: true]) do
      {"", error} -> IO.inspect {:error, error}
      {error, 2} -> IO.inspect {:error, error}
      {meta, 0} -> IO.inspect {:ok, meta}
      {meta, 1} -> IO.inspect {:error, meta}
    end
  end

  defp arguments(options) do
    options
    |> Enum.reduce([], fn
      {k, v}, acc -> acc ++ ["--#{k}", v]
      argument, acc -> ["--#{argument}" | acc]
    end)
  end
end
