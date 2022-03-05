defmodule Hackathon.ProfileFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hackathon.Profile` context.
  """

  @doc """
  Generate a interest.
  """
  def interest_fixture(attrs \\ %{}) do
    {:ok, interest} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Hackathon.Profile.create_interest()

    interest
  end

  @doc """
  Generate a user_interest.
  """
  def user_interest_fixture(attrs \\ %{}) do
    {:ok, user_interest} =
      attrs
      |> Enum.into(%{})
      |> Hackathon.Profile.create_user_interest()

    user_interest
  end
end
