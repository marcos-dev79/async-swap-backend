defmodule AsyncApp.GitRepo.Contributor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contributors" do
    field :name, :string
    field :qtd_commits, :integer
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(contributor, attrs) do
    contributor
    |> cast(attrs, [:name, :user, :qtd_commits])
    |> validate_required([:name, :user, :qtd_commits])
  end
end
