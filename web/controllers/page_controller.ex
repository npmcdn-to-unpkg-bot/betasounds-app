defmodule BetasoundsApp.PageController do
  use BetasoundsApp.Web, :controller

  def index(conn, _params) do
    conn
    |> assign(:title, "Home")
    |> render "index.html"
  end
end
