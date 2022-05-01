defmodule AsyncAppWeb.ResponseController do
  use AsyncAppWeb, :controller

  alias AsyncApp.Account
  alias AsyncApp.Account.Response

  action_fallback AsyncAppWeb.FallbackController

  def index(conn, _params) do
    responses = Account.list_responses()
    render(conn, "index.json", responses: responses)
  end

  def create(conn, %{"response" => response_params}) do
    with {:ok, %Response{} = response} <- Account.create_response(response_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.response_path(conn, :show, response))
      |> render("show.json", response: response)
    end
  end

  def show(conn, %{"id" => id}) do
    response = Account.get_response!(id)
    render(conn, "show.json", response: response)
  end

  def update(conn, %{"id" => id, "response" => response_params}) do
    response = Account.get_response!(id)

    with {:ok, %Response{} = response} <- Account.update_response(response, response_params) do
      render(conn, "show.json", response: response)
    end
  end

  def delete(conn, %{"id" => id}) do
    response = Account.get_response!(id)

    with {:ok, %Response{}} <- Account.delete_response(response) do
      send_resp(conn, :no_content, "")
    end
  end
end
