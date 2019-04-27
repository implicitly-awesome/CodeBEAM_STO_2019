defmodule SuperAppWeb.PageController do
  use SuperAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
