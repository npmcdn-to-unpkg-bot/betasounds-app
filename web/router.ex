defmodule BetasoundsApp.Router do
  use BetasoundsApp.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :default_title
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BetasoundsApp do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", BetasoundsApp do
    pipe_through :api

    get "/songs", SongController, :index
  end

  defp default_title(conn, _params) do
    assign conn, :title, "Beta Sounds"
  end
end
