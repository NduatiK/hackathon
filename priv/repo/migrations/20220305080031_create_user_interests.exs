defmodule Hackathon.Repo.Migrations.CreateUserInterests do
  use Ecto.Migration

  def change do
    create table(:user_interests) do
      add :interest_id, references(:interest, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:user_interests, [:interest_id])
    create index(:user_interests, [:user_id])
  end
end
