defmodule Hackathon.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :description, :string
      add :location, :string
      add :community, references(:communities, on_delete: :nothing)
      add :organizer, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:events, [:community])
    create index(:events, [:organizer])
  end
end
