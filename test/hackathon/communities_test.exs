defmodule Hackathon.CommunitiesTest do
  use Hackathon.DataCase

  alias Hackathon.Communities

  describe "communities" do
    alias Hackathon.Communities.Community

    import Hackathon.CommunitiesFixtures

    @invalid_attrs %{
      coordinates: nil,
      description: nil,
      location: nil,
      name: nil,
      visibility: nil
    }

    test "list_communities/0 returns all communities" do
      community = community_fixture()
      assert Communities.list_communities() == [community]
    end

    test "get_community!/1 returns the community with given id" do
      community = community_fixture()
      assert Communities.get_community!(community.id) == community
    end

    test "create_community/1 with valid data creates a community" do
      valid_attrs = %{
        coordinates: %{},
        description: "some description",
        location: "some location",
        name: "some name",
        visibility: :public
      }

      assert {:ok, %Community{} = community} = Communities.create_community(valid_attrs)
      assert community.coordinates == %{}
      assert community.description == "some description"
      assert community.location == "some location"
      assert community.name == "some name"
      assert community.visibility == :public
    end

    test "create_community/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Communities.create_community(@invalid_attrs)
    end

    test "update_community/2 with valid data updates the community" do
      community = community_fixture()

      update_attrs = %{
        coordinates: %{},
        description: "some updated description",
        location: "some updated location",
        name: "some updated name",
        visibility: :private
      }

      assert {:ok, %Community{} = community} =
               Communities.update_community(community, update_attrs)

      assert community.coordinates == %{}
      assert community.description == "some updated description"
      assert community.location == "some updated location"
      assert community.name == "some updated name"
      assert community.visibility == :private
    end

    test "update_community/2 with invalid data returns error changeset" do
      community = community_fixture()
      assert {:error, %Ecto.Changeset{}} = Communities.update_community(community, @invalid_attrs)
      assert community == Communities.get_community!(community.id)
    end

    test "delete_community/1 deletes the community" do
      community = community_fixture()
      assert {:ok, %Community{}} = Communities.delete_community(community)
      assert_raise Ecto.NoResultsError, fn -> Communities.get_community!(community.id) end
    end

    test "change_community/1 returns a community changeset" do
      community = community_fixture()
      assert %Ecto.Changeset{} = Communities.change_community(community)
    end
  end

  describe "events" do
    alias Hackathon.Communities.Event

    import Hackathon.CommunitiesFixtures

    @invalid_attrs %{description: nil, location: nil, name: nil}

    test "list_events/0 returns all events" do
      event = event_fixture()
      assert Communities.list_events() == [event]
    end

    test "get_event!/1 returns the event with given id" do
      event = event_fixture()
      assert Communities.get_event!(event.id) == event
    end

    test "create_event/1 with valid data creates a event" do
      valid_attrs = %{description: "some description", location: "some location", name: "some name"}

      assert {:ok, %Event{} = event} = Communities.create_event(valid_attrs)
      assert event.description == "some description"
      assert event.location == "some location"
      assert event.name == "some name"
    end

    test "create_event/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Communities.create_event(@invalid_attrs)
    end

    test "update_event/2 with valid data updates the event" do
      event = event_fixture()
      update_attrs = %{description: "some updated description", location: "some updated location", name: "some updated name"}

      assert {:ok, %Event{} = event} = Communities.update_event(event, update_attrs)
      assert event.description == "some updated description"
      assert event.location == "some updated location"
      assert event.name == "some updated name"
    end

    test "update_event/2 with invalid data returns error changeset" do
      event = event_fixture()
      assert {:error, %Ecto.Changeset{}} = Communities.update_event(event, @invalid_attrs)
      assert event == Communities.get_event!(event.id)
    end

    test "delete_event/1 deletes the event" do
      event = event_fixture()
      assert {:ok, %Event{}} = Communities.delete_event(event)
      assert_raise Ecto.NoResultsError, fn -> Communities.get_event!(event.id) end
    end

    test "change_event/1 returns a event changeset" do
      event = event_fixture()
      assert %Ecto.Changeset{} = Communities.change_event(event)
    end
  end
end
