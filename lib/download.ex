defmodule ElixirYoutubeDl.Download do
  def download(url, options \\ []) do
    {:ok, pid} = ElixirYoutubeDl.DownloadServer.start_link
    ElixirYoutubeDl.DownloadServer.download_link(pid, url, options)
  end
end
