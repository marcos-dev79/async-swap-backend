defmodule AsyncApp.GitRepo do
  @moduledoc """
  The GitRepo context.
  """

  import Ecto.Query, warn: false
  alias AsyncApp.Repo

  alias AsyncApp.GitRepo.Issue

  @doc """
  Returns the list of issues.

  ## Examples

      iex> list_issues()
      [%Issue{}, ...]

  """
  def list_issues do
    Repo.all(Issue)
  end

  @doc """
  Gets a single issue.

  Raises `Ecto.NoResultsError` if the Issue does not exist.

  ## Examples

      iex> get_issue!(123)
      %Issue{}

      iex> get_issue!(456)
      ** (Ecto.NoResultsError)

  """
  def get_issue!(id), do: Repo.get!(Issue, id)

  @doc """
  Creates a issue.

  ## Examples

      iex> create_issue(%{field: value})
      {:ok, %Issue{}}

      iex> create_issue(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_issue(attrs \\ %{}) do
    %Issue{}
    |> Issue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a issue.

  ## Examples

      iex> update_issue(issue, %{field: new_value})
      {:ok, %Issue{}}

      iex> update_issue(issue, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_issue(%Issue{} = issue, attrs) do
    issue
    |> Issue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a issue.

  ## Examples

      iex> delete_issue(issue)
      {:ok, %Issue{}}

      iex> delete_issue(issue)
      {:error, %Ecto.Changeset{}}

  """
  def delete_issue(%Issue{} = issue) do
    Repo.delete(issue)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking issue changes.

  ## Examples

      iex> change_issue(issue)
      %Ecto.Changeset{data: %Issue{}}

  """
  def change_issue(%Issue{} = issue, attrs \\ %{}) do
    Issue.changeset(issue, attrs)
  end

  alias AsyncApp.GitRepo.Contributor

  @doc """
  Returns the list of contributors.

  ## Examples

      iex> list_contributors()
      [%Contributor{}, ...]

  """
  def list_contributors do
    Repo.all(Contributor)
  end

  @doc """
  Gets a single contributor.

  Raises `Ecto.NoResultsError` if the Contributor does not exist.

  ## Examples

      iex> get_contributor!(123)
      %Contributor{}

      iex> get_contributor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_contributor!(id), do: Repo.get!(Contributor, id)

  @doc """
  Creates a contributor.

  ## Examples

      iex> create_contributor(%{field: value})
      {:ok, %Contributor{}}

      iex> create_contributor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_contributor(attrs \\ %{}) do
    %Contributor{}
    |> Contributor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a contributor.

  ## Examples

      iex> update_contributor(contributor, %{field: new_value})
      {:ok, %Contributor{}}

      iex> update_contributor(contributor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_contributor(%Contributor{} = contributor, attrs) do
    contributor
    |> Contributor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a contributor.

  ## Examples

      iex> delete_contributor(contributor)
      {:ok, %Contributor{}}

      iex> delete_contributor(contributor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_contributor(%Contributor{} = contributor) do
    Repo.delete(contributor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking contributor changes.

  ## Examples

      iex> change_contributor(contributor)
      %Ecto.Changeset{data: %Contributor{}}

  """
  def change_contributor(%Contributor{} = contributor, attrs \\ %{}) do
    Contributor.changeset(contributor, attrs)
  end



end
