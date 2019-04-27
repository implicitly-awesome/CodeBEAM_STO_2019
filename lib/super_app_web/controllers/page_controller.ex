defmodule SuperAppWeb.PageController do
  use SuperAppWeb, :controller

  alias Plug.Conn

  def index(%Conn{} = conn, _params), do: json(conn, %{app: "SuperApp", version: "0.1.0"})
end
