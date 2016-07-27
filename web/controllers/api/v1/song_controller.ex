defmodule BetasoundsApp.API.V1.SongController do
  use BetasoundsApp.Web, :controller
  alias BetasoundsApp.Song

  def index(conn, params) do
    query = do_params_to_query(params)
    response = Spotify.get("search", query: query).body
    do_save_tracks(response.tracks.items)

    render(conn, "index.json", songs: response)
  end

  defp create(%{"song" => song_params}) do
    title = song_params.name
    exists? = [title: title]
      |> do_find
      |> length

    unless exists? do
      changeset = Song.changeset(%Song{}, %{title: title})
      case Repo.insert(changeset) do
        {:ok, song} ->
          song
        {:error, changeset} ->
          changeset
      end
    end
  end

  def create(conn, params) do
    create(params)
  end

  def show(conn, %{"id" => id}) do
    song = Repo.get!(Song, id)
    render(conn, "show.json", song: song)
  end

  defp do_find(title: title) do
    query = from s in Song,
      where: s.title == ^title,
      select: s

    Repo.all(query)
  end

  def do_save_tracks([track | tracks]) do
    create(%{"song" => track})
  end

  defp do_params_to_query(params) do
    %{
      type: Map.get(params, "type", "track"),
      limit: Map.get(params, "limit", 15),
      q: Map.get(params, "q", "")
    }
  end
end
