defmodule ElixirYoutubeDl.DownloadServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def init(arg) do
    {:ok, arg}
  end

  def download_link(pid, url, options) do
    GenServer.cast(pid, {:async_download, url, options})
  end

  def handle_cast({:async_download, url, options}, state) do
    ElixirYoutubeDl.Runner.main(url, options)
    {:noreply, state}
  end
end
