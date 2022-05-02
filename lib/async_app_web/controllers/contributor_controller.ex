defmodule AsyncAppWeb.ContributorController do
  use AsyncAppWeb, :controller

  alias AsyncApp.GitRepo
  alias AsyncApp.GitRepo.Contributor

  action_fallback AsyncAppWeb.FallbackController

  def index(conn, _params) do
    contributors = GitRepo.list_contributors()
    render(conn, "index.json", contributors: contributors)
  end

  def create(conn, %{"contributor" => contributor_params}) do
    with {:ok, %Contributor{} = contributor} <- GitRepo.create_contributor(contributor_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.contributor_path(conn, :show, contributor))
      |> render("show.json", contributor: contributor)
    end
  end

  def show(conn, %{"id" => id}) do
    contributor = GitRepo.get_contributor!(id)
    render(conn, "show.json", contributor: contributor)
  end

  def update(conn, %{"id" => id, "contributor" => contributor_params}) do
    contributor = GitRepo.get_contributor!(id)

    with {:ok, %Contributor{} = contributor} <- GitRepo.update_contributor(contributor, contributor_params) do
      render(conn, "show.json", contributor: contributor)
    end
  end

  def delete(conn, %{"id" => id}) do
    contributor = GitRepo.get_contributor!(id)

    with {:ok, %Contributor{}} <- GitRepo.delete_contributor(contributor) do
      send_resp(conn, :no_content, "")
    end
  end

end
