defmodule AsyncApp.GitRepo.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "issues" do
    field :authorandlabels, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(issue, attrs) do
    issue
    |> cast(attrs, [:title, :authorandlabels])
    |> validate_required([:title, :authorandlabels])
  end
end
