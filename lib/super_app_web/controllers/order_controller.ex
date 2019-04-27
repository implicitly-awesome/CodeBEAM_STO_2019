defmodule SuperAppWeb.OrderController do
  use SuperAppWeb, :controller

  alias Plug.Conn

  def index(%Conn{} = conn, _params), do: json(conn, %{})

  def show(%Conn{} = conn, _params), do: json(conn, %{})

  def create(%Conn{} = conn, _params), do: json(conn, %{})

  def update(%Conn{} = conn, _params), do: json(conn, %{})

  def delete(%Conn{} = conn, _params), do: json(conn, %{})
end
