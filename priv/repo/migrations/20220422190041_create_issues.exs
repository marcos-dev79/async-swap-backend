defmodule AsyncApp.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues) do
      add :title, :string
      add :authorandlabels, :string

      timestamps()
    end
  end
end
