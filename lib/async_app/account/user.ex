defmodule AsyncApp.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :repository, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :repository])
    |> validate_required([:username, :repository])
  end
end
