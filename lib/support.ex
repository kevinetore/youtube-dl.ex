defmodule ElixirYoutubeDl.Support do
  def main() do
    find_path()
    |> make_executable
  end

  defp find_path() do
    IO.puts "Finding executable..."
    case System.find_executable("youtube-dl") do
      nil -> "../vendor/youtube-dl"
      path -> path
    end
  end

  defp make_executable(path) do
    IO.puts "Reading file access..."
    {:ok, %File.Stat{access: access}} = File.lstat(path)

    case access do
      mod when mod in [:write, :read] -> File.chmod(path, 0o755)
      :read_write -> path
    end

    path
  end
end
