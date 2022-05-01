defmodule AsyncApp.Account.Response do
  use Ecto.Schema
  import Ecto.Changeset

  schema "responses" do
    field :response, :string

    timestamps()
  end

  @doc false
  def changeset(response, attrs) do
    response
    |> cast(attrs, [:response])
    |> validate_required([:response])
  end
end
