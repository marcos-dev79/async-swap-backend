defmodule AsyncApp.GitRepoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AsyncApp.GitRepo` context.
  """

  @doc """
  Generate a issue.
  """
  def issue_fixture(attrs \\ %{}) do
    {:ok, issue} =
      attrs
      |> Enum.into(%{
        authorandlabels: "some authorandlabels",
        title: "some title"
      })
      |> AsyncApp.GitRepo.create_issue()

    issue
  end

  @doc """
  Generate a contributor.
  """
  def contributor_fixture(attrs \\ %{}) do
    {:ok, contributor} =
      attrs
      |> Enum.into(%{
        name: "some name",
        qtd_commits: 42,
        user: "some user"
      })
      |> AsyncApp.GitRepo.create_contributor()

    contributor
  end
end
