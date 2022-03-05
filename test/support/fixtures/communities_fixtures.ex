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

  @doc """
  Generate a event.
  """
  def event_fixture(attrs \\ %{}) do
    {:ok, event} =
      attrs
      |> Enum.into(%{
        description: "some description",
        location: "some location",
        name: "some name"
      })
      |> Hackathon.Communities.create_event()

    event
  end
end
