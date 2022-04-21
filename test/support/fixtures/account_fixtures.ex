defmodule AsyncApp.AccountFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AsyncApp.Account` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        repository: "some repository",
        username: "some username"
      })
      |> AsyncApp.Account.create_user()

    user
  end
end
