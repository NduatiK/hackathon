defmodule Hackathon.CommunitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hackathon.Communities` context.
  """

  @doc """
  Generate a community.
  """
  def community_fixture(attrs \\ %{}) do
    {:ok, community} =
      attrs
      |> Enum.into(%{
        coordinates: %{},
        description: "some description",
        location: "some location",
        name: "some name",
        visibility: :public
      })
      |> Hackathon.Communities.create_community()

    community
  end
end
