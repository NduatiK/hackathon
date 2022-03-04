defmodule Hackathon.Communities.Community do
  use Ecto.Schema
  import Ecto.Changeset

  schema "communities" do
    field :coordinates, :map
    field :description, :string
    field :location, :string
    field :name, :string
    field :visibility, Ecto.Enum, values: [:public, :private, :invite_only]

    timestamps()
  end

  @doc false
  def changeset(community, attrs) do
    community
    |> cast(attrs, [:name, :description, :visibility, :location, :coordinates])
    |> validate_required([:name, :description, :visibility, :location])
  end
end
