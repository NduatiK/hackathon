defmodule Hackathon.ProfileTest do
  use Hackathon.DataCase

  alias Hackathon.Profile

  describe "interests" do
    alias Hackathon.Profile.Interest

    import Hackathon.ProfileFixtures

    @invalid_attrs %{name: nil}

    test "list_interests/0 returns all interests" do
      interest = interest_fixture()
      assert Profile.list_interests() == [interest]
    end

    test "get_interest!/1 returns the interest with given id" do
      interest = interest_fixture()
      assert Profile.get_interest!(interest.id) == interest
    end

    test "create_interest/1 with valid data creates a interest" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Interest{} = interest} = Profile.create_interest(valid_attrs)
      assert interest.name == "some name"
    end

    test "create_interest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_interest(@invalid_attrs)
    end

    test "update_interest/2 with valid data updates the interest" do
      interest = interest_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Interest{} = interest} = Profile.update_interest(interest, update_attrs)
      assert interest.name == "some updated name"
    end

    test "update_interest/2 with invalid data returns error changeset" do
      interest = interest_fixture()
      assert {:error, %Ecto.Changeset{}} = Profile.update_interest(interest, @invalid_attrs)
      assert interest == Profile.get_interest!(interest.id)
    end

    test "delete_interest/1 deletes the interest" do
      interest = interest_fixture()
      assert {:ok, %Interest{}} = Profile.delete_interest(interest)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_interest!(interest.id) end
    end

    test "change_interest/1 returns a interest changeset" do
      interest = interest_fixture()
      assert %Ecto.Changeset{} = Profile.change_interest(interest)
    end
  end

  describe "user_interests" do
    alias Hackathon.Profile.UserInterest

    import Hackathon.ProfileFixtures

    @invalid_attrs %{}

    test "list_user_interests/0 returns all user_interests" do
      user_interest = user_interest_fixture()
      assert Profile.list_user_interests() == [user_interest]
    end

    test "get_user_interest!/1 returns the user_interest with given id" do
      user_interest = user_interest_fixture()
      assert Profile.get_user_interest!(user_interest.id) == user_interest
    end

    test "create_user_interest/1 with valid data creates a user_interest" do
      valid_attrs = %{}

      assert {:ok, %UserInterest{} = user_interest} = Profile.create_user_interest(valid_attrs)
    end

    test "create_user_interest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Profile.create_user_interest(@invalid_attrs)
    end

    test "update_user_interest/2 with valid data updates the user_interest" do
      user_interest = user_interest_fixture()
      update_attrs = %{}

      assert {:ok, %UserInterest{} = user_interest} =
               Profile.update_user_interest(user_interest, update_attrs)
    end

    test "update_user_interest/2 with invalid data returns error changeset" do
      user_interest = user_interest_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Profile.update_user_interest(user_interest, @invalid_attrs)

      assert user_interest == Profile.get_user_interest!(user_interest.id)
    end

    test "delete_user_interest/1 deletes the user_interest" do
      user_interest = user_interest_fixture()
      assert {:ok, %UserInterest{}} = Profile.delete_user_interest(user_interest)
      assert_raise Ecto.NoResultsError, fn -> Profile.get_user_interest!(user_interest.id) end
    end

    test "change_user_interest/1 returns a user_interest changeset" do
      user_interest = user_interest_fixture()
      assert %Ecto.Changeset{} = Profile.change_user_interest(user_interest)
    end
  end
end
