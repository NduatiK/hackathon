defmodule Hackathon.Messaging.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :emotion, :string
    field :sentiment, :string
    field :text, :string
    field :from, :id

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:sentiment, :emotion, :text, :from])
    |> validate_required([:sentiment, :emotion, :text, :from])
  end
end
