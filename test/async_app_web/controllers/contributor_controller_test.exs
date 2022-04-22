defmodule AsyncAppWeb.ContributorControllerTest do
  use AsyncAppWeb.ConnCase

  import AsyncApp.GitRepoFixtures

  alias AsyncApp.GitRepo.Contributor

  @create_attrs %{
    name: "some name",
    qtd_commits: 42,
    user: "some user"
  }
  @update_attrs %{
    name: "some updated name",
    qtd_commits: 43,
    user: "some updated user"
  }
  @invalid_attrs %{name: nil, qtd_commits: nil, user: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all contributors", %{conn: conn} do
      conn = get(conn, Routes.contributor_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create contributor" do
    test "renders contributor when data is valid", %{conn: conn} do
      conn = post(conn, Routes.contributor_path(conn, :create), contributor: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.contributor_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some name",
               "qtd_commits" => 42,
               "user" => "some user"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.contributor_path(conn, :create), contributor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update contributor" do
    setup [:create_contributor]

    test "renders contributor when data is valid", %{conn: conn, contributor: %Contributor{id: id} = contributor} do
      conn = put(conn, Routes.contributor_path(conn, :update, contributor), contributor: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.contributor_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "qtd_commits" => 43,
               "user" => "some updated user"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, contributor: contributor} do
      conn = put(conn, Routes.contributor_path(conn, :update, contributor), contributor: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete contributor" do
    setup [:create_contributor]

    test "deletes chosen contributor", %{conn: conn, contributor: contributor} do
      conn = delete(conn, Routes.contributor_path(conn, :delete, contributor))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.contributor_path(conn, :show, contributor))
      end
    end
  end

  defp create_contributor(_) do
    contributor = contributor_fixture()
    %{contributor: contributor}
  end
end
