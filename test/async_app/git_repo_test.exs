defmodule AsyncApp.GitRepoTest do
  use AsyncApp.DataCase

  alias AsyncApp.GitRepo

  describe "issues" do
    alias AsyncApp.GitRepo.Issue

    import AsyncApp.GitRepoFixtures

    @invalid_attrs %{authorandlabels: nil, title: nil}

    test "list_issues/0 returns all issues" do
      issue = issue_fixture()
      assert GitRepo.list_issues() == [issue]
    end

    test "get_issue!/1 returns the issue with given id" do
      issue = issue_fixture()
      assert GitRepo.get_issue!(issue.id) == issue
    end

    test "create_issue/1 with valid data creates a issue" do
      valid_attrs = %{authorandlabels: "some authorandlabels", title: "some title"}

      assert {:ok, %Issue{} = issue} = GitRepo.create_issue(valid_attrs)
      assert issue.authorandlabels == "some authorandlabels"
      assert issue.title == "some title"
    end

    test "create_issue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GitRepo.create_issue(@invalid_attrs)
    end

    test "update_issue/2 with valid data updates the issue" do
      issue = issue_fixture()
      update_attrs = %{authorandlabels: "some updated authorandlabels", title: "some updated title"}

      assert {:ok, %Issue{} = issue} = GitRepo.update_issue(issue, update_attrs)
      assert issue.authorandlabels == "some updated authorandlabels"
      assert issue.title == "some updated title"
    end

    test "update_issue/2 with invalid data returns error changeset" do
      issue = issue_fixture()
      assert {:error, %Ecto.Changeset{}} = GitRepo.update_issue(issue, @invalid_attrs)
      assert issue == GitRepo.get_issue!(issue.id)
    end

    test "delete_issue/1 deletes the issue" do
      issue = issue_fixture()
      assert {:ok, %Issue{}} = GitRepo.delete_issue(issue)
      assert_raise Ecto.NoResultsError, fn -> GitRepo.get_issue!(issue.id) end
    end

    test "change_issue/1 returns a issue changeset" do
      issue = issue_fixture()
      assert %Ecto.Changeset{} = GitRepo.change_issue(issue)
    end
  end

  describe "contributors" do
    alias AsyncApp.GitRepo.Contributor

    import AsyncApp.GitRepoFixtures

    @invalid_attrs %{name: nil, qtd_commits: nil, user: nil}

    test "list_contributors/0 returns all contributors" do
      contributor = contributor_fixture()
      assert GitRepo.list_contributors() == [contributor]
    end

    test "get_contributor!/1 returns the contributor with given id" do
      contributor = contributor_fixture()
      assert GitRepo.get_contributor!(contributor.id) == contributor
    end

    test "create_contributor/1 with valid data creates a contributor" do
      valid_attrs = %{name: "some name", qtd_commits: 42, user: "some user"}

      assert {:ok, %Contributor{} = contributor} = GitRepo.create_contributor(valid_attrs)
      assert contributor.name == "some name"
      assert contributor.qtd_commits == 42
      assert contributor.user == "some user"
    end

    test "create_contributor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GitRepo.create_contributor(@invalid_attrs)
    end

    test "update_contributor/2 with valid data updates the contributor" do
      contributor = contributor_fixture()
      update_attrs = %{name: "some updated name", qtd_commits: 43, user: "some updated user"}

      assert {:ok, %Contributor{} = contributor} = GitRepo.update_contributor(contributor, update_attrs)
      assert contributor.name == "some updated name"
      assert contributor.qtd_commits == 43
      assert contributor.user == "some updated user"
    end

    test "update_contributor/2 with invalid data returns error changeset" do
      contributor = contributor_fixture()
      assert {:error, %Ecto.Changeset{}} = GitRepo.update_contributor(contributor, @invalid_attrs)
      assert contributor == GitRepo.get_contributor!(contributor.id)
    end

    test "delete_contributor/1 deletes the contributor" do
      contributor = contributor_fixture()
      assert {:ok, %Contributor{}} = GitRepo.delete_contributor(contributor)
      assert_raise Ecto.NoResultsError, fn -> GitRepo.get_contributor!(contributor.id) end
    end

    test "change_contributor/1 returns a contributor changeset" do
      contributor = contributor_fixture()
      assert %Ecto.Changeset{} = GitRepo.change_contributor(contributor)
    end
  end
end
