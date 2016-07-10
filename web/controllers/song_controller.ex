defmodule BetasoundsApp.SongController do
  use BetasoundsApp.Web, :controller

  def index(conn, _params) do
    json conn, %{ songs: :ok }
  end
end
