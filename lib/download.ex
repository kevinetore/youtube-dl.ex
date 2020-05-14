defmodule ElixirYoutubeDl.Download do
  def download(url, options \\ []) do
    ElixirYoutubeDl.Runner.main(url, options)
  end
end
