defmodule BetasoundsApp.Repo do
  use Ecto.Repo,
    otp_app: :betasounds_app,
    adapter: Ecto.Adapters.Postgres
end
