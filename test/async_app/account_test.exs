defmodule AsyncApp.AccountTest do
  use AsyncApp.DataCase

  alias AsyncApp.Account

  describe "users" do
    alias AsyncApp.Account.User

    import AsyncApp.AccountFixtures

    @invalid_attrs %{repository: nil, username: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{repository: "some repository", username: "some username"}

      assert {:ok, %User{} = user} = Account.create_user(valid_attrs)
      assert user.repository == "some repository"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{repository: "some updated repository", username: "some updated username"}

      assert {:ok, %User{} = user} = Account.update_user(user, update_attrs)
      assert user.repository == "some updated repository"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end

  describe "responses" do
    alias AsyncApp.Account.Response

    import AsyncApp.AccountFixtures

    @invalid_attrs %{response: nil}

    test "list_responses/0 returns all responses" do
      response = response_fixture()
      assert Account.list_responses() == [response]
    end

    test "get_response!/1 returns the response with given id" do
      response = response_fixture()
      assert Account.get_response!(response.id) == response
    end

    test "create_response/1 with valid data creates a response" do
      valid_attrs = %{response: "some response"}

      assert {:ok, %Response{} = response} = Account.create_response(valid_attrs)
      assert response.response == "some response"
    end

    test "create_response/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_response(@invalid_attrs)
    end

    test "update_response/2 with valid data updates the response" do
      response = response_fixture()
      update_attrs = %{response: "some updated response"}

      assert {:ok, %Response{} = response} = Account.update_response(response, update_attrs)
      assert response.response == "some updated response"
    end

    test "update_response/2 with invalid data returns error changeset" do
      response = response_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_response(response, @invalid_attrs)
      assert response == Account.get_response!(response.id)
    end

    test "delete_response/1 deletes the response" do
      response = response_fixture()
      assert {:ok, %Response{}} = Account.delete_response(response)
      assert_raise Ecto.NoResultsError, fn -> Account.get_response!(response.id) end
    end

    test "change_response/1 returns a response changeset" do
      response = response_fixture()
      assert %Ecto.Changeset{} = Account.change_response(response)
    end
  end
end
