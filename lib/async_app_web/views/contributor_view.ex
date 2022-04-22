defmodule AsyncAppWeb.ContributorView do
  use AsyncAppWeb, :view
  alias AsyncAppWeb.ContributorView

  def render("index.json", %{contributors: contributors}) do
    %{data: render_many(contributors, ContributorView, "contributor.json")}
  end

  def render("show.json", %{contributor: contributor}) do
    %{data: render_one(contributor, ContributorView, "contributor.json")}
  end

  def render("contributor.json", %{contributor: contributor}) do
    %{
      id: contributor.id,
      name: contributor.name,
      user: contributor.user,
      qtd_commits: contributor.qtd_commits
    }
  end
end
