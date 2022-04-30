defmodule AsyncApp.GitRepo.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "issues" do
    field :title, :string
    field :authorandlabels, :string
    field :repository, :string

    timestamps()
  end

  @doc false
  def changeset(issue, attrs) do
    issue
    |> cast(attrs, [:title, :authorandlabels, :repository])
    |> validate_required([:title, :authorandlabels, :repository])
  end
end
