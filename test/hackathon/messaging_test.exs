defmodule Hackathon.MessagingTest do
  use Hackathon.DataCase

  alias Hackathon.Messaging

  describe "messages" do
    alias Hackathon.Messaging.Message

    import Hackathon.MessagingFixtures

    @invalid_attrs %{emotion: nil, sentiment: nil, text: nil}

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messaging.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messaging.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      valid_attrs = %{emotion: "some emotion", sentiment: "some sentiment", text: "some text"}

      assert {:ok, %Message{} = message} = Messaging.create_message(valid_attrs)
      assert message.emotion == "some emotion"
      assert message.sentiment == "some sentiment"
      assert message.text == "some text"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messaging.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()

      update_attrs = %{
        emotion: "some updated emotion",
        sentiment: "some updated sentiment",
        text: "some updated text"
      }

      assert {:ok, %Message{} = message} = Messaging.update_message(message, update_attrs)
      assert message.emotion == "some updated emotion"
      assert message.sentiment == "some updated sentiment"
      assert message.text == "some updated text"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messaging.update_message(message, @invalid_attrs)
      assert message == Messaging.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messaging.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messaging.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messaging.change_message(message)
    end
  end
end
