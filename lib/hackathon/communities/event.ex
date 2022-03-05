defmodule Hackathon.Communities.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :description, :string
    field :location, :string
    field :name, :string
    field :community, :id
    field :organizer, :id

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :description, :location])
    |> validate_required([:name, :description, :location])
  end
end
