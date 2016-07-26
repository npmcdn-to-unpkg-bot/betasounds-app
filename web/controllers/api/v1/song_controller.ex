defmodule BetasoundsApp.API.V1.SongController do
  use BetasoundsApp.Web, :controller
  alias BetasoundsApp.Song

  def index(conn, _params) do
    songs = Repo.all(Song)
    render(conn, "index.json", songs: songs)
  end

  def show(conn, %{"id" => id}) do
    song = Repo.get!(Song, id)
    render(conn, "show.json", song: song)
  end
end
