defmodule BetasoundsApp.Song do
  use BetasoundsApp.Web, :model

  @derive {Poison.Encoder, only: [:title]}

  schema "songs" do
    field :title, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(song, params \\ %{}) do
    song
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
