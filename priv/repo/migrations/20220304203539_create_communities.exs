defmodule Hackathon.Repo.Migrations.CreateCommunities do
  use Ecto.Migration

  def change do
    create table(:communities) do
      add :name, :string
      add :description, :string
      add :visibility, :string
      add :location, :string
      add :coordinates, :map

      timestamps()
    end
  end
end
