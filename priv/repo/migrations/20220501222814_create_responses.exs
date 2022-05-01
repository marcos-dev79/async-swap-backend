defmodule AsyncApp.Repo.Migrations.CreateResponses do
  use Ecto.Migration

  def change do
    create table(:responses) do
      add :response, :text

      timestamps()
    end
  end
end
