defmodule Hackathon.MessagingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hackathon.Messaging` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        emotion: "some emotion",
        sentiment: "some sentiment",
        text: "some text"
      })
      |> Hackathon.Messaging.create_message()

    message
  end
end
