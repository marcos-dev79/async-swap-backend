defmodule AsyncAppWeb.PageController do
  use AsyncAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
