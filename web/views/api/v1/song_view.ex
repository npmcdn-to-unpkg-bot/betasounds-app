defmodule BetasoundsApp.API.V1.SongView do
  use BetasoundsApp.Web, :view

  def render("index.json", %{songs: songs}) do
    songs
  end

  def render("show.json", %{song: song}) do
    song
  end
end
