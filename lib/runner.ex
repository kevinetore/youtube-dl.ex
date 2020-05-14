defmodule ElixirYoutubeDl.Runner do
  def main(url, options) do
    IO.puts "Downloading #{url}..."
    youtube_dl_options = arguments(options) ++ [url]
    ElixirYoutubeDl.Support.main()
    |> download(youtube_dl_options)
  end

  defp download(path, options) do
    case System.cmd(path, options, [stderr_to_stdout: true]) do
      {"", error} -> {:error, error}
      {error, 2} -> {:error, error}
      {meta, 0} -> {:ok, meta}
      {meta, 1} -> {:error, meta}
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
