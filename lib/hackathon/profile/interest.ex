defmodule Hackathon.Profile.Interest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "interests" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(interest, attrs) do
    interest
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
