defmodule Hackathon.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :sentiment, :string
      add :emotion, :string
      add :text, :string
      add :from, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:from])
  end
end
