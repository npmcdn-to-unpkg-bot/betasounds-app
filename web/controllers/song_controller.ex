defmodule BetasoundsApp.SongController do
  use BetasoundsApp.Web, :controller
  alias BetasoundsApp.Song

  def index(conn, _params) do
    songs = Repo.all(Song)
    render(conn, "index.html", songs: songs)
  end

  def new(conn, _params) do
    changeset = Song.changeset(%Song{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"song" => song_params}) do
    changeset = Song.changeset(%Song{}, song_params)

    case Repo.insert(changeset) do
      {:ok, _song} ->
        conn
        |> put_flash(:info, "Song added successfully")
        |> redirect(to: song_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    song = Repo.get!(Song, id)
    render(conn, "show.html", song: song)
  end

  def edit(conn, %{"id" => id}) do
    song = Repo.get!(Song, id)
    changeset = Song.changeset(song)
    render(conn, "edit.html", song: song, changeset: changeset)
  end

  def update(conn, %{"id" => id, "song" => song_params}) do
    song = Repo.get!(Song, id)
    changeset = Song.changeset(song, song_params)

    case Repo.update(changeset) do
      {:ok, song} ->
        conn
        |> put_flash(:info, "Song added successfully")
        |> redirect(to: song_path(conn, :show, song))
      {:error, changeset} ->
        render(conn, "edit.html", song: song, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    song = Repo.get!(Song, id)
    Repo.delete!(song)
    conn
    |> put_flash(:info, "Song deleted successfully")
    |> redirect(to: song_path(conn, :index))
  end
end
