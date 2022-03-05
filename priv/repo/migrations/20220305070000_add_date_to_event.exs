defmodule Hackathon.Repo.Migrations.AddDateToEvent do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :date, :naive_datetime
    end
  end
end
