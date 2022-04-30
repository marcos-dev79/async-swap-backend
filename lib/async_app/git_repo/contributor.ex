defmodule AsyncApp.GitRepo.Contributor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contributors" do
    field :name, :string
    field :user, :string
    field :qtd_commits, :integer
    field :repository, :string

    timestamps()
  end

  @doc false
  def changeset(contributor, attrs) do
    contributor
    |> cast(attrs, [:name, :user, :qtd_commits, :repository])
    |> validate_required([:name, :user, :qtd_commits, :repository])
  end
end
