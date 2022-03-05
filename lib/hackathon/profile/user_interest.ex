defmodule Hackathon.Profile.UserInterest do
  use Ecto.Schema
  import Ecto.Changeset
  alias Hackathon.Profile.Interest
  alias Hackathon.Accounts.User

  schema "user_interests" do
    belongs_to(:interest, Interest)
    belongs_to(:user, User)
    timestamps()
  end

  @doc false
  def changeset(user_interest, attrs) do
    user_interest
    |> cast(attrs, [:user_id, :interest_id])
    |> validate_required([])
  end
end
