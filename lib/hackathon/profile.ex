defmodule Hackathon.Profile do
  @moduledoc """
  The Profile context.
  """

  import Ecto.Query, warn: false
  alias Hackathon.Repo

  alias Hackathon.Profile.Interest
  alias Hackathon.Profile.UserInterest

  @doc """
  Returns the list of interests.

  ## Examples

      iex> list_interests()
      [%Interest{}, ...]

  """
  def list_interests do
    Repo.all(Interest)
  end

  def list_interests_for_user(user_id) do
    UserInterest
    |> where([ui], ui.user_id == ^user_id)
    |> preload(:interest)
    |> Repo.all()
  end

  @doc """
  Gets a single interest.

  Raises `Ecto.NoResultsError` if the Interest does not exist.

  ## Examples

      iex> get_interest!(123)
      %Interest{}

      iex> get_interest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_interest!(id), do: Repo.get!(Interest, id)

  @doc """
  Creates a interest.

  ## Examples

      iex> create_interest(%{field: value})
      {:ok, %Interest{}}

      iex> create_interest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_interest(attrs \\ %{}) do
    %Interest{}
    |> Interest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a interest.

  ## Examples

      iex> update_interest(interest, %{field: new_value})
      {:ok, %Interest{}}

      iex> update_interest(interest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_interest(%Interest{} = interest, attrs) do
    interest
    |> Interest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a interest.

  ## Examples

      iex> delete_interest(interest)
      {:ok, %Interest{}}

      iex> delete_interest(interest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_interest(%Interest{} = interest) do
    Repo.delete(interest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking interest changes.

  ## Examples

      iex> change_interest(interest)
      %Ecto.Changeset{data: %Interest{}}

  """
  def change_interest(%Interest{} = interest, attrs \\ %{}) do
    Interest.changeset(interest, attrs)
  end

  @doc """
  Returns the list of user_interests.

  ## Examples

      iex> list_user_interests()
      [%UserInterest{}, ...]

  """
  def list_user_interests do
    Repo.all(UserInterest)
  end

  @doc """
  Gets a single user_interest.

  Raises `Ecto.NoResultsError` if the User interest does not exist.

  ## Examples

      iex> get_user_interest!(123)
      %UserInterest{}

      iex> get_user_interest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_interest!(id), do: Repo.get!(UserInterest, id)

  @doc """
  Creates a user_interest.

  ## Examples

      iex> create_user_interest(%{field: value})
      {:ok, %UserInterest{}}

      iex> create_user_interest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_interest(attrs \\ %{}) do
    %UserInterest{}
    |> UserInterest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_interest.

  ## Examples

      iex> update_user_interest(user_interest, %{field: new_value})
      {:ok, %UserInterest{}}

      iex> update_user_interest(user_interest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_interest(%UserInterest{} = user_interest, attrs) do
    user_interest
    |> UserInterest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_interest.

  ## Examples

      iex> delete_user_interest(user_interest)
      {:ok, %UserInterest{}}

      iex> delete_user_interest(user_interest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_interest(%UserInterest{} = user_interest) do
    Repo.delete(user_interest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_interest changes.

  ## Examples

      iex> change_user_interest(user_interest)
      %Ecto.Changeset{data: %UserInterest{}}

  """
  def change_user_interest(%UserInterest{} = user_interest, attrs \\ %{}) do
    UserInterest.changeset(user_interest, attrs)
  end
end
